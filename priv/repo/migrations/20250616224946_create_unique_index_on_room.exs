defmodule Slax.Repo.Migrations.CreateUniqueIndexOnRoom do
  use Ecto.Migration

  def up do
    create unique_index(:rooms, :name)
  end

  def down do
    drop unique_index(:rooms, :name)
  end
end
