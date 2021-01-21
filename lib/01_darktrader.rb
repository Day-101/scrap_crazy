require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

def scrap_line(line)
  crypto = { line.css('td').css('div')[2].text.intern => line.css('td').css('div')[3].text.sub(/[$]/, '').to_f }
  return crypto
end

a = []

page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr').each do |line|
  a << scrap_line(line) #traiter line
end

File.write("cryptos.txt", a.join("\n"))
puts a