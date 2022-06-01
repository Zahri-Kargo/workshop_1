defmodule Workshop1.Repo.Migrations.CreateTransporter do
  use Ecto.Migration

  def change do
    create table(:transporters) do
      add :name, :string
      add :phone_number, :string
      add :npwp_number, :string
      add :status, :string

      timestamps()
    end

    create index("transporters",[:npwp_number], unique: true)
  end
end
