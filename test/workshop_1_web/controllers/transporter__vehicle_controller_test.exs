defmodule Workshop1Web.Transporter_VehicleControllerTest do
  use Workshop1Web.ConnCase

  import Workshop1.Transporters_VehiclesFixtures

  alias Workshop1.Transporters_Vehicles.Transporter_Vehicle

  @create_attrs %{
    transporter_id: "some transporter_id",
    vehicle_id: "some vehicle_id"
  }
  @update_attrs %{
    transporter_id: "some updated transporter_id",
    vehicle_id: "some updated vehicle_id"
  }
  @invalid_attrs %{transporter_id: nil, vehicle_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all transporter_vehicle", %{conn: conn} do
      conn = get(conn, Routes.transporter__vehicle_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create transporter__vehicle" do
    test "renders transporter__vehicle when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transporter__vehicle_path(conn, :create), transporter__vehicle: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.transporter__vehicle_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "transporter_id" => "some transporter_id",
               "vehicle_id" => "some vehicle_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transporter__vehicle_path(conn, :create), transporter__vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update transporter__vehicle" do
    setup [:create_transporter__vehicle]

    test "renders transporter__vehicle when data is valid", %{conn: conn, transporter__vehicle: %Transporter_Vehicle{id: id} = transporter__vehicle} do
      conn = put(conn, Routes.transporter__vehicle_path(conn, :update, transporter__vehicle), transporter__vehicle: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.transporter__vehicle_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "transporter_id" => "some updated transporter_id",
               "vehicle_id" => "some updated vehicle_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, transporter__vehicle: transporter__vehicle} do
      conn = put(conn, Routes.transporter__vehicle_path(conn, :update, transporter__vehicle), transporter__vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete transporter__vehicle" do
    setup [:create_transporter__vehicle]

    test "deletes chosen transporter__vehicle", %{conn: conn, transporter__vehicle: transporter__vehicle} do
      conn = delete(conn, Routes.transporter__vehicle_path(conn, :delete, transporter__vehicle))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.transporter__vehicle_path(conn, :show, transporter__vehicle))
      end
    end
  end

  defp create_transporter__vehicle(_) do
    transporter__vehicle = transporter__vehicle_fixture()
    %{transporter__vehicle: transporter__vehicle}
  end
end
