# lib/pos_app_web/controllers/report_controller.ex
defmodule PosAppWeb.ReportController do
  use PosAppWeb, :controller

  alias PosApp.Reports

  def sales_report(conn, _params) do
    report = Reports.generate_sales_report()
    json(conn, %{report: report})
  end

  def inventory_report(conn, _params) do
    report = Reports.generate_inventory_report()
    json(conn, %{report: report})
  end

  def financial_report(conn, _params) do
    report = Reports.generate_financial_report()
    json(conn, %{report: report})
  end
end
