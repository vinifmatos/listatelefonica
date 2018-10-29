class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, :rememberable
  validates :login, uniqueness: true
  enum acesso: [:admin, :cadastro, :consulta]

  protected

  def email_required?
    false
  end
end
