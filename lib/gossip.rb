# require "csv"

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content # qui est un string
    @author = author # qui est aussi un string
  end

  def save_as_csv
    CSV.open("./db/gossip.csv", "a") do |csv|
      csv << [@content, @author]
    end
  end

  def self.destroy(text_gossip)
    CSV.foreach("./db/gossip.csv", headers: false) do |row|
      gossip_trf = Gossip.new(row[1], row[0])
      CSV.open("./db/gossip.csv.tmp", "a") do |f2|
        if (gossip_trf.content != text_gossip)
          f2 << [gossip_trf.author, gossip_trf.content]
        end
      end
    end
    system("cp ./db/gossip.csv.tmp ./db/gossip.csv")
    system("rm ./db/gossip.csv.tmp")
  end

  def self.all
    # 1)création d'un array vide qui s'appelle all_gossips
    all_gossips = Array.new
    # 2)chaque ligne de ton CSV.each do |ligne|
    CSV.foreach("./db/gossip.csv", "r") do |row|
      # 2-a) gossip_provisoire = Gossip.new(paramètres de la ligne) - permet de créer un objet gossip
      gossip_provisoire = Gossip.new(row[0], row[1])
      # 2-b) all_gossips << gossip_provisoire - permet de rajouter le gossip provisoire au array
      all_gossips << gossip_provisoire
    end
    return all_gossips
  end
end
