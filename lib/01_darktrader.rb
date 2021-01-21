require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
#puts page.class   # => Nokogiri::HTML::Document

a = # récupère le cours de toutes les cryptomonnaies dans un array de hashs

all_emails_links = page.xpath('/mettre_ici_le_XPath') # Dans ce cas 'all_emails_links' est un array d'éléments HTML.

all_emails_links.each do |email_link|
  puts email_link.text #récupère le texte de 'all_emails_links' (email_link['href'] pour le 'href')
  end

def scrap_line(line) # line est un objet Nokogiri
  crypto = { line.css('td').css('div')[2].text => line.css('td').css('div')[3].text.sub(/[$]/, '').to_f } # récupère 2 éléments et les introduits dans un hash
  return crypto
end

array = []

page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr').each do |line| # récupère tbody
  array << scrap_line(line) #traiter line
end
puts array