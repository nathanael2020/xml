class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :data_item
      t.string :resource_name
      t.datetime :opr_date
      t.integer :interval_num
      t.decimal :value, precision: 8, scale: 2

      t.timestamps
    end
  end
end