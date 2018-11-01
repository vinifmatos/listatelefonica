namespace :dev do
  desc "TODO"
  task popdb: :environment do
    puts 'Criando locais...'
    5.times { Local.create nome: Faker::Company.name }

    puts 'Criando depatamentos...'
    Local.all.each do |l|
      5.times { l.departamentos.create nome: Faker::Commerce.department }
    end

    puts 'Criando contatos...'
    Departamento.all.each do |d|
      20.times {
        d.contatos.create(
          nome: Faker::Name.name,
          telefone: Faker::PhoneNumber.phone_number.tr('(', '').tr(')', '').tr(' ', '').tr('-', ''),
          celular: Faker::PhoneNumber.cell_phone.tr('(', '').tr(')', '').tr(' ', '').tr('-', ''),
          cargo: Faker::Company.profession
        )
      }
    end
  end

  desc "TODO"
  task rmkdb: :environment do
    ['db:drop', 'db:create', 'db:migrate', 'db:seed', 'dev:popdb'].each do |t|
      Rake::Task[t].invoke
    end
  end
end
