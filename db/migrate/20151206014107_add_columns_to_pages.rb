class AddColumnsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :title_tag, :string
    add_column :pages, :meta_description, :text
    add_column :pages, :hero_image, :integer
  end
end
