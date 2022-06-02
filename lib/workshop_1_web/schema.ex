defmodule Workshop1Web.Schema do
  use Absinthe.Schema

  alias Workshop1Web.Resolvers.Transporter
  alias Workshop1Web.Resolvers.Vehicle

  import_types(Workshop1Web.Schema.Transporter)
  import_types(Workshop1Web.Schema.Vehicle)


  query do
    @desc "Get all transporters"
    field :transporter, list_of(:transporter) do
      resolve &Transporter.list_transporters/3
    end

    @desc "Get all vehicle"
    field :vehicle, list_of(:vehicle) do
      resolve &Vehicle.list_vehicles/3
    end
  end

  mutation do
    field :create_transporter, :transporter do
      arg(:input, :transporter_input)
      resolve(&Transporter.create_transporters/3)
    end

    field :create_vehicle, :vehicle do
      arg(:input, :vehicle_input)
      resolve(&Vehicle.create_vehicle/3)
    end
  end
end
