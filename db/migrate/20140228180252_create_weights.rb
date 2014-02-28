class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.float :raw

      t.timestamps
    end
  end
end
