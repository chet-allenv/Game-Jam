// Draws basic text
draw_set_color(c_blue)		// Font color
var _space = 300			// Space between cards
draw_text(room_width / 2, room_height * 0.1, "What would you choose...?")	// "What would you choose...?"

// Draws the number of cards chosen so far (rounds)
draw_text(room_width - 50, room_height * 0.01, cards_chosen)

// Draws the current value of each attribute


draw_set_halign(fa_center)
// Variables that adjust positions of variables depending on the number of cards:

// Loops over the cards array to draw each card
for (var i = 0; i < 4; i++) {
		// Draws the other cards
		draw_sprite(current_cards[i]._sprite, 0, room_width * _space2 + (i * _space), room_height / 2)
	}
	
		// ADD a scaled card that the player is hovering over