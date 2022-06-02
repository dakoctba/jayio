defmodule Jayio.Repo do
  use Ecto.Repo,
    otp_app: :jayio,
    adapter: Ecto.Adapters.Postgres
end
