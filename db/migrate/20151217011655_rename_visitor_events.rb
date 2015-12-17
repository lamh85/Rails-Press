class RenameVisitorEvents < ActiveRecord::Migration
  def self.up
    rename_table :visitor_events, :visits
  end

  def self.down
    rename_table :visits, :visitor_events
  end
end
