class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!
  before_action :acesso_cadastro?, only: [:new, :edit, :create, :update, :destroy]
  helper_method :admin?, :cadastra?

  def admin?
    return false unless usuario_signed_in?

    current_usuario.admin? || current_usuario.id.zero?
  end

  def cadastra?
    return false unless usuario_signed_in?

    current_usuario.cadastro? || admin?
  end

  def acesso_cadastro?
    negar_acesso unless cadastra?
  end

  def negar_acesso
    raise ActionController::RoutingError, 'Acesso Negado'
  end
end
