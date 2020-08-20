extends "res://scripts/Hand.gd"

func draw_flop():
	var cardindex = 0
	draw_cards(3)

func place_cards():

	var ideal_cardwidth
	var hand_width
	var hand_offset : float = 0.0

	for i in hand.size():
		hand[i].position.x+=60*i
		add_child(hand[i])

	
	if hand.size() > 0:
		card_width = hand[0].card_width() * hand[0].scale.x
		ideal_cardwidth = card_width * 0.85
		hand_width = ideal_cardwidth * hand.size()
		hand_offset = 0
		for card in hand.size():
			hand[card].handposition.x = $LeftPoint.position.x + hand_offset
			hand_offset += ideal_cardwidth
			hand[card].handposition.y = $LeftPoint.position.y
			hand[card].position = $Deck.position
			hand[card].move_card(hand[card].handposition, hand[card].handrotation)

func reset_table():
	hand = []
#var tabledeck = [] #array full of NAMES of card files Note: does not contain path
#var playerhand = [] #array full of NAMES of card files in hand Note: does not contain path
#var tablecards = []
#var enemyhand = [] 
#var playerhandpaths = [] #array full of card paths for reference
#var enemyhandpaths = []
#var tablehandpaths = []
#var playerdiscard = [] #array full of discarded cards
#var temp_cardnode #REVISIT THIS.  
#var card_width #REVISIT THIS TOO.
#
#export var use_focus_area : = true
#
#onready var deck_origin = get_node("../Deck")
#onready var path_length = $Path2D.curve.get_baked_length()
#
##Connect to UI as necessary
#signal update_deck_count 
#signal update_discard_count
#signal update_hand_count
#
#func deal_street(street):
#	if street == 1:
#		deal_table(3)
#	else: 
#		deal_table(1)
#
#func deal_table(cards):
#	pass
#
#func make_player_deck(deck):
#	tabledeck = deck
##	print("This is the player deck")
##	print(tabledeck)
#
#func make_card(cardname, hand = $PlayerHand):
#	var card = load("res://Scenes/Card.tscn").instance()
#	var main = hand
#	var holder
#
#	if hand == $EnemyHand:
#		holder = "enemy"
#	elif hand == $TableCards:
#		holder = "table"
#	else:
#		holder = "player"
#
#	var handpath = playerhandpaths
#	if holder == "enemy":
#		handpath = enemyhandpaths
#		card.hand = "enemy"
#	elif holder == "table":
#		handpath = tablehandpaths
#		card.hand = "table"
#	card.card_initialize("res://Resources/Cards/", cardname)
#	if holder == "player":
#		card.connect("in_focus", self, "_new_card_focus")
#		card.connect("play_effect", self, "_play_effect")
#		card.connect("card_selected", self, "_card_selected")
#	main.add_child(card)
#	handpath.append(card.get_path())
#	temp_cardnode = card.find_node("Sprite")
#	card_width = temp_cardnode.texture.get_width() * temp_cardnode.scale.x
##	print(temp_cardnode.texture.get_width())
#
##Used for setting up the hand. With arg "nocard" no card check for removal is done. can be used to reset the hand positions
#func set_hand(card_played = "nocard"):
#
#	var holderpaths
#	var holder
#
#	if card_played == "enemy":
#		holderpaths = enemyhandpaths 
#		holder = enemyhand
#	elif card_played == "table":
#		holderpaths = tablehandpaths
#		holder = tablecards
#
#	else:
#		holderpaths = playerhandpaths
#		holder = playerhand
#
#	if holderpaths.size() > 0:
#
#
#		var space
#		var ideal_cardwidth = card_width * 0.8
##		print ("starting idealcardwidth: " + str(ideal_cardwidth))
#		var hand_width 
#		var hand_offset : float = 0.0
#		var cardindex = 0
#
#		for card in holderpaths:
#			var cardID 
#			var cardnum
#			if card_played != null || card_played != "nocard" || card_played != "enemy" || card_played != "player" || card_played != "table":
#				if card == card_played: 
#					cardID = get_node(card)
#					cardnum = cardID.base_z -1
#					holderpaths.remove(cardnum)
#					playerdiscard.append(holder[cardnum])
#					holder.remove(cardnum)
#					cardID.queue_free()
#
#		hand_width = ideal_cardwidth * holderpaths.size()
#
#		if card_played == "table":
#			space = $RightPoint.position.x - $LeftPoint.position.x
#			var unused_space = space - hand_width
#			if hand_width <= space:
#				hand_offset += (unused_space/2)
#			else:
#				ideal_cardwidth = space / playerhandpaths.size()
#		else:
#			space = path_length
#			$Path2D/PathFollow2D.offset = 0.0
#			if hand_width < path_length:
#				$Path2D/PathFollow2D.offset = (space - hand_width)/2
#				print("ideal cardwidth space: " + str(ideal_cardwidth))
#			else:
#				ideal_cardwidth = space / holderpaths.size()
#				print("ideal cardwidth crowded: " + str(ideal_cardwidth))
#
#		for card in holderpaths:
#			var cardID = get_node(card)
#
#			cardID = get_node(card)
#			cardID.z_index = cardindex + 1
#			cardID.base_z = cardID.z_index
#			cardID.hand_location = $Path2D/PathFollow2D/DeckSpawner.get_global_position()
#			cardID.hand_rotation = $Path2D/PathFollow2D/DeckSpawner.get_global_transform().get_rotation()
#			if cardID.dealt:
#				cardID.move_card(cardID.hand_location, cardID.hand_rotation)
#			else: 
#				cardID.position = cardID.position
#				cardID.rotation = cardID.rotation
#			if !cardID.dealt:
#				cardID.rotation = 0
#			if use_focus_area:
#				cardID.focus_area = $FocusCardArea.position
#			$Path2D/PathFollow2D.offset += ideal_cardwidth
#
#			cardindex += 1
#
#			if !cardID.dealt:
#				cardID.deck_location = $Deck.position
#				cardID.position = cardID.deck_location
#
#
#	emit_signal("update_deck_count", tabledeck)
#	emit_signal("update_hand_count", playerhand)
#	emit_signal("update_discard_count", playerdiscard)	
#
#
#func shuffle_discard():
#	if playerdiscard.size() > 0:
#		playerdiscard.shuffle()
#		for card in range(playerdiscard.size()):
#			tabledeck.push_back(playerdiscard[card])
#	playerdiscard = []
#
#func draw_cards(num, player = "player"): #player = "player" arg removed.  Must add back
#	var holder = player
#	for x in num:
#		if player == "player":
#			holder = playerhand
#		elif player == "enemy":
#			holder = enemyhand
#		elif player == "table":
#			holder = tablecards
#		if tabledeck.size() > 0:
#			holder.append(tabledeck[0])
#			make_card(tabledeck[0])
#			tabledeck.remove(0)
#		elif playerdiscard.size() > 0:
#			shuffle_discard()
#			holder.append(tabledeck[0])
#			make_card(tabledeck[0])
#			tabledeck.remove(0)
#		else:
#			print("out of cards")
#	set_hand(player) #"draw" added so as not to trigger "nocard" result.
#
#func _card_selected(sel, card):
#	print("card selected")
#	get_tree().call_group("cards", "_lock_movement", card, sel)
#
#func _new_card_focus(cardZ):
#	get_tree().call_group("cards", "off_focus", cardZ)
#
##Play effect needs to be implemented more fully for individual games. I recommend passing all the card values and the target when appropriate
##It will be updated to be more universal in the future.
#func _play_effect(card_played):
#	var card = get_node(card_played)
#	if card.card_in_play:
#		print("play_effect")
#		print(card_played)
#		set_hand(card_played)
#		get_node("../PlayTarget").particles()
#	else:
#		set_hand()
#
#
