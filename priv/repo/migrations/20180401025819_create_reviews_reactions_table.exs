defmodule StrawHat.Review.Repo.Migrations.CreateReviewsReactionsTable do
  use Ecto.Migration

  def change do
    create table(:reviews_reactions) do
      add(:user_id, :string, null: false)
      add(:review_id, references(:reviews))
      add(:reaction_id, references(:reactions))

      timestamps()
    end

    create(index(:reviews_reactions, [:user_id, :review_id], unique: true))
  end
end