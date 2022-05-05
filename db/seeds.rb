# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Criando moedas padrão...", format: :spin)
spinner.auto_spin       
         
    coins = [
        {
            description: "Bitcoin",
            acronym: "BTC",
            url_img: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png"
        },

        {
            description: "Ethereum",
            acronym: "ETH",
            url_img: "https://img1.gratispng.com/20180410/juw/kisspng-ethereum-cryptocurrency-bitcoin-cash-tether-impact-5acceb0643a7c2.9049379315233789502771.jpg"
        },

        {
            description: "Real",
            acronym: "R$",
            url_img: "https://img1.gratispng.com/20180627/iqo/kisspng-powell-law-group-p-c-brazilian-real-moeda-de-um-moedas-5b344c79c04c32.3011124415301541057877.jpg"
        }
    ]
        
    coins.each do |coin|    
        Coin.find_or_create_by!(coin)
    end

sleep(2)
spinner.success("(Moedas criadas com sucesso!)")