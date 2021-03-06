class CreateContatos < ActiveRecord::Migration[5.2]
  def change
    create_table :contatos do |t|
      t.references :departamento, foreign_key: true
      t.string :nome, null: false
      t.string :telefone, limit: 10
      t.string :celular, limit: 11
      t.string :cargo
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
