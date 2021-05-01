require "csv"

require ("./lib/controller.rb")
require ("./lib/gossip.rb")
require ("./lib/router.rb")
require ("./lib/view.rb")

system "clear"
Router.new.perform
