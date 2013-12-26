class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	 add_column :users, :birthday, :date
    add_column :users, :home_address, :text
    add_column :users, :phone, :decimal
  end
end
