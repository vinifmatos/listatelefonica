class Local < ApplicationRecord
  has_one :endereco, dependent: :destroy
  has_many :departamentos, dependent: :destroy
  accepts_nested_attributes_for :endereco
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
