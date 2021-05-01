class View
  def create_gossip
    puts "Message : "
    print ">>> "
    msg = gets.chomp
    puts "Auteur : "
    print ">>> "
    auteur = gets.chomp
    return params = { content: msg, author: auteur }
  end

  def index_gossips(gossips)
    #puts gossips.class
    gossips.each do |g|
      puts "#{g.author} a écrit #{g.content}."
    end
  end

  def destroy_gossip
    puts "Quel est le message que vous souhaitez supprimer ? "
    print ">>> "
    return gets.chomp
  end
end
