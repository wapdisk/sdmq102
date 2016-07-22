class CreatePayconditions < ActiveRecord::Migration
  def change
    create_table :payconditions do |t|
      t.string :username
      t.date :yearmonth
      t.boolean :ispay
      t.boolean :islive

      t.timestamps null: false
    end
  end
end
