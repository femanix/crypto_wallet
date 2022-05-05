namespace :dev do
  desc "Popula as tabelas do banco de dados"
  task setup: :environment do
    

    if Rails.env.development?
      
      spinner("Apagando"){%x(rails db:drop)}          

      spinner("Criando"){ %x(rails db:create)}       

      spinner("Migrando"){%x(rails db:migrate)}      

      spinner("Populando"){%x(rails db:seed)}

      else
        puts "Você não está em ambiente de Desenvolvimento"
      end  
    end
    
    private
    def spinner(msg_start, msg_end = "Concluído com sucesso!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start} banco de Dados...", format: :spin)
      spinner.auto_spin
      yield     
      spinner.success("(#{msg_end})")
    end
end
