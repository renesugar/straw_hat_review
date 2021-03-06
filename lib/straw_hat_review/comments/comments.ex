defmodule StrawHat.Review.Comments do
  @moduledoc """
  Interactor module that defines all the functionality for Comments management.
  """

  use StrawHat.Review.Interactor
  alias StrawHat.Review.Comment

  @doc """
  Gets the list of comments.
  """
  @since "1.0.0"
  @spec get_comments(Scrivener.Config.t()) :: Scrivener.Page.t()
  def get_comments(pagination \\ []), do: Repo.paginate(Comment, pagination)

  @doc """
  Creates comment.
  """
  @since "1.0.0"
  @spec create_comment(Comment.comment_attrs()) ::
          {:ok, Comment.t()} | {:error, Ecto.Changeset.t()}
  def create_comment(comment_attrs) do
    %Comment{}
    |> Comment.changeset(comment_attrs)
    |> Repo.insert()
  end

  @doc """
  Updates comment.
  """
  @since "1.0.0"
  @spec update_comment(Comment.t(), Comment.comment_attrs()) ::
          {:ok, Comment.t()} | {:error, Ecto.Changeset.t()}
  def update_comment(%Comment{} = comment, comment_attrs) do
    comment
    |> Comment.changeset(comment_attrs)
    |> Repo.update()
  end

  @doc """
  Destroys comment.
  """
  @since "1.0.0"
  @spec destroy_comment(Comment.t()) :: {:ok, Comment.t()} | {:error, Ecto.Changeset.t()}
  def destroy_comment(%Comment{} = comment), do: Repo.delete(comment)

  @doc """
  Finds comment by `id`.
  """
  @since "1.0.0"
  @spec find_comment(Integer.t()) :: {:ok, Comment.t()} | {:error, Error.t()}
  def find_comment(comment_id) do
    comment_id
    |> get_comment()
    |> Response.from_value(
      Error.new(
        "straw_hat_review.comment.not_found",
        metadata: [comment_id: comment_id]
      )
    )
  end

  @doc """
  Gets comment by `id`.
  """
  @since "1.0.0"
  @spec get_comment(Integer.t()) :: Comment.t() | nil | no_return
  def get_comment(comment_id), do: Repo.get(Comment, comment_id)

  @doc """
  Gets list of comment by ids.
  """
  @since "1.0.0"
  @spec get_comment_by_ids([Integer.t()]) :: [Comment.t()] | no_return
  def get_comment_by_ids(comment_ids) do
    query = from(comment in Comment, where: comment.id in ^comment_ids)
    Repo.all(query)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.
  """
  @since "1.0.0"
  @spec change_comment(Comment.t()) :: Ecto.Changeset.t()
  def change_comment(%Comment{} = comment) do
    Comment.changeset(comment, %{})
  end
end
