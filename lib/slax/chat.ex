defmodule Slax.Chat do
  alias Slax.Chat.Room
  alias Slax.Repo

  import Ecto.Query

  def list_rooms(), do: from(Room, order_by: [asc: :name]) |> Repo.all()

  def get_room!(id), do: Repo.get!(Room, id)

  def create_room(attrs) do
    attrs |> put_change() |> Repo.insert()
  end

  def update_room(room, attrs) do
    room |> put_change(attrs) |> Repo.update()
  end

  defp put_change(room \\ %Room{}, attr) do
    room |> Room.changeset(attr)
  end
end
