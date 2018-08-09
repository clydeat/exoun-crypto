class HomeController < ApplicationController
  def index
    Crypto.all.delete_all
    StartScrap.new.perform
  end

  def currency

  end

end
