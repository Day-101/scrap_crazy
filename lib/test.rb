require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("ton_url_a_scrapper.com"))
puts page.class   # => Nokogiri::HTML::Document

all_emails_links = page.xpath('/mettre_ici_le_XPath') # Dans ce cas 'all_emails_links' est un array d'éléments HTML.

all_emails_links.each do |email_link|
  puts email_link.text #récupère le texte de 'all_emails_links' (email_link['href'] pour le 'href')
  end


  #Sélection d'un élément
<html>
  <head> <title>My Webpage</title> </head> 
</html>

puts page.css("title")[0].name   # => title (renvoi dans un array,
                                  #précisément objet de données Nokogiri qui est un collectino d'objets Nokogiri :: XML :: Element)
puts page.css("title")[0].text   # => My webpage (renvoi le texte dans un array donc)
.name : "renvoi" le nom de l'élément
.text : "renvoi" le texte contenu dans l'élément

Obtenir un attribut d'un élément
# set URL to point to where the page exists
page = Nokogiri::HTML(open(PAGE_URL))
links = page.css("a")
puts links.length   # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com

Éléments imbriqués
page.css('p').css("a").css("strong")

Xpath (exemple)
/html/body/div[2]/div[2]/div/div/nav/ul/li[1]/div/div/a/font/font
