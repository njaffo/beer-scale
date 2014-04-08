class CreateWeightDataFeedInfos < ActiveRecord::Migration
  def change
    create_table :weight_data_feed_infos do |t|
      t.float :last_received_raw
      t.datetime :last_received_created_at
      t.float :last_stored_raw
      t.datetime :last_stored_created_at

      t.timestamps
    end
  end
end
