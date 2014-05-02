class AddTimestampsToEvents < ActiveRecord::Migration
  def change
    remove_column :events,  :day

    add_column :events, :start, :timestamp
    add_column :events, :end, :timestamp
    add_column :events, :description, :string

    add_index :events, :start, using: 'btree'
    add_index :events, :end, using: 'btree'

  end
end
