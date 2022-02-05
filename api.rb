# myapp.rb
require 'sinatra'
require_relative 'game'

# POST/games
# GET/games/{gameId}/players/{playerName}
# POST/games/{gameId}/players/{playerName}/fish

# https://app.swaggerhub.com/apis/nrivadeneiravericred/Cards/1.0.0#/default/get_games__gameId__players__playerName_
# https://deckofcardsapi.com/

GAMES = [] # RedisObjects

post '/games' do

  data = JSON.parse request.body.read

  game = Game.new data['players']

  GAMES << game

  {
    game_id: game.id,
    players: game.players.map{|p| p.name}
  }.to_json

end

get '/games/:game_id/players/:player_name' do

  game = GAMES.find{ |g| g.id == params['game_id'] }

  player = game.players.find{ |p| p.name == params['player_name'] }

  player.hand.to_json
  # trim suit and rank
end


post '/game/:game_id/players/:player_name/fish' do

end


### TESTING

get '/' do
  puts 'Hello SERVER'

  'Hello world!'
end


post "/api" do
  request.body.rewind  # in case someone already read it
  data = JSON.parse request.body.read
  "Hello #{data['name']}!"
end
