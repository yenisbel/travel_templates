RailsBootstrap::Application.routes.draw do
  resources :rooms

  resources :hotels
  
  resources :flights

  root :to => 'visitors#new'
end
