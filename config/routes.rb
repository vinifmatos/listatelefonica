Rails.application.routes.draw do
  root 'home#index'
  devise_for :usuarios, controllers: { sessions: 'usuario/sessions' }
  resources :usuarios
  resources :contatos
  resources :departamentos
  resources :locais
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
