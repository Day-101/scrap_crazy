require 'rubygems'
require 'nokogiri'
require 'open-uri'
list = []
def profile(url)
	page = Nokogiri::HTML(URI.open(url))
	identity = {first_name: page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1").text.split[1], 
	last_name: page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1").text.split[2..].join(" "), 
	email: page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text}
return identity
end





list << profile(url)

