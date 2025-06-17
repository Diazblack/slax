defmodule Slax.Chat do
  alias Slax.Chat.Message
  alias Slax.Chat.Room
  alias Slax.Repo

  import Ecto.Query

  def list_rooms(), do: from(Room, order_by: [asc: :name]) |> Repo.all()

  def get_room!(id), do: Repo.get!(Room, id)

  def create_room(attrs) do
    attrs |> change_room() |> Repo.insert()
  end

  def update_room(room, attrs) do
    room |> change_room(attrs) |> Repo.update()
  end

  def change_room(room \\ %Room{}, attr \\ %{}) do
    room |> Room.changeset(attr)
  end

  def list_message_in_room(%Room{id: room_id}) do
    from(m in Message,
      where: m.room_id == ^room_id,
      order_by: [asc: :inserted_at, asc: :id],
      preload: [:user]
    )
    |> Repo.all()
  end
end
