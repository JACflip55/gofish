require_relative 'deck'

class Game

  def initialize(player_names)

    @players = []

    @deck = Deck.new

    #NOTE; Assuming 7 cards
    player_names.each do |name|

      player = Player.new(name, self)

      player.draw(7)

      @players << player

    end

  end

  attr_reader :players, :deck

  def id

    deck.id
  end

end


class Player

  def initialize name, game, cards=[]

    @name = name
    @game = game
    @cards = cards

  end
  attr_reader :name, :game, :cards

  def hand

     cards
  end

  def draw count

    new_cards = game.deck.draw(count)

    cards + new_cards

  end

end


class Card
  #JSON => to_s
end
