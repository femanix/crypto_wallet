namespace :dev do
  desc "Popula as tabelas do banco de dados"
  task setup: :environment do
    puts  %x(rails db:drop db:create db:migrate db:seed)   
  end

end
