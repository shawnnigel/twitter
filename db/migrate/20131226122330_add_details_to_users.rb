class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	 add_column :users, :birthday, :date
    add_column :users, :city, :text
    add_column :users, :phone, :decimal
  end
end
