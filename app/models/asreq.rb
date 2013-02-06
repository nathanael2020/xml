class Asreq < ActiveRecord::Base
  require 'nokogiri'
  self.table_name = 'as_req'

  attr_accessible :data_item,
  				  :market,
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

    	market = doc.xpath('//m:MKT_TYPE').first.text
    	
      doc.xpath('//m:REPORT_DATA').each_with_index do |record, t|
        records << Asreq.new(
          data_item:      record.xpath('m:DATA_ITEM').text,
          market:      	  market,
          resource_name:  record.xpath('m:RESOURCE_NAME').text,
          opr_date:       record.xpath('m:OPR_DATE').text,
          interval_num:   record.xpath('m:INTERVAL_NUM').text,
          value:          record.xpath('m:VALUE').text
        )
        
#        if t % 100 == 0 
        
	        Asreq.import(records)
        
	        records = []

	        puts "Imported record #{t} at #{Time.now}"

 #       end
                
      end
      
      f.close
      records
      
    end
  end
end
