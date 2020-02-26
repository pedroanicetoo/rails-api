namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

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

  end

end
