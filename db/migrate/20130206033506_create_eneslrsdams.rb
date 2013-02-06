class CreateEneslrsdams < ActiveRecord::Migration
  def change
    create_table :ene_slrs do |t|
      t.string :data_item
      t.string :market
      t.string :resource_name
      t.datetime :opr_date
      t.integer :interval_num
      t.decimal :value, precision: 8, scale: 2

      t.timestamps
    end
    
    add_index :ene_slrs, [:data_item, :market, :resource_name, :opr_date, :interval_num], :unique => true, :name => 'add_uniqueness_to_ene_slrs'

  end
end
