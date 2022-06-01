defmodule Workshop1.Transporters_Vehicles do
  @moduledoc """
  The Transporters_Vehicles context.
  """

  import Ecto.Query, warn: false
  alias Workshop1.Repo

  alias Workshop1.Transporters_Vehicles.Transporter_Vehicle

  @doc """
  Returns the list of transporter_vehicle.

  ## Examples

      iex> list_transporter_vehicle()
      [%Transporter_Vehicle{}, ...]

  """
  def list_transporter_vehicle do
    query = Ecto.Query.from tv in "transporter_vehicles",
            left_join: t in "transporters",
            left_join: v in "vehicles",
            on: tv.transporter_id == t.id,
            on: tv.vehicle_id == v.id,
            select: %{id: tv.id, transporter_id: tv.transporter_id, vehicle_id: tv.vehicle_id, vehicle: %{
              id: v.id,
              vehicle_plate: v.vehicle_plate,
              status: v.status
            },
            transporter: %{
              id: t.id,
              name: t.name,
              phone_number: t.phone_number,
              npwp_number: t.npwp_number
            }
          }
    Repo.all(query)
  end

  @doc """
  Gets a single transporter__vehicle.

  Raises `Ecto.NoResultsError` if the Transporter  vehicle does not exist.

  ## Examples

      iex> get_transporter__vehicle!(123)
      %Transporter_Vehicle{}

      iex> get_transporter__vehicle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transporter__vehicle!(id), do: Repo.get!(Transporter_Vehicle, id)

  @doc """
  Creates a transporter__vehicle.

  ## Examples

      iex> create_transporter__vehicle(%{field: value})
      {:ok, %Transporter_Vehicle{}}

      iex> create_transporter__vehicle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transporter__vehicle(attrs \\ %{}) do
    %Transporter_Vehicle{}
    |> Transporter_Vehicle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transporter__vehicle.

  ## Examples

      iex> update_transporter__vehicle(transporter__vehicle, %{field: new_value})
      {:ok, %Transporter_Vehicle{}}

      iex> update_transporter__vehicle(transporter__vehicle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transporter__vehicle(%Transporter_Vehicle{} = transporter__vehicle, attrs) do
    transporter__vehicle
    |> Transporter_Vehicle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transporter__vehicle.

  ## Examples

      iex> delete_transporter__vehicle(transporter__vehicle)
      {:ok, %Transporter_Vehicle{}}

      iex> delete_transporter__vehicle(transporter__vehicle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transporter__vehicle(%Transporter_Vehicle{} = transporter__vehicle) do
    Repo.delete(transporter__vehicle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transporter__vehicle changes.

  ## Examples

      iex> change_transporter__vehicle(transporter__vehicle)
      %Ecto.Changeset{data: %Transporter_Vehicle{}}

  """
  def change_transporter__vehicle(%Transporter_Vehicle{} = transporter__vehicle, attrs \\ %{}) do
    Transporter_Vehicle.changeset(transporter__vehicle, attrs)
  end
end
