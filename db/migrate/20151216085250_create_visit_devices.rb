class CreateVisitDevices < ActiveRecord::Migration
  def change
    create_table :visit_devices do |t|
      t.string :browser_brand
      t.string :browser_version
      t.string :mobility

      t.timestamps null: false
    end
  end
end
