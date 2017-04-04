#!/usr/bin/ruby

require 'rubygems'
require 'nokogiri'    
require 'open-uri'

$max_api_key = File.open("/root/.ssh/maxapikey", &:readline)
$mf_api_url='https://www.systemmonitor.us/api/?apikey='

File.open('/root/client_url.list', 'w') {|file| file.truncate(0) }
File.open('/etc/bind/clients/client.list', 'w') {|file| file.truncate(0) }

reply = Nokogiri::XML(open("#$mf_api_url#$max_api_key&service=list_clients"))   
#puts reply.to_s
reply.xpath("//name/text()").each do |client|
  client = client.to_html
  client = client.to_s
  puts client
  client = client.downcase.tr("+","-")
  client = client.downcase.tr("&","-")
  client = client.downcase.tr(".","-")
  client = client.downcase.tr("//_","")
  client = client.downcase.tr("//-","")
  client = client.downcase.tr('(',"")
  client = client.downcase.tr(')',"")
  client = client.downcase.tr(" ","-") 
  client = client.downcase.tr('\'','')
  open('/root/client_url.list', 'a') do |f|
    f.puts "-d " + client + '.client.datasystems-fl.com'
    f.puts "-d " + client + '.client-local.datasystems-fl.com'
  end
  client = client + '.client.datasystems-fl.com.           IN      A      52.32.59.207'
  open('/etc/bind/clients/client.list', 'a') do |f|
    f.puts client
  end
end


