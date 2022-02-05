# httparty.rb
require 'httparty'

class Deck

  def initialize

    uri = 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'

    response = HTTParty.get(uri)

    puts response.code

    @deck_info = response.parsed_response

    @id = @deck_info['deck_id']

  end
  attr_reader :id


  def draw number_of_cards

    uri = "https://deckofcardsapi.com/api/deck/#{id}/draw/?count=#{number_of_cards}"

    response = HTTParty.get(uri)

    response.parsed_response['cards']
  end


  module DeckClient

  end

end
