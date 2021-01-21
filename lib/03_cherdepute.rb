require 'rubygems'
require 'nokogiri'
require 'open-uri'
a = []

def profile(url)
begin
	page = Nokogiri::HTML(URI.open(url))
	identity = {first_name: page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1").text.split[1], 
	last_name: page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1").text.split[2..].join(" "), 
	email: page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text}
	return identity
	rescue RuntimeError
		return {error: "Data not found"}
	end
end

page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
liens = page.css("#deputes-list").css("a")
	
liens.each_with_index do |lien, position|
a << profile("https://www2.assemblee-nationale.fr#{(liens[position]["href"])}")
end

puts a