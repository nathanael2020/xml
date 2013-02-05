class CreatePrclmprtms < ActiveRecord::Migration
  def change
    create_table :prc_lmp_rtm do |t|
      t.string :data_item
      t.string :resource_name
      t.datetime :opr_date
      t.integer :interval_num
      t.decimal :value, precision: 8, scale: 2

      t.timestamps
    end
    
    add_index :prc_lmp_rtm, [:data_item, :resource_name, :opr_date, :interval_num], :unique => true, :name => 'add_uniqueness_to_prc_lmp_rtm'

  end
end
