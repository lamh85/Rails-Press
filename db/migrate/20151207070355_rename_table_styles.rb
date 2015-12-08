class RenameTableStyles < ActiveRecord::Migration
  def self.up
    rename_table :styles, :code_files
  end

  def self.down
    rename_table :code_files, :styles
  end
end
