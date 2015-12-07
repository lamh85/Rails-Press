class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :pages, :title, :heading
  end
end
