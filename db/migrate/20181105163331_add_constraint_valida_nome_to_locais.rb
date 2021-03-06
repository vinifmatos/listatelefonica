class AddConstraintValidaNomeToLocais < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE locais
        ADD CONSTRAINT valida_nome
          CHECK (char_length(nome) >= 1);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE locais
        DROP CONSTRAINT valida_nome
    SQL
  end
end
