namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "reset database..."

    %x(rails db:drop db:create db:migrate)

    puts "reset database...[OK]"

    puts "Cadastrando os Tipos de Contatos..."

    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Cadastrando os Tipos de Contatos...[OK]"

    ############## Kinds first #############

    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email:Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.days.ago, to: 18.days.ago),
        kind: Kind.all.sample
      )
    end
    puts "Cadastrando os contatos...[OK]"

    puts "Cadastrando os telefones..."
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Cadastrando os telefones...[OK]"

    puts "Cadastrando endereços..."
    Contact.all.each do |contact|
      Address.create(
        street:Faker::Address.street_name ,
        city:Faker::Address.city ,
        contact: contact
      )
    end
    puts "Cadastrando endereços...[OK]"

  end

end
