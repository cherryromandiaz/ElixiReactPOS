# lib/pos_app/guardian.ex
defmodule PosApp.Guardian do
  use Guardian, otp_app: :pos_app

  alias PosApp.Accounts

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    user_id = claims["sub"]
    user = Accounts.get_user!(user_id)
    {:ok, user}
  end
end
