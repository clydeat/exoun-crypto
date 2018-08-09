class CurrencyController < ApplicationController

  def index
    puts params
    @monney = Crypto.find_by(name_of_crypto: params[:name_of_crypto])
  end


end
