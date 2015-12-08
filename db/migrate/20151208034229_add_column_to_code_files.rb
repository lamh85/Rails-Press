class AddColumnToCodeFiles < ActiveRecord::Migration
  def change
    add_column :code_files, :type, :string
  end
end
