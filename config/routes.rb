Rails.application.routes.draw do
  devise_for :usuarios
  root 'home#index'
  resources :contatos
  resources :departamentos
  resources :locais
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
