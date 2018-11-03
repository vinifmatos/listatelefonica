class HomeController < ApplicationController
  # before_action :set_busca_params, except: :index

  def index
    # @contatos = Contato.busca(@busca_params).page(params[:page])
    @contatoq = Contato.ransack(params[:q])
    @departamentoq = Departamento.ransack(params[:q])
    @localq = Local.ransack(params[:q])
  end

  def contatos
    @q = Contato.ransack(params[:q])
    @contatos = @q.result.ativos.includes(departamento: [:local]).page(params[:page])
    render 'resultados'
  end

  def departamentos
    @q = Departamento.ransack(params[:q])
    @departamentos = @q.result.includes(:local).page(params[:page])
    render 'resultados'
  end

  def locais
    @q = Local.ransack(params[:q])
    @locais = @q.result.page(params[:page])
    render 'resultados'
  end

  private

  def set_busca_params
    @busca_params = params.permit(:nome, :numero)
    @busca_params[:numero].tr!('(', '').tr!(')', '').tr!(' ', '').tr!('-', '') if @busca_params[:numero].present?
    @busca_params.each_pair { |k, v| @busca_params[k] = "%#{v}%" unless v.blank? }
  end
end
