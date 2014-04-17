RailsBootstrap::Application.routes.draw do
  resources :rooms

  resources :hotels

  root :to => 'visitors#new'
end
