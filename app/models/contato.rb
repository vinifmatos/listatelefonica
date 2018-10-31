class Contato < ApplicationRecord
  belongs_to :departamento
  validates :nome, presence: true
  validate :numero_informado

  scope :ativos, -> { where(ativo: true) }

  private

  def numero_informado
    errors.add(:base, 'Um número de telefone ou celular de ser informado!') if telefone.blank? && celular.blank?
  end

  def self.busca(params)
    Contato.joins('left join departamentos on departamentos.id = contatos.departamento_id').where(
      "contatos.ativo = true
        and (( ('' = :numero or contatos.celular like :numero) or ('' = :numero or contatos.telefone like :numero) )
        and ('' = :contato or contatos.nome ilike :contato)
        and ('' = :departamento or departamentos.nome ilike :departamento))",
      {
        numero: "#{params[:numero]}",
        contato: "#{params[:nome]}",
        departamento: "#{params[:departamento]}"
      }
    ).order("contatos.nome, departamentos.nome")
  end
end
