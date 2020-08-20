extends Node2D

onready var Player = $CardController/PlayerHand
onready var Enemy = $CardController/EnemyHand
onready var Table = $CardController/Table
onready var Deck = $CardController/Deck
onready var Alert = $UI

enum {intro, warflop, turn, river, showdown}

var state

func _ready():
	state = warflop
	play_warflop()

func _process(delta):
	pass

func play_warflop():
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().call_group("players", "draw_cards", 3)
	yield(get_tree().create_timer(1.0),"timeout")
	Table.draw_flop()
	Alert.send_alert("select war card")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var table = $CardController/Table
#
#var playerdeck = []
#var enemydeck = []
#var tablecards = []
#
#signal deal_hand
#
#func _ready():
#	randomize()
#	get_player_deck()
#	play_poker(1)
#
#func play_poker(lvl):
#	deal_hand(3)
#	deal_hand(3, "table")
##	deal_hand(3, "enemy")
#	deal_flop()
#
#func get_player_deck():
#	playerdeck = $CardController/Deck.default_deck()
#	playerdeck.shuffle()
#	table.make_player_deck(playerdeck)
#
#func deal_hand(num, holder = "player"):
#	emit_signal("deal_hand", num, holder)
#
#func deal_flop():
#	table.deal_street(1)
#
#
#func _on_PlayTarget_area_entered(area):
#	area.set_play_area()
#
#func _on_PlayTarget_area_exited(area):
#	area.unset_play_area()

#func _on_Table_update_deck_count(deck):
#	$CardsInDeck.text = "Cards in Deck: " + str(deck.size())
#
#func _on_Table_update_discard_count(discard):
#	$CardsInDiscard.text = "Cards in Discard: " + str(discard.size())
#
#func _on_Table_update_hand_count(hand):
#	$CardsInHand.text = "Cards in Hand: " + str(hand.size())


#func _on_Button_pressed():
#	$Table.draw_cards(1)
#
#func _on_DeckButton_pressed():
#	$Table.draw_cards(1)




#func _on_DeckOnScreen_toggled(button_pressed):#button_pressed arg removed
#	if get_node("VBoxContainer/DeckOnScreen").pressed:
#		$Deck.deck_on_screen = true
#		$DeckButton.visible = true
#	else:
#		$Deck.deck_on_screen = false
#		$DeckButton.visible = false

#func _on_AddCard_pressed():
#	playerdeck.append($Library.get_random_card())
#	_on_Table_update_deck_count(playerdeck)


func _on_Timer_timeout():
	pass
