Rails.application.routes.draw do
  root 'home#index'
  get '/home', to: 'home#index', as: 'home'
  devise_for :usuarios, controllers: { sessions: 'usuario/sessions' }
  resources :usuarios, except: :show
  resources :contatos
  resources :departamentos
  resources :locais
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
