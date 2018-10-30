class CreateDepartamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :departamentos do |t|
      t.references :local, foreign_key: true
      t.string :nome, null: false

      t.timestamps
    end
  end
end
