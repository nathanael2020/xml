class Prclmpdam < ActiveRecord::Base
  require 'nokogiri'
  self.table_name = 'prc_lmp_dam'

  attr_accessible :data_item,
                  :resource_name,
                  :opr_date,
                  :interval_num,
                  :value
           
  class << self
    def import_from_xml_file(file)
    
    	puts "Begin file open: #{Time.now}"
      f = File.open(file)
        puts "End file open: #{Time.now}"
    	puts "Begin Nokogiri::XML: #{Time.now}"

      doc = Nokogiri::XML(f)

    	puts "End Nokogiri::XML: #{Time.now}"

      records = []

    	puts "Begin xpath each_with_index: #{Time.now}"

      doc.xpath('//m:REPORT_DATA').each_with_index do |record, t|
        records << Prclmprtm.new(
          data_item:      record.xpath('m:DATA_ITEM').text,
          resource_name:  record.xpath('m:RESOURCE_NAME').text,
          opr_date:       record.xpath('m:OPR_DATE').text,
          interval_num:   record.xpath('m:INTERVAL_NUM').text,
          value:          record.xpath('m:VALUE').text
        )
        
        if t % 250 == 0 
        
	        Prclmprtm.import(records)
        
	        records = []

	        puts "Imported record #{t} at #{Time.now}"

        end
                
      end
      
      f.close
      records
      
    end
  end
end
