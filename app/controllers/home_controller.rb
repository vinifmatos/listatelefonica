class HomeController < ApplicationController
  before_action :set_busca_params

  def index
    @contatos = Contato.busca(@busca_params).page(params[:page])
  end

  private

  def set_busca_params
    @busca_params = params.permit(:numero, :nome, :departamento)
    @busca_params[:numero] = @busca_params[:numero].tr('(', '').tr(')', '').tr(' ', '').tr('-', '') unless @busca_params[:numero].blank?
    @busca_params.each_pair { |k, v| @busca_params[k] = "%#{v}%" unless v.blank? }
  end
end
