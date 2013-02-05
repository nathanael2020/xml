class AddUniquenessToPrcLmpDam < ActiveRecord::Migration
  def change
  
      add_index :prc_lmp_dam, [:data_item, :resource_name, :opr_date, :interval_num], :unique => true, :name => 'add_uniqueness_to_prc_lmp_dam'

  end
end
