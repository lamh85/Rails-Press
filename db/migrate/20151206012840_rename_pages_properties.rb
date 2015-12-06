class RenamePagesProperties < ActiveRecord::Migration
  def self.up
    rename_table :pages_properties, :page
  end

  def self.down
    rename_table :page, :pages_properties
  end
end
