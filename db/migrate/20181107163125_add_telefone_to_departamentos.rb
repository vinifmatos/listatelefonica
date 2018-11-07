class AddTelefoneToDepartamentos < ActiveRecord::Migration[5.2]
  def change
    add_column :departamentos, :telefone, :string, limit: 10
  end
end
