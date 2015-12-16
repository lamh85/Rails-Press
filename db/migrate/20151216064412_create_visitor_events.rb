class CreateVisitorEvents < ActiveRecord::Migration
  def change
    create_table :visitor_events do |t|
      t.string :ip_address
      t.string :event
      t.datetime :time
      t.string :uri

      t.timestamps null: false
    end
  end
end
