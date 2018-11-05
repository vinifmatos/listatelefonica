class Contato < ApplicationRecord
  belongs_to :departamento
  validates :nome, presence: true
  validate :numero_informado, :valida_telefone, :valida_celular
  before_save :remover_caracteres

  scope :ativos, -> { where(ativo: true) }

  private

  def numero_informado
    errors.add(:base, 'Telefone ou celular de ser informado!') if telefone.blank? && celular.blank?
  end

  def valida_telefone
    unless telefone.nil?
      errors.add(:telefone, 'Telefone inválido') unless telefone.gsub(/[()\s-]/, '') =~ /(^\d{8}\z|^\d{10}\z)/
    end
  end

  def valida_celular
    unless celular.nil?
      errors.add(:celular, 'Celular inválido') unless celular.gsub(/[()\s-]/, '') =~ /(^\d{9}\z|^\d{11}\z)/
    end
  end

  def remover_caracteres
    telefone.gsub!(/[()\s-]/, '') unless telefone.nil?
    celular.gsub!(/[()\s-]/, '') unless celular.nil?
  end
end
