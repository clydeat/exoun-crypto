class HomeController < ApplicationController
  
  # Méthode permettant la remise à zero: efface la def save 
  # si elle a dejà eu lieu afin d'avoir les dernières données mises à jour
  # et relance le perform (cf app/services/start_scrap.rb). 
  def index
    Crypto.all.delete_all
    StartScrap.new.perform
  end

  def currency

  end

end
