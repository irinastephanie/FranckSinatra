require 'gossip'

class ApplicationController < Sinatra::Base
  #class ApplicationController qui hérite de la classe sinatra:base
  get '/' do
    #pour exeecuter le code qui suit
    #"<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
    erb :index, locals: {gossips: Gossip.all}
  end 
  #run! if app_file == $0
  #execute le code de la classe sans avoir à ecrire ApplicationController.new.perform
  #c'est l'execution de la méthode pour lancer la machine
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do 
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
  #puts "Salut, je suis dans le serveur"
  #puts "Ceci est le contenue du hash params : #{params}"
  #puts "Trop bien! et cei est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  #puts "De la bombe, ça c'est le contenue : #{params["gossip_content"]}"
  #puts "ca déchire"
  redirect '/'
  end
  get '/gossips/:id/' do |id|
    erb :show, locals: {id: id, gossip: Gossip.find(id.to_i - 1)}
  end
end 