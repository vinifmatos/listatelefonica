class CreateLocais < ActiveRecord::Migration[5.2]
  def change
    create_table :locais do |t|
      t.string :nome, null: false
      t.string :telefone

      t.timestamps
    end
  end
end
