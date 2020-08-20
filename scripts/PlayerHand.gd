extends "res://scripts/Hand.gd"

onready var path_length = $Path2D.curve.get_baked_length()

func _ready():
	cardscale = Vector2(1.5,1.5)



func place_cards():
	var space
	var ideal_cardwidth
	var hand_width
	var hand_offset : float = 0.0
	var cardindex = 0

	for i in hand.size():
		card_width = hand[0].card_width() * hand[0].scale.x
		ideal_cardwidth = card_width * 0.65
		hand_width = ideal_cardwidth * hand.size()
		hand[i].position.x+=60*i
		add_child(hand[i])
	
		space = path_length
		$Path2D/PathFollow2D.offset = 0.0
		if hand_width < path_length:
			$Path2D/PathFollow2D.offset = (space - hand_width)/2
			print("ideal cardwidth space: " + str(ideal_cardwidth))
		else:
			ideal_cardwidth = space / hand.size()
			print("ideal cardwidth crowded: " + str(ideal_cardwidth))
		
		for card in hand.size():
			hand[card].position = $DeckLocation.position
			hand[card].handposition = $Path2D/PathFollow2D/DeckSpawner.get_global_position()
			hand[card].handrotation = $Path2D/PathFollow2D/DeckSpawner.get_global_transform().get_rotation()
			hand[card].move_card(hand[card].handposition, hand[card].handrotation)
#			if cardID.dealt:
#				cardID.move_card(cardID.hand_location, cardID.hand_rotation)
#			else: 
#				cardID.position = cardID.position
#				cardID.rotation = cardID.rotation
#			if deck_on and !cardID.dealt:
#				cardID.rotation = 0
#			if use_focus_area:
#				cardID.focus_area = $FocusCardArea.position
			$Path2D/PathFollow2D.offset += ideal_cardwidth
		$Path2D/PathFollow2D.offset = 0

func pick_warcard():
	pass
