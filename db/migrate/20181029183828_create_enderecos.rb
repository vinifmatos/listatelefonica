class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.references :local, foreign_key: true
      t.string :cep, limit: 8
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :cidade

      t.timestamps
    end
  end
end
