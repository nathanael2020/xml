class CreateAsreq < ActiveRecord::Migration
  def change
    create_table :as_req do |t|
      t.string :data_item
      t.string :market
      t.string :resource_name
      t.datetime :opr_date
      t.integer :interval_num
      t.decimal :value, precision: 8, scale: 2

      t.timestamps
    end
    
    add_index :as_req, [:data_item, :market, :resource_name, :opr_date, :interval_num], :unique => true, :name => 'add_uniqueness_to_as_req'

  end
end
