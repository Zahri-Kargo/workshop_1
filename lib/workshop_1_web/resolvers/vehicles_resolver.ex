defmodule Workshop1Web.Resolvers.Vehicle do

  def list_vehicles(_parent, _args, _resolution) do
    {:ok, Workshop1Web.Vehicles.list_vehicles()}
  end

  def create_vehicle(_parent, %{input: params}, _resolution) do
    Workshop1Web.Vehicles.create_vehicle(params)
    # {:error, "Something went wrong"}
  end
end
