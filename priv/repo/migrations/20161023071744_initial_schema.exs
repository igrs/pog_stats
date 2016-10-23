defmodule PogStats.Repo.Migrations.InitialSchema do
  use Ecto.Migration

  def change do
    # User
    create table(:users) do
      add :email,            :citext, null: false, limit: 255
      add :crypted_password, :string, null: false, limit: 300
      add :name,             :string, null: true,  limit: 30

      timestamps
    end

    create index(:users, [:email], unique: true)

    # Game
    create table(:games) do
      add :title,            :string,  null: false, limit: 100
      add :from,             :date,    null: false
      add :to,               :date,    null: false
      add :number_of_horses, :integer, null: false
      add :prize,            :string,  null: true
      add :regulation,       :stirng,  null: true,  limit: 200

      timestamps
    end

    create index(:games, [:title])

    # Horse
    create table(:horses) do
      add :name,    :string,  null: false, limit: 30
      add :record,  :string,  null: true,  default: "0-0-0-0"
      add :prize,   :integer, null: true,  default: 0
      add :sex,     :integer, null: false
      add :stable,  :string,  null: true,  limit: 30
      add :breeder, :string,  null: true,  limit: 30
      add :sier,    :string,  null: false, limit: 30
      add :mare,    :string,  null: false, limit: 30
    end

    create index(:horses, [:name])

    # Draft
    create table(:drafts) do
      add :rank, :integer, null: false
      add :game_id,  references(:games)
      add :horse_id, references(:horses)
      add :user_id,  references(:users)
    end

    create index(:drafts, [:game_id])
    create index(:drafts, [:horse_id])
    create index(:drafts,  [:user_id])
    create unique_index(:drafts, [:game_id, :horse_id, :user_id])



    # Authorization
    #create table(:authorizations) do
    #  add :provider, :string
    #  add :uid, :string
    #  add :user_id, references(:users, on_delete: :delete_all)
    #  add :token, :string
    #  add :refresh_token, :string
    #  add :expires_at, :bigint

    #  timestamps
    #end

    #create index(:authorizations, [:provider, :uid], unique: true)
    #create index(:authorizations, [:expires_at])
    #create index(:authorizations, [:provider, :token])
  end
end
