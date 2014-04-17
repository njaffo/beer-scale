class AddAbvAndLinkToKeg < ActiveRecord::Migration
  def change
    add_column :kegs, :abv, :float
    add_column :kegs, :info_link, :string
  end
end
