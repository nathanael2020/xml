class RemoveColumnFromEntities < ActiveRecord::Migration
  def change
  
  	remove_column :entities, :blah
  	
  end
end
