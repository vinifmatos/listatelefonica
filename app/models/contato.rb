class Contato < ApplicationRecord
  belongs_to :departamento
  validates :nome, presence: true
  validate :numero_informado, :valida_telefone, :valida_celular
  before_save :remover_caracteres

  scope :ativos, -> { where(ativo: true) }

  private

  def numero_informado
    if telefone.blank? && celular.blank?
      errors.add(:telefone, 'não pode ficar em branco.')
      errors.add(:celular, 'não pode ficar em branco.')
    end
  end

  def valida_telefone
    unless telefone.present?
      errors.add(:telefone, 'está em formato inválido') unless telefone.gsub(/[()\s-]/, '') =~ /(^\d{8}\z|^\d{10}\z)/
    end
  end

  def valida_celular
    unless celular.present?
      errors.add(:celular, 'está em formato inválido') unless celular.gsub(/[()\s-]/, '') =~ /(^\d{9}\z|^\d{11}\z)/
    end
  end

  def remover_caracteres
    telefone&.gsub!(/[()\s-]/, '')
    celular&.gsub!(/[()\s-]/, '')
  end
end
