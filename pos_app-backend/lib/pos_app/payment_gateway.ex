# lib/pos_app/payment_gateway.ex
defmodule PosApp.PaymentGateway do
  @api_key Application.get_env(:pos_app, :payment_gateway)[:api_key]
  @base_url "https://api.paymentgateway.com"

  def charge(amount, currency, token) do
    body = %{amount: amount, currency: currency, token: token}

    case HTTPoison.post("#{@base_url}/charge", Poison.encode!(body), headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
        {:error, body}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp headers() do
    %{
      "Authorization" => "Bearer #{@api_key}",
      "Content-Type" => "application/json"
    }
  end
end
