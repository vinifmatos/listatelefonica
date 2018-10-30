namespace :dev do
  desc "TODO"
  task popdb: :environment do
    puts 'Criando locais...'
    20.times do |l|
      Local.create nome: "local #{l+1}"
    end

    puts 'Criando depatamentos...'
    Local.all.each do |l|
      20.times do |d|
        l.departamentos.create nome: "Departamento #{d+1}"
      end
    end

    puts 'Criando contatos...'
    Departamento.all.each do |d|
      20.times do |c|
        d.contatos.create nome: "Contato #{c+1}", telefone: "12345678"
      end
    end
  end

  desc "TODO"
  task rkmdb: :environment do
    ['db:drop', 'db:create', 'db:migrate', 'db:seed', 'dev:popdb'].each do |t|
      Rake::Task[t].invoke
    end
  end
end
