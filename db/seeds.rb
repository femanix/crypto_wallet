# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Criando moedas padrão..."

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_img: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Imagem-Dinheiro-Bitcoin-PNG.png"
)

puts "Moedas criadas com sucesso!"