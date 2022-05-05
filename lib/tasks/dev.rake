namespace :dev do
  desc "Popula as tabelas do banco de dados"
  task setup: :environment do
    puts  %x(rails db:drop)   
    puts  %x(rails db:create)
    puts  %x(rails db:migrate)
    puts  %x(rails db:seed)    
  end

end
