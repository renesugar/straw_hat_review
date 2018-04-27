defmodule StrawHat.Review.Repo.Migrations.CreateReviewsTable do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      # the object or user that receive the review
      add(:reviewee_id, :string, null: false)
      # the user that make the comment
      add(:reviewer_id, :string, null: false)
      add(:comment, :text, null: false)

      timestamps()
    end
  end
end
