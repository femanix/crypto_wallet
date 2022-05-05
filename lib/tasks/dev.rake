namespace :dev do
  desc "Popula as tabelas do banco de dados"
  task setup: :environment do
    

    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando banco de Dados...", format: :spin)
      spinner.auto_spin
      %x(rails db:drop)  
      spinner.success("Concluído com sucesso!")

      spinner = TTY::Spinner.new("[:spinner] Criando banco de Dados...", format: :spin)
      spinner.auto_spin
      %x(rails db:create)
      spinner.success("Concluído com sucesso!")

      spinner = TTY::Spinner.new("[:spinner] Migrando banco de Dados...", format: :spin)
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success("Concluído com sucesso!")

      spinner = TTY::Spinner.new("[:spinner] Populando banco de Dados...", format: :spin)
      spinner.auto_spin
      %x(rails db:seed)        
      spinner.success("Concluído com sucesso!")
    else
      puts "Você não está em ambiente de Desenvolvimento"
    end
  end

end
