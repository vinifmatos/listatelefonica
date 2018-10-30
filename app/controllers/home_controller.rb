class HomeController < ApplicationController
  def index
    @contatos = Contato.ativos.includes(:departamento).where(
        '(telefone like ? or celular like ?) or nome ilike ?',
        "#{params[:numero]}",
        "#{params[:numero]}",
        "%#{params[:nome]}%"
      ).page(params[:page])
  end
end
