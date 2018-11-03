Rails.application.routes.draw do
  root 'home#index'
  get '/contatos', to: 'home#contatos', as: 'busca_contatos'
  post '/contatos', to: 'home#contatos'
  get '/departamentos', to: 'home#departamentos', as: 'busca_departamentos'
  post '/departamentos', to: 'home#departamentos'
  get 'locais', to: 'home#locais', as: 'busca_locais'
  post 'locais', to: 'home#locais'
  get '/usuarios/alterarsenha', to: 'usuarios#alterar_senha', as: 'alterar_senha'
  patch '/usuarios/alterarsenha', to: 'usuarios#atualizar_senha'
  devise_for :usuarios, controllers: { sessions: 'usuario/sessions' }
  namespace :cadastro do
    resources :contatos
    resources :departamentos
    resources :locais
  end
  resources :usuarios, except: :show
end
