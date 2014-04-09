class AddKegToWeights < ActiveRecord::Migration
  def change
    add_column :weights, :keg_id, :integer
    add_index :weights, :keg_id
  end
end
