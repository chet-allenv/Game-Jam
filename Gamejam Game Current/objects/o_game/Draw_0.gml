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
	if index == i {
		draw_sprite_ext(current_cards[i]._sprite, 0, (room_width * 0.125 + (i * _space)) - sprite_get_width(current_cards[i]._sprite) / 2, room_height / 3, 2, 2, 0, c_white, 1)
	} else {
		// Draws the other cards
		draw_sprite(current_cards[i]._sprite, 0, room_width * 0.125 + (i * _space), room_height / 2)
	}
}
