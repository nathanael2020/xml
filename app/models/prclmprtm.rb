class Prclmprtm < ActiveRecord::Base
  require 'nokogiri'
  self.table_name = 'prc_lmp_rtm'

  attr_accessible :data_item,
                  :resource_name,
                  :opr_date,
                  :interval_num,
                  :value
           
  class << self
    def import_from_xml_file(file)
      f = File.open(file)
      doc = Nokogiri::XML(f)
      records = []

      doc.xpath('//m:REPORT_DATA').each do |record|
        records << Prclmprtm.new(
          data_item:      record.xpath('m:DATA_ITEM').text,
          resource_name:  record.xpath('m:RESOURCE_NAME').text,
          opr_date:       record.xpath('m:OPR_DATE').text,
          interval_num:   record.xpath('m:INTERVAL_NUM').text,
          value:          record.xpath('m:VALUE').text
        )
      end

      Prclmprtm.import(records)
      f.close
      records
    end
  end
end
