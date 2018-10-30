class Local < ApplicationRecord
  has_one :endereco, dependent: :destroy
  has_many :departamentos, dependent: :destroy
  accepts_nested_attributes_for :endereco
  validates :nome, presence: true
end
