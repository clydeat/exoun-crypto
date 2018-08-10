class CurrencyController < ApplicationController

# Définition de @monney: permet de retouver à partir du nom selectionné les attributs associés, 
# en l'occurence .cour_of_crypto cf app/views/currency/index.html.erb, l.18:  @monney.cour_of_crypto

  def index
    @monney = Crypto.find_by(name_of_crypto: params[:name_of_crypto])
  end


end
