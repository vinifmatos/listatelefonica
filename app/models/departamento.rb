class Departamento < ApplicationRecord
  belongs_to :local
  has_many :contatos, dependent: :destroy
  validates :nome, presence: true
end
