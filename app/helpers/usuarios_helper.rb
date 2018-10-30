module UsuariosHelper
  def usuario_admin?(usuario)
    usuario.id.zero?
  end
end
