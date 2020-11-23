# FOR RAW XML DATA FROM WYZA
wyza_stuff = File.read('wyza_new.xml')

new_content = wyza_stuff.gsub('&quot;', '"').gsub('&lt;', '<')
	.gsub('&gt;', '>').gsub('.aspx</link', '</link').gsub('</link>', '<#link>').gsub(/<link>(.*\/)/, '<link><![CDATA[').gsub('<#link>', ']]></link>')
	.gsub('<description>', '<description><![CDATA[').gsub('</description>', ']]></description>')
	.gsub('<title>', '<title><![CDATA[').gsub('</title>', ']]></title>')
	.gsub('<intro>', '<intro><![CDATA[').gsub('</intro>', ']]></intro>')
	.gsub('<category>', '<category><![CDATA[').gsub('</category>', ']]></category>')
	.gsub('<author>', '<author><![CDATA[').gsub('</author>', ']]></author>')
	.gsub('src="/media', 'src="https://www.wyza.com.au/media')

File.open('wyza_new_edited.xml', 'w') {|text| text.puts new_content}

# TO PRESERVE LINK INFORMATION SO GALLERY CRAWLER CAN GET CONTENT
# wyza_stuff = File.read('wyza.xml')

# new_content = wyza_stuff.gsub('&quot;', '"').gsub('&lt;', '<')
# 	.gsub('&gt;', '>')
# 	.gsub('<description>', '<description><![CDATA[').gsub('</description>', ']]></description>')
# 	.gsub('<title>', '<title><![CDATA[').gsub('</title>', ']]></title>')
# 	.gsub('<intro>', '<intro><![CDATA[').gsub('</intro>', ']]></intro>')
# 	.gsub('<category>', '<category><![CDATA[').gsub('</category>', ']]></category>')
# 	.gsub('<author>', '<author><![CDATA[').gsub('</author>', ']]></author>')
# 	.gsub('src="/media', 'src="https://www.wyza.com.au/media')

# File.open('wyza_for_galleries.xml', 'w') {|text| text.puts new_content}

# TO EDIT GALLERY CONTENT AFTER CRAWLER HAS EXTRACTED DATA
# wyza_stuff = File.read('galleries_extracted.xml')

# new_content = wyza_stuff.gsub('&quot;', '"').gsub('&lt;', '<')
# 	.gsub('&gt;', '>').gsub('.aspx</link', '</link').gsub('</link>', '<#link>').gsub(/<link>(.*\/)/, '<link><![CDATA[').gsub('<#link>', ']]></link>')
# 	.gsub('<description>', '<description><![CDATA[').gsub('</description>', ']]></description>')
# 	.gsub('src="/media', 'src="https://www.wyza.com.au/media')

# File.open('galleries_for_import.xml', 'w') {|text| text.puts new_content}

# TO CREATE LINKS FOR REDIRECTS
# wyza_stuff = File.read('wyza.xml')

# new_content = wyza_stuff.gsub('&quot;', '"').gsub('&lt;', '<')
# 	.gsub('&gt;', '>').gsub('.aspx</link', '</link')
# 	.gsub('<description>', '<description><![CDATA[').gsub('</description>', ']]></description>')
# 	.gsub('<title>', '<title><![CDATA[').gsub('</title>', ']]></title>')
# 	.gsub('<intro>', '<intro><![CDATA[').gsub('</intro>', ']]></intro>')
# 	.gsub('<category>', '<category><![CDATA[').gsub('</category>', ']]></category>')
# 	.gsub('<author>', '<author><![CDATA[').gsub('</author>', ']]></author>')
# 	.gsub('src="/media', 'src="https://www.wyza.com.au/media')

# File.open('wyza_for_redirects.xml', 'w') {|text| text.puts new_content}