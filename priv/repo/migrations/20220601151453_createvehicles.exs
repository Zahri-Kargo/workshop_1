defmodule Workshop1.Repo.Migrations.Createvehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :license_plate, :string
      add :status, :string
      # add :transporter_id, references("transporters")
      timestamps()
    end
    create index("vehicles",[:license_plate], unique: true)
  end
end
