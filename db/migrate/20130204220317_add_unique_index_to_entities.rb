class AddUniqueIndexToEntities < ActiveRecord::Migration
  def change
  
    add_index :entities, [:data_item, :resource_name, :opr_date, :interval_num], :unique => true, :name => 'add_uniqueness_to_entities'
    
  end
end
