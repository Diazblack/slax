defmodule Slax.Chat do
  alias Slax.Chat.Room
  alias Slax.Repo

  import Ecto.Query

  def list_rooms(), do: from(Room, order_by: [asc: :name]) |> Repo.all()

  def get_room!(id), do: Repo.get!(Room, id)
end
