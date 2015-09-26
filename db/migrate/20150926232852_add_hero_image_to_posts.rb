class AddHeroImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hero_image, :string
  end
end
