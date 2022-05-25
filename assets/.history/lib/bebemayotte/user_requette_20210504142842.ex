defmodule Bebemayotte.UserRequette do
  import Ecto.Query, warn: false
  alias Bebemayotte.Repo
  alias Bebemayotte.User

  # GET USER
  def get_user_identifiant(identif) do
    query =
          from u in User,
            where: u.identifiant == ^identif,
            select: u.id

    id = Repo.one(query)

    case id do
      nil -> false
      _ -> true
    end
  end

  def get_user_adresse_message(adrMess) do
    query =
      from u in User,
        where: u.adresseMessage == ^adrMess,
        select: u.id

    id = Repo.one(query)

    case id do
      nil -> false
      _ -> true
    end
  end

  # INSERT USER
  def insert_user(params) do
    %User{}
    |>User.changeset(params)
    |>Repo.insert()
  end

  # GET LAST ROW ID
  def get_user_last_row_id() do
    query =
      from u in User,
        limit: 1,
        order_by: [desc: u.id_user],
        select: u.id_user
    id = Repo.one(query)
    case is_nil(id) do
      true -> 1
      false -> id + 1
    end
  end
end
