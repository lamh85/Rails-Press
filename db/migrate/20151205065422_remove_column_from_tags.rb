class RemoveColumnFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :slug, :string
  end
end
