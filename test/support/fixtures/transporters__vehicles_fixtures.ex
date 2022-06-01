defmodule Workshop1.Transporters_VehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Workshop1.Transporters_Vehicles` context.
  """

  @doc """
  Generate a transporter__vehicle.
  """
  def transporter__vehicle_fixture(attrs \\ %{}) do
    {:ok, transporter__vehicle} =
      attrs
      |> Enum.into(%{
        transporter_id: "some transporter_id",
        vehicle_id: "some vehicle_id"
      })
      |> Workshop1.Transporters_Vehicles.create_transporter__vehicle()

    transporter__vehicle
  end
end
