defmodule Workshop1.Repo.Migrations.AddTransporterIdVehicles do
  use Ecto.Migration

  def change do
    alter table("vehicles") do
      add :transporter_id, references("transporters")
    end
  end
end
