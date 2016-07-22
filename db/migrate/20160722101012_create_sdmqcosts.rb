class CreateSdmqcosts < ActiveRecord::Migration
  def change
    create_table :sdmqcosts do |t|
      t.date :yearmonth
      t.string :costtype
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
