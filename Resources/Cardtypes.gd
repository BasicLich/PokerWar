extends Resource

class_name Cardtypes

#Custom resource to create cards.  Variable can be changed to whatever you want to use.

export var card_name : String = "Card_Suit"

enum SUIT {club, heart, diamond, spade}

export var value : int
export(SUIT) var type
export (Texture) var sprite
