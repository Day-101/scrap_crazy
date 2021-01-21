require "nokogiri"
require "rubygems"
require "open-uri"

def mail(url)
	page = Nokogiri::HTML(URI.open(url))
	ville = { page.xpath("/html/body/div/main/section[1]/div/div/div/h1").text.sub(/ - \d+/, "") => page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text }
return { page.xpath("/html/body/div/main/section[1]/div/div/div/h1").text.sub(/ - \d+/, "") => "Pas d'email"} if page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text == ""
return ville
end

page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
liens = page.css(".lientxt")

a = []

liens.each_with_index do |lien, position|
	a << mail("http://www.annuaire-des-mairies.com#{(liens[position]["href"]).sub(/./, "")}")
end

File.write("mairies.txt", a.join("\n"))
puts a