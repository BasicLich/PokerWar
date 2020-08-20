extends Node2D

onready var Deck = get_node("../Deck")

var hand = [] #contains all card instances in hand
var cardpath = "res://Graphics/Cards/"
var card_width  #semi random value
var cardscale = Vector2(0.8,0.8)

func draw_cards(num):
	hand += Deck.give_cards(num)
	sprite_cards()
	place_cards()

func place_cards():
	var space
	var ideal_cardwidth
	var hand_width
	var hand_offset : float = 0.0
	var cardindex = 0

	for i in hand.size():
		hand[i].position.x+=60*i
		add_child(hand[i])

	
	if hand.size() > 0:
		card_width = hand[0].card_width() * hand[0].scale.x
		ideal_cardwidth = card_width * 0.85
		hand_width = ideal_cardwidth * hand.size()
		space = $RightPoint.position.x - $LeftPoint.position.x
		var unused_space = space - hand_width
		if hand_width <= space:
			hand_offset += (unused_space/2)
		else:
			ideal_cardwidth = space / hand.size()
		
		for card in hand.size():
			if hand_width > space:
				hand[card].position.x = $LeftPoint.position.x + (hand_offset * card)
			elif hand_width <= space:
				print("hand_width < space")
				hand[card].position.x = $LeftPoint.position.x + hand_offset
				
			hand_offset += ideal_cardwidth
			hand[card].position.y = $LeftPoint.position.y
#			cardID.hand_location = cardID.position
	

func sprite_cards():
	var firstpart
	var secondpart
	var fullpart
	for i in hand.size():
		hand[i].cardscale = cardscale
		print(hand[i].cardsuit)
		fullpart = ""
		if hand[i].cardsuit == "spade":
			firstpart = "Spades_"
		elif hand[i].cardsuit == "diamond":
			firstpart = "Diamonds_"
		elif hand[i].cardsuit == "club":
			firstpart = "Clubs_"
		elif hand[i].cardsuit == "heart":
			firstpart = "Hearts_"
		if hand[i].cardvalue == 1:
			secondpart = "Ace.png"
		elif hand[i].cardvalue == 11:
			secondpart = "Jack.png"
		elif hand[i].cardvalue == 12:
			secondpart = "Queen.png"
		elif hand[i].cardvalue == 13:
			secondpart = "King.png"
		else:
			secondpart = str(hand[i].cardvalue) + ".png"
		fullpart = firstpart + secondpart
		hand[i].change_sprite(cardpath+fullpart)
	
