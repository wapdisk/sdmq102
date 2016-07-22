class AddMobilephoneToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :mobilephone, :string
  end
end
