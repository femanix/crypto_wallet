namespace :dev do
  desc "Popula as tabelas do banco de dados"
  task setup: :environment do
    

    if Rails.env.development?      
      spinner("Apagando banco de Dados..."){%x(rails db:drop)}    
      spinner("Criando banco de Dados..."){ %x(rails db:create)}       
      spinner("Migrando banco de Dados..."){%x(rails db:migrate)}  
      %x(rails dev:add_mining_types)    
      %x(rails dev:add_coins)     

      else
        puts "Você não está em ambiente de Desenvolvimento"
      end  
    end

    desc "Cadastra moedas no banco de dados"
    task add_coins: :environment do          
      spinner("Cadastrando moedas") do
        coins = [
            {
                description: "Bitcoin",
                acronym: "BTC",
                url_img: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png",
                mining_type: MiningType.find_by(acronym: 'PoW')
            },

            {
                description: "Ethereum",
                acronym: "ETH",
                url_img: "https://img1.gratispng.com/20180410/juw/kisspng-ethereum-cryptocurrency-bitcoin-cash-tether-impact-5acceb0643a7c2.9049379315233789502771.jpg",
                mining_type: MiningType.all.sample
            },

            {
                description: "Real",
                acronym: "R$",
                url_img: "https://img1.gratispng.com/20180627/iqo/kisspng-powell-law-group-p-c-brazilian-real-moeda-de-um-moedas-5b344c79c04c32.3011124415301541057877.jpg",
                mining_type: MiningType.all.sample
            }
        ]
          
        coins.each do |coin|    
          Coin.find_or_create_by!(coin)
        end
        sleep(1) 
      end         
    end 

    desc "Cadastra moedas no banco de dados"
    task add_mining_types: :environment do          
      spinner("Cadastrando tipos de mineração") do
        mining_types = [
            {
              description: "Proof of Work",
              acronym: "PoW"                
            },

            {
              description: "Proof of Stake",
              acronym: "PoS",
            },

            {
              description: "Capacity",
              acronym: "PoC",
            }
        ]
          
        mining_types.each do |coin|    
          MiningType.find_or_create_by!(coin)
        end
        sleep(1) 
      end         
    end 

    
    private
    def spinner(msg_start, msg_end = "Concluído com sucesso!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :spin)
      spinner.auto_spin
      yield     
      spinner.success("(#{msg_end})")
    end
end
