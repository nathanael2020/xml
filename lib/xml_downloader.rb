class XmlDownloader
  require 'zip/zip'
  require 'open-uri'

  # take zipped xml file, download and rename

  # query:    ?queryname=PRC_LMP&startdate=20130101&enddate=20130101&market_run_id=DAM&node=DLAP_PGAE-APND
  # contains: 20130101_20130101_PRC_LMP_DAM_20130130_15_21_25.xml
  # renamed:  PRC_LMP_DAM_PGAE_20130101_20130101.xml

  def initialize(dir = File.dirname(__FILE__) + "/xml_downloader")
    @dir = dir
  end

  def process(url)
    open(temp_file, 'wb') do |file|
      file.print open(url).read
    end

    xml = Zip::ZipFile.open(temp_file).first
    destination = rename(xml.to_s, url)
    xml.extract(destination) unless File.exists? destination
    File.delete(temp_file)

    destination
  end

  def rename(filename, url)
    query = parse(url)
    parts = filename.split('_')
    id_string = parts[2...5]
    id_string << get_node(query["node"]) if query["node"]
    "#{@dir}/#{id_string.join('_')}_#{parts.first(2).join('_')}.xml"
  end

  def parse(query)
    Rack::Utils.parse_nested_query(query)
  end

  def get_node(node)
    node.split(/\_|\-/)[1]
  end

  def temp_file
    "#{@dir}/temp.zip"
  end

end