class Contato < ApplicationRecord
  belongs_to :departamento
  validates :nome, presence: true
  validate :numero_informado

  scope :ativos, -> { where(ativo: true) }

  private

  def numero_informado
    errors.add(:base, 'Um número de telefone ou celular de ser informado!') if telefone.blank? && celular.blank?
  end
end
