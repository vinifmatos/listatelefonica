class AddConstraintValidaLoginToUsuarios < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE usuarios
        ADD CONSTRAINT valida_login
          CHECK (char_length(login) >= 1);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE usuarios
        DROP CONSTRAINT valida_login
    SQL
  end
end
