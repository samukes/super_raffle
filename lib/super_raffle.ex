defmodule SuperRaffle do
  @moduledoc """
  SuperRaffle keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defmodule Schema do
    @moduledoc """
    Schema module to be used by context schemas.
    """

    defmacro __using__(_opts) do
      quote do
        use Ecto.Schema
        import Ecto.Changeset

        @primary_key {:id, :binary_id, autogenerate: true}
        @foreign_key_type :binary_id
      end
    end
  end
end
