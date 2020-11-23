require 'open-uri'
require 'nokogiri'

def find_urls xml_file
    document = Nokogiri::XML(xml_file)
    items = document.css('item')
    galleries = ''
    items.each do |item|
        if item.at_css('description').to_s == '<description><![CDATA[]]></description>'
            galleries << item.to_s
        end
    end

    File.write('test.xml', galleries)
end