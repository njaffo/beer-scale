class AddKegToWeightDataFeedInfo < ActiveRecord::Migration
  def change
    add_column :weight_data_feed_infos, :keg_id, :integer
  end
end
