defmodule StrawHat.Review.Repo.Migrations.CreateAchievementsTable do
  use Ecto.Migration

  def change do
    create table(:achievements, primary_key: false) do
      add(:owner_id, :string, null: false)
      add(:achievement_badge_id, references(:achievement_badges), primary_key: true, on_delete: :delete_all)
    end
  end
end
