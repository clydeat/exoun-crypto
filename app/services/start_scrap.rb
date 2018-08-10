
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap

# Définition du lien via Noki reprenant les informations à scrapper
  def initialize
    @doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  end

# Tu te demandes pourquoi un perform alors qu'il n'y a qu'une def?? 
# Le nom "perform" est plus stylé, c'est tout!
  def perform
    save
  end

# Ici création du Hash concaténant les noms de monnaie scrappés ainsi que les valeurs associées
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
