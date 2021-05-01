class Router

  #On veut qu'un "Router.new" lancé par app.rb, crée automatique une instance "@controller"
  def initialize
    @controller = Controller.new
  end

  #rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit donc perform.
  def perform
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    while true

      #on affiche le menu
      puts "\nTu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un gossip"
      puts "2. Afficher tous les potins"
      puts "3. Supprimer un potin"
      puts "4. Je veux quitter l'app"
      params = gets.chomp.to_i #on attend le choix de l'utilisateur

      case params #en fonction du choix
      when 1
        puts "\nTu as choisi de créer un gossip 😝"
        @controller.create_gossip
      when 2
        puts "\nTu veux afficher les potins 💣.. petit curieux"
        if File.file?("./db/gossip.csv")
          @controller.index_gossips
        else
          puts "\nCommence par en créer un 😝"
        end
      when 3
        puts "\nTu veux supprimer un potin"
        if File.file?("./db/gossip.csv")
          @controller.destroy_gossip
        else
          puts "\nDommage la liste est vide 😝"
        end
      when 4
        puts "\nÀ bientôt !"
        break #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
      else
        puts "\nCe choix n'existe pas, merci de ressayer" #Si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true".
        #C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)
      end
    end
  end
end
