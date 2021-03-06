namespace :dev do
  desc "TODO"
  task popdb: :environment do
    puts 'Craindo usuario cadastro...'
    Usuario.create(
      login: 'cadastro',
      password: '12345',
      password_confirmation: '12345',
      acesso: :cadastro
    )

    puts 'Craindo usuario consulta...'
    Usuario.create(
      login: 'consulta',
      password: '12345',
      password_confirmation: '12345',
      acesso: :consulta
    )

    puts 'Criando locais...'
    5.times do
      Local.create(
        nome: Faker::Company.name,
        endereco: Endereco.new(
          cep: Faker::Address.zip_code.tr('-', ''),
          rua: Faker::Address.street_name,
          numero: Faker::Address.building_number,
          bairro: Faker::Address.community,
          cidade: Faker::Address.city
        )
      )
    end

    puts 'Criando depatamentos...'
    Local.all.each do |l|
      5.times { l.departamentos.create nome: Faker::Commerce.department }
    end

    puts 'Criando contatos...'
    Departamento.all.each do |d|
      20.times do
        d.contatos.create(
          nome: Faker::Name.name,
          telefone: Faker::PhoneNumber.phone_number,
          celular: Faker::PhoneNumber.cell_phone,
          cargo: Faker::Company.profession
        )
      end
    end
  end

  desc "TODO"
  task rmkdb: :environment do
    ['db:drop', 'db:create', 'db:migrate', 'db:seed', 'dev:popdb'].each do |t|
      Rake::Task[t].invoke
    end
  end
end
