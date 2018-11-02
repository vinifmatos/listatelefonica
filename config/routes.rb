Rails.application.routes.draw do
  root 'home#index'
  get '/home', to: 'home#index', as: 'home'
  get '/usuarios/alterarsenha', to: 'usuarios#alterar_senha', as: 'alterar_senha'
  patch '/usuarios/alterarsenha', to: 'usuarios#atualizar_senha'
  devise_for :usuarios, controllers: { sessions: 'usuario/sessions' }
  resources :usuarios, except: :show
  resources :contatos
  resources :departamentos
  resources :locais
end
