require "pry"

class Controller
  def initialize
    @view = View.new
    # create_gossip
  end

  def create_gossip
    params = @view.create_gossip
    my_gossip = Gossip.new(params[:author], params[:content])
    #=> Crée une instance de potin, sauvergardée juste dans cette variable
    my_gossip.save_as_csv
    #=> Sauvegarde l'instance de potin dans le CSV correspondant, en créant une nouvelle ligne dans mon fichier CSV
  end

  def index_gossips
    gossips = Gossip.all
    @view.index_gossips(gossips)
  end

  def destroy_gossip
    #   puts "view.destroy_gossip"
    param = @view.destroy_gossip
    #   puts param
    action = Gossip.destroy(param)
  end
end
