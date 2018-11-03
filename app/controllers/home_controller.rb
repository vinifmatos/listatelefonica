class HomeController < ApplicationController
  skip_before_action :acesso_cadastro?

  def index
    # @contatos = Contato.busca(@busca_params).page(params[:page])
    @contatoq = Contato.ransack(params[:q])
    @departamentoq = Departamento.ransack(params[:q])
    @localq = Local.ransack(params[:q])
  end

  def contatos
    @q = Contato.ransack(params[:q])
    @contatos = @q.result.ativos.includes(departamento: [:local]).order(:nome).page(params[:page])
    render 'resultados'
  end

  def departamentos
    @q = Departamento.ransack(params[:q])
    @departamentos = @q.result.includes(:local).order(:nome).page(params[:page])
    render 'resultados'
  end

  def locais
    @q = Local.ransack(params[:q])
    @locais = @q.result.order(:nome).page(params[:page])
    render 'resultados'
  end
end
