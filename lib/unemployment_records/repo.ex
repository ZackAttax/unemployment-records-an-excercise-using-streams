defmodule UnemploymentRecords.Repo do
  use Ecto.Repo,
    otp_app: :unemployment_records,
    adapter: Ecto.Adapters.Postgres
end
