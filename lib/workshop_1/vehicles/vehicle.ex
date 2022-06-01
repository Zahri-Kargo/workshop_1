defmodule Workshop1.Vehicles.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vehicles" do
    field :status, Ecto.Enum, values: [:validated, :not_validated], default: :not_validated
    field :lisence_plate, :string

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:license_plate])
    |> validate_required([:license_plate])
  end
end
