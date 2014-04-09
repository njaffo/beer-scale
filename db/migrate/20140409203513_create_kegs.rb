class CreateKegs < ActiveRecord::Migration
  def change
    create_table :kegs do |t|
      t.string :name
      t.float :volume
      t.datetime :start_date
      t.datetime :end_date
      t.float :start_raw
      t.float :end_raw
      t.float :zero_raw

      t.timestamps
    end
  end
end
