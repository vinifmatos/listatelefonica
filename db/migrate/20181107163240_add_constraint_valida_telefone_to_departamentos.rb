class AddConstraintValidaTelefoneToDepartamentos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE departamentos
        ADD CONSTRAINT valida_telefone
          CHECK (telefone ~ $$(^\\d{8}$|^\\d{10}$)$$);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE departamentos
        DROP CONSTRAINT valida_telefone
    SQL
  end
end
