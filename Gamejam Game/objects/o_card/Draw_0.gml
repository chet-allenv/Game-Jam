// Draws basic text
draw_set_color(c_blue)		// Font color
var _space = 300			// Space between cards
draw_text(room_width / 2, room_height * 0.1, "Pick a card")

// Draws the current value of each attribute
draw_set_color(c_black)		// Font color
for (var i = 0; i < 4; i++) {
	draw_text(room_width * 0.125, room_height * 0.025 + (_space * 0.2 * i), types[0, i] + ": " + string(types[1, i]))
}

// Loops over the cards array to draw each card
for (var i = 0; i < array_length(cards); i++) {
	// Scales the card the player is hovering over
	if cards[i] == cards[index] {
		draw_sprite_ext(types[2, cards[i]], 0,  (room_width * 0.125 + (i * _space)) - (sprite_width / 4), (room_height / 2) - (sprite_height / 4), 2, 2, 0, c_white, 1)
	} else {
		// Draws the other cards
		draw_sprite(types[2, cards[i]], 0, room_width * 0.125 + (i * _space), room_height / 2)
	}
}