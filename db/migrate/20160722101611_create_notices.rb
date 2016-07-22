class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :username
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
