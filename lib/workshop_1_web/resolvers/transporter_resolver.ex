defmodule Workshop1Web.Resolvers.Transporter do
  alias Workshop1Web.Schema
  def list_transporters(_parent, _args, _resolution) do
    {:ok, Schema.list_transporters()}
  end

  @spec create_transporters(
          any,
          %{
            :input => :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any},
            optional(any) => any
          },
          any
        ) :: any
  def create_transporters(_parent, %{input: params}, _resolution) do
    Schema.create_transporters(params)
  end
end
