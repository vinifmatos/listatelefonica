class AddConstraintsValidaTelefoneValidaCelularToContatos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE contatos
        ADD CONSTRAINT valida_telefone
          CHECK (telefone ~ $$(^\\d{8}$|^\\d{10}$)$$);
    SQL

    execute <<-SQL
      ALTER TABLE contatos
        ADD CONSTRAINT valida_celular
          CHECK (celular ~ $$(^\\d{9}$|^\\d{11}$)$$);
    SQL

    execute <<-SQL
      ALTER TABLE contatos
        ADD CONSTRAINT valida_presenca_telefone_ou_celular
          CHECK ((telefone IS NOT NULL) OR (celular IS NOT NULL));
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE contatos
        DROP CONSTRAINT valida_telefone
    SQL

    execute <<-SQL
      ALTER TABLE contatos
        DROP CONSTRAINT valida_celular
    SQL

    execute <<-SQL
      ALTER TABLE contatos
        DROP CONSTRAINT valida_presenca_telefone_ou_celular
    SQL
  end
end
