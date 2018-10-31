class HomeController < ApplicationController
  def index
    @contatos = Contato.busca(params.permit(:numero, :nome, :departamento)).page(params[:page])
  end
end
