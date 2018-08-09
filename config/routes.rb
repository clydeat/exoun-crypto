Rails.application.routes.draw do

  root to: 'home#index'



  get '/currency/:name_of_crypto', to: 'currency#index', as: "show"


end
