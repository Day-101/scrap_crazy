require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/")) #se connecte à la page

def scrap_line(line) #Méthode pour récupérer le nom et la valeur d'une ligne
  return{ line.css('td').css('div')[2].text.intern => line.css('td').css('div')[3].text.gsub(/[\$,]/, '').to_f }
end

a = []

page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr').each do |line| #Nokogiri elements
  a << scrap_line(line) #utilise la méthode 'scrap_line' pour chaque ligne et insère le résultat dans l'array 'a'.
end

File.write("cryptos.txt", a.join("\n")) # Génère un fichier.txt avec les résultats de l'array 'a'.
puts a