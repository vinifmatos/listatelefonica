json.extract! contato, :id, :departamento_id, :nome, :telefone{10}, :celular{11}, :cargo, :ativo, :created_at, :updated_at
json.url contato_url(contato, format: :json)
