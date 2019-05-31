defmodule GoalsystemWeb.Pow.Routes do
  use Pow.Phoenix.Routes
  alias GoalsystemWeb.Router.Helpers, as: Routes

  def after_sign_out_path(conn), do: Routes.page_path(conn, :index)
end
