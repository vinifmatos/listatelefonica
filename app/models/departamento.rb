class Departamento < ApplicationRecord
  belongs_to :local
  has_many :contatos, dependent: :destroy
  validates :nome, presence: true
  validate :valida_telefone
  before_save :remover_caracteres

  def valida_telefone
    unless telefone.present?
      errors.add(:telefone, 'está em formato inválido') unless telefone.gsub(/[()\s-]/, '') =~ /(^\d{8}\z|^\d{10}\z)/
    end
  end

  def remover_caracteres
    telefone&.gsub!(/[()\s-]/, '')
  end
end
