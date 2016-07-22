class CreateAccountqueries < ActiveRecord::Migration
  def change
    create_table :accountqueries do |t|
      t.string :account
      t.string :accounttype
      t.string :query_url

      t.timestamps null: false
    end
    add_index :accountqueries, :account, unique: true
  end
end
