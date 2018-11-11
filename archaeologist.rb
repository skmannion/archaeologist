#!/usr/bin/ruby

require 'faraday'
require 'json'

set = ARGV[0]

set_uri = "https://playartifact.com/cardset/#{set}/"

response = Faraday.get set_uri

set_info = JSON.parse(response.body)

card_set_uri = "#{set_info['cdn_root']}#{set_info['url']}"

cards_response = Faraday.get card_set_uri

cards_json = JSON.parse(cards_response.body)

for card in cards_json['card_set']['card_list']
	puts "Card ID: #{card['card_id']}"
	puts "Base Card ID: #{card['base_card_id']}"
	puts "Card Type: #{card['card_type']}"
	puts "Card Name: #{card['card_name']['english']}"
	puts "Card Text: #{card['card_text']['english']}"
	puts "Mana Cost: #{card['mana_cost']}"
	puts "*******************************\n\n"
end