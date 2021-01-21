require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

def scrap_line(line) # line est un objet Nokogiri
  crypto = { line.css('td').css('div')[2].text.intern => line.css('td').css('div')[3].text.sub(/[$]/, '').to_f } # récupère 2 éléments et les introduits dans un hash
  return crypto
end

a = []

page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr').each do |line| # récupère tbody
  a << scrap_line(line) #traiter line
end
puts a