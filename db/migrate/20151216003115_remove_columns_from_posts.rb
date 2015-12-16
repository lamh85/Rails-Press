class RemoveColumnsFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :content, :string
    remove_column :posts, :hero_image, :string
  end
end