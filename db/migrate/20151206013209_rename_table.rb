class RenameTable < ActiveRecord::Migration
  def self.up
    rename_table :page, :pages
  end

  def self.down
    rename_table :pages, :page
  end
end
