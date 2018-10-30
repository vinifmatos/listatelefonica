class Endereco < ApplicationRecord
  belongs_to :local
  validates :rua, :bairro, :cidade, presence: true
end
