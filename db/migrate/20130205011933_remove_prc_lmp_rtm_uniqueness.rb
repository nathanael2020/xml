class RemovePrcLmpRtmUniqueness < ActiveRecord::Migration
  def change
  
  	remove_index :prc_lmp_rtm, :name => 'add_uniqueness_to_prc_lmp_rtm'
  	
  end

end
