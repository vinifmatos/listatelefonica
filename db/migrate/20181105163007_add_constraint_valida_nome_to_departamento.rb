class AddConstraintValidaNomeToDepartamento < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE departamentos
        ADD CONSTRAINT valida_nome
          CHECK (char_length(nome) >= 1);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE departamentos
        DROP CONSTRAINT valida_nome
    SQL
  end
end
