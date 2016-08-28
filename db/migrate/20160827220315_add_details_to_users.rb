class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :about, :string
    add_column :users, :profile_image_url, :string
  end
end
