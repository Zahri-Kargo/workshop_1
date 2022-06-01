defmodule Workshop1Web.Transporter_VehicleController do
  use Workshop1Web, :controller

  alias Workshop1.Transporters_Vehicles
  alias Workshop1.Transporters_Vehicles.Transporter_Vehicle

  action_fallback Workshop1Web.FallbackController

  def index(conn, _params) do
    transporter_vehicle = Transporters_Vehicles.list_transporter_vehicle()
    render(conn, "index.json", transporter_vehicle: transporter_vehicle)
  end

  def create(conn, %{"transporter__vehicle" => transporter__vehicle_params}) do
    with {:ok, %Transporter_Vehicle{} = transporter__vehicle} <- Transporters_Vehicles.create_transporter__vehicle(transporter__vehicle_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.transporter__vehicle_path(conn, :show, transporter__vehicle))
      |> render("show.json", transporter__vehicle: transporter__vehicle)
    end
  end

  def show(conn, %{"id" => id}) do
    transporter__vehicle = Transporters_Vehicles.get_transporter__vehicle!(id)
    render(conn, "show.json", transporter__vehicle: transporter__vehicle)
  end

  def update(conn, %{"id" => id, "transporter__vehicle" => transporter__vehicle_params}) do
    transporter__vehicle = Transporters_Vehicles.get_transporter__vehicle!(id)

    with {:ok, %Transporter_Vehicle{} = transporter__vehicle} <- Transporters_Vehicles.update_transporter__vehicle(transporter__vehicle, transporter__vehicle_params) do
      render(conn, "show.json", transporter__vehicle: transporter__vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    transporter__vehicle = Transporters_Vehicles.get_transporter__vehicle!(id)

    with {:ok, %Transporter_Vehicle{}} <- Transporters_Vehicles.delete_transporter__vehicle(transporter__vehicle) do
      send_resp(conn, :no_content, "")
    end
  end
end
