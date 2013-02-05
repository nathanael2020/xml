class Entity < ActiveRecord::Base
  require 'nokogiri'

  attr_accessible :data_item,
                  :resource_name,
                  :opr_date,
                  :interval_num,
                  :value
           
  class << self
    def import_from_xml_file(file)
      f = File.open(file)
      doc = Nokogiri::XML(f)
      entities = []

      doc.xpath('//m:REPORT_DATA').each do |entity|
        entities << Entity.new(
          data_item:      entity.xpath('m:DATA_ITEM').text,
          resource_name:  entity.xpath('m:RESOURCE_NAME').text,
          opr_date:       entity.xpath('m:OPR_DATE').text,
          interval_num:   entity.xpath('m:INTERVAL_NUM').text,
          value:          entity.xpath('m:VALUE').text
        )
      end

      Entity.import(entities)
      f.close
      entities
    end
  end
end
