Rails.application.routes.draw do
  root 'home#index'
  get '/busca/contatos', to: 'home#contatos', as: 'busca_contatos'
  post '/busca/contatos', to: 'home#contatos'
  get '/busca/departamentos', to: 'home#departamentos', as: 'busca_departamentos'
  post '/busca/departamentos', to: 'home#departamentos'
  get '/busca/locais', to: 'home#locais', as: 'busca_locais'
  post '/busca/locais', to: 'home#locais'
  get '/usuarios/alterarsenha', to: 'usuarios#alterar_senha', as: 'alterar_senha'
  patch '/usuarios/alterarsenha', to: 'usuarios#atualizar_senha'
  devise_for :usuarios, controllers: { sessions: 'usuario/sessions' }
  resources :usuarios, except: :show
  resources :contatos
  resources :departamentos
  resources :locais
end
