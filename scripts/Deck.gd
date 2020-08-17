extends Node

# signals for turning on/off dealing from deck. No requirement for use outside of the demo.
signal turn_off_deck
signal turn_on_deck

# used to determine if deck is being used.
export var deck_on_screen : bool = false setget deckonscreen

#saving/loading vars
var save_path = "user://deck_save.cfg"
var savefile = ConfigFile.new()

func _ready():
	pass

func deckonscreen(val):
	deck_on_screen = val
	if deck_on_screen == true:
		emit_signal("turn_on_deck")
	if deck_on_screen == false:
		emit_signal("turn_off_deck")

# to be used later to load and save decks
func save_deck(deck_save, key, value):
	savefile.set_value(deck_save, key, value)
	savefile.save(save_path)

func load_deck(section, key, display_value):
	savefile.getvalue(section, key, display_value)

	
	

# default deck.  can be used for the default starter deck. 
func default_deck():
	var deck = ["Ace_Spades.tres", "2_Spades.tres", "3_Spades.tres", 
				"4_Spades.tres", "5_Spades.tres", "6_Spades.tres", "7_Spades.tres", 
				"8_Spades.tres", "9_Spades.tres", "10_Spades.tres", "Jack_Spades.tres", 
				"Queen_Spades.tres", "King_Spades.tres", "Ace_Hearts.tres", 
				"2_Hearts.tres", "3_Hearts.tres", "4_Hearts.tres", "5_Hearts.tres", 
				"6_Hearts.tres", "7_Hearts.tres", "8_Hearts.tres", "9_Hearts.tres", 
				"10_Hearts.tres", "Jack_Hearts.tres", "Queen_Hearts.tres", 
				"King_Hearts.tres", "Ace_Clubs.tres", "2_Clubs.tres", 
				"3_Clubs.tres", "4_Clubs.tres", "5_Clubs.tres", "6_Clubs.tres", 
				"7_Clubs.tres", "8_Clubs.tres", "9_Clubs.tres", "10_Clubs.tres", 
				"Jack_Clubs.tres", "Queen_Clubs.tres", "King_Clubs.tres", 
				"Ace_Diamonds.tres", "2_Diamonds.tres", "3_Diamonds.tres", 
				"4_Diamonds.tres", "5_Diamonds.tres", "6_Diamonds.tres", 
				"7_Diamonds.tres", "8_Diamonds.tres", "9_Diamonds.tres", 
				"10_Diamonds.tres", "Jack_Diamonds.tres", "Queen_Diamonds.tres", 
				"King_Diamonds.tres"]
	return deck
	
