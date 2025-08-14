defmodule SuperRaffle.Repo.Migrations.CreateTableRaffle do
  use Ecto.Migration

  def change do
    create table(:raffles) do
      add :name, :string
      add :description, :string
      add :start_date, :naive_datetime
      add :end_date, :naive_datetime

      timestamps()
    end

    create index(:raffles, [:name])
    create index(:raffles, [:start_date])
    create index(:raffles, [:end_date])
  end
end
