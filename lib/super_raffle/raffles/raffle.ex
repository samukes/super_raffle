defmodule SuperRaffle.Raffles.Raffle do
  @moduledoc """
  Raffle schema.
  """

  use SuperRaffle.Schema

  @type t :: %__MODULE__{
          id: Ecto.UUID.t(),
          name: String.t(),
          description: String.t(),
          start_date: NaiveDateTime.t(),
          end_date: NaiveDateTime.t(),
          inserted_at: DateTime.t(),
          updated_at: DateTime.t()
        }

  @type attrs :: [
          name: String.t(),
          description: String.t(),
          start_date: NaiveDateTime.t(),
          end_date: NaiveDateTime.t()
        ]

  schema "raffles" do
    field :name, :string
    field :description, :string
    field :start_date, :naive_datetime
    field :end_date, :naive_datetime

    timestamps()
  end

  @spec new() :: t()
  def new() do
    %__MODULE__{}
  end

  @spec changeset(t(), attrs()) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = raffle, attrs \\ []) do
    raffle
    |> cast(attrs, [:name, :description, :start_date, :end_date])
    |> validate_required([:name, :description, :start_date, :end_date])
    |> validate_dates()
  end

  defp validate_dates(changeset) do
    start_date = get_change(changeset, :start_date)
    end_date = get_change(changeset, :end_date)

    if Timex.compare(start_date, end_date) == 1 do
      add_error(changeset, :end_date, "End date must be after start date")
    else
      changeset
    end
  end
end
