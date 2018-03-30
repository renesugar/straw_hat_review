defmodule StrawHat.Review.Interactor do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      alias StrawHat.Error
      alias StrawHat.Review.Repo
      import Ecto.Query, only: [from: 2]
    end
  end
end