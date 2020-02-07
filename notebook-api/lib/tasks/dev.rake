namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando os contatos..."

    100.times do |i|
    	p "oi"

    end

    puts "Contatos cadastrados com sucesso!"
  end

end
