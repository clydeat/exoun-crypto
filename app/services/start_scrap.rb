
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap

  def initialize
    @doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  end

  def perform
    save
  end

  def save
    @array_des_cours = []
    @doc.css('a[class = price]').each{ |taux| @array_des_cours<< taux.text}
    @array_des_monnaies = []
    @doc.css('a[class = link-secondary]').each{ |monnaie| @array_des_monnaies<< monnaie.text}
    @hash_des_cours = Hash[@array_des_monnaies.zip(@array_des_cours)]
    @hash_des_cours.each do |k, v|
      @crypto = Crypto.new(name_of_crypto: k, cour_of_crypto: v)
      @crypto.save
    end
  end

end
