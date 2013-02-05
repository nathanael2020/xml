class AddColumnToEntities < ActiveRecord::Migration
  def change
  
  	add_column :entities, :blah, :string
  	
  end
end
