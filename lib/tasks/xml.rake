namespace :xml do
  task :download_prc_lmp_dam, [:url] => [:environment]  do |t, args|
    require 'xml_downloader'

    beginning_time = Time.now
    
    puts "Begin download: #{Time.now}"

    xml = XmlDownloader.new("#{Rails.root}/db/xml_downloader")

    puts "End download: #{Time.now}"
    puts "Begin process xml: #{Time.now}"

    xml_file = xml.process(args[:url])

    puts "End process xml: #{Time.now}"
    puts "Begin import from xml: #{Time.now}"

    Prclmpdam.import_from_xml_file(xml_file)
    
    puts "Begin import from xml: #{Time.now}"

    end_time = Time.now

    puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

  end


  task :download_prc_lmp_rtm, [:url] => [:environment]  do |t, args|
    require 'xml_downloader'

    beginning_time = Time.now
    
    puts "Begin download: #{Time.now}"

    xml = XmlDownloader.new("#{Rails.root}/db/xml_downloader")

    puts "End download: #{Time.now}"
    puts "Begin process xml: #{Time.now}"

    xml_file = xml.process(args[:url])

    puts "End process xml: #{Time.now}"
    puts "Begin import from xml: #{Time.now}"

    Prclmprtm.import_from_xml_file(xml_file)

    puts "Begin import from xml: #{Time.now}"

    end_time = Time.now

    puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

  end
end