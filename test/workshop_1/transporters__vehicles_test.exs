defmodule Workshop1.Transporters_VehiclesTest do
  use Workshop1.DataCase

  alias Workshop1.Transporters_Vehicles

  describe "transporter_vehicle" do
    alias Workshop1.Transporters_Vehicles.Transporter_Vehicle

    import Workshop1.Transporters_VehiclesFixtures

    @invalid_attrs %{transporter_id: nil, vehicle_id: nil}

    test "list_transporter_vehicle/0 returns all transporter_vehicle" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert Transporters_Vehicles.list_transporter_vehicle() == [transporter__vehicle]
    end

    test "get_transporter__vehicle!/1 returns the transporter__vehicle with given id" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert Transporters_Vehicles.get_transporter__vehicle!(transporter__vehicle.id) == transporter__vehicle
    end

    test "create_transporter__vehicle/1 with valid data creates a transporter__vehicle" do
      valid_attrs = %{transporter_id: "some transporter_id", vehicle_id: "some vehicle_id"}

      assert {:ok, %Transporter_Vehicle{} = transporter__vehicle} = Transporters_Vehicles.create_transporter__vehicle(valid_attrs)
      assert transporter__vehicle.transporter_id == "some transporter_id"
      assert transporter__vehicle.vehicle_id == "some vehicle_id"
    end

    test "create_transporter__vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transporters_Vehicles.create_transporter__vehicle(@invalid_attrs)
    end

    test "update_transporter__vehicle/2 with valid data updates the transporter__vehicle" do
      transporter__vehicle = transporter__vehicle_fixture()
      update_attrs = %{transporter_id: "some updated transporter_id", vehicle_id: "some updated vehicle_id"}

      assert {:ok, %Transporter_Vehicle{} = transporter__vehicle} = Transporters_Vehicles.update_transporter__vehicle(transporter__vehicle, update_attrs)
      assert transporter__vehicle.transporter_id == "some updated transporter_id"
      assert transporter__vehicle.vehicle_id == "some updated vehicle_id"
    end

    test "update_transporter__vehicle/2 with invalid data returns error changeset" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Transporters_Vehicles.update_transporter__vehicle(transporter__vehicle, @invalid_attrs)
      assert transporter__vehicle == Transporters_Vehicles.get_transporter__vehicle!(transporter__vehicle.id)
    end

    test "delete_transporter__vehicle/1 deletes the transporter__vehicle" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert {:ok, %Transporter_Vehicle{}} = Transporters_Vehicles.delete_transporter__vehicle(transporter__vehicle)
      assert_raise Ecto.NoResultsError, fn -> Transporters_Vehicles.get_transporter__vehicle!(transporter__vehicle.id) end
    end

    test "change_transporter__vehicle/1 returns a transporter__vehicle changeset" do
      transporter__vehicle = transporter__vehicle_fixture()
      assert %Ecto.Changeset{} = Transporters_Vehicles.change_transporter__vehicle(transporter__vehicle)
    end
  end
end
