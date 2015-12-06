class RenamePages < ActiveRecord::Migration
  def self.up
    rename_table :pages, :pages_properties
  end

  def self.down
    rename_table :pages_properties, :pages
  end
end