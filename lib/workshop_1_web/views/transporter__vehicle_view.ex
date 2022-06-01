defmodule Workshop1Web.Transporter_VehicleView do
  use Workshop1Web, :view
  alias Workshop1Web.Transporter_VehicleView

  def render("index.json", %{transporter_vehicle: transporter_vehicle}) do
    %{data: render_many(transporter_vehicle, Transporter_VehicleView, "transporter__vehicle.json")}
  end

  def render("show.json", %{transporter__vehicle: transporter__vehicle}) do
    %{data: render_one(transporter__vehicle, Transporter_VehicleView, "transporter__vehicle.json")}
  end

  def render("transporter__vehicle.json", %{transporter__vehicle: transporter__vehicle}) do
    %{
      id: transporter__vehicle.id,
      transporter_id: transporter__vehicle.transporter_id,
      vehicle_id: transporter__vehicle.vehicle_id
    }
  end
end
