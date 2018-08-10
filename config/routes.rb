Rails.application.routes.draw do
	
# Page d'accueil
  root to: 'home#index'


# Page de résultat
  get '/currency/:name_of_crypto', to: 'currency#index', as: "show"


end
