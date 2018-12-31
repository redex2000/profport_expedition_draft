class AddFavoriteNovelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_novel, :string
  end
end
