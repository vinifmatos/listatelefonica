class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.references :local, foreign_key: true
      t.string :cep, limit: 8
      t.string :rua, null: false
      t.string :numero
      t.string :complemento
      t.string :bairro, null: false
      t.string :cidade, null: false

      t.timestamps
    end
  end
end
