require 'open-uri'
require 'nokogiri'

def process_html address
    counter = 1
    content = ''
    while counter < 15 do
        begin
            file = URI.open(address)
            document = Nokogiri::HTML.parse(file)
            text = document.css('div.slides')
            if text
                content += text.at_css('img').to_s + "\n"
                content += text.at_css('h3').to_s + "\n"
                content += text.css('p').to_s + "\n"
                counter += 1
                address = address.gsub('.aspx', '').gsub(/\/page\/\d+/, '')
                address += '/page/' + counter.to_s
            else
                break
            end
        rescue
            puts 'rescuing counter ' + counter.to_s
            break
        end
    end

    content
end

def find_urls xml_file
    document = Nokogiri::XML(xml_file)
    items = document.css('item')
    galleries = ''
    items.each do |item|
        if item.at_css('description').to_s == '<description><![CDATA[]]></description>'
            link = item.at_css('link').to_s.gsub('<link>', '').gsub('</link>', '')
            puts link
            description = item.at_css('description')
            description.content = process_html(link)
            galleries << item.to_s
        end
    end
    File.write('galleries_new_for_import.xml', galleries)
end

def extract_links xml_file
    document = Nokogiri::XML(File.open(xml_file))
    items = document.css('item')
    links = 'old,new'
    items.each do |item|
        link = item.at_css('link').to_s.gsub('https://www.wyza.com.au', '').gsub('<link>', '').gsub('</link>', '').gsub('.aspx', '')
        if link.include? '%e2%80%99'
            links << ",\n" + link + ',' + link.gsub('%e2%80%99', '')
        end

        if link.include? '%e2%80%93'
            links << ",\n" + link + ',' + link.gsub('%e2%80%93', '')
        end 
    end

    File.write('wyza_redirects.csv', links)
end