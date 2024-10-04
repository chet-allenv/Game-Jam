// Draws basic text
draw_set_color(c_blue)		// Font color
var _space = 300			// Space between cards
draw_text(room_width / 2, room_height * 0.1, "What would you choose...?")	// "What would you choose...?"

// Draws the number of cards chosen so far (rounds)
draw_text(room_width - 50, room_height * 0.01, cards_chosen)

// Draws the current value of each attribute
draw_set_color(c_black)		// Font color
for (var i = 0; i < 4; i++) {
	draw_sprite_ext(types[2, i], 0, room_width * 0.75, room_height * 0.02 + (_space * 0.2 * i), 1/3, 1/3, 0, c_white, 1)
	draw_set_halign(fa_left)
	draw_text(room_width * 0.8, room_height * 0.03 + (_space * 0.2 * i), types[1, i])
}
draw_set_halign(fa_center)
// Variables that adjust positions of variables depending on the number of cards:
var _array
var _2d_array
var _space2
if cards_chosen % event_round != 0 or cards_chosen == 0 {
	_array = cards
	_2d_array = types
	_space2 = 0.125
} else {
	_array = event_cards
	_2d_array = events
	if bad_event {
		_2d_array = bad_events
	}
	_space2 = 0.25
}

// Loops over the cards array to draw each card
for (var i = 0; i < array_length(_array); i++) {
	// Scales the card the player is hovering over
	if _array[i] == _array[index] {
		draw_sprite_ext(_2d_array[2, _array[i]], 0,  (room_width * _space2 + (i * _space)) - (sprite_width / 4), (room_height / 2) - (sprite_height / 4), 2, 2, 0, c_white, 1)
	} else {
		// Draws the other cards
		draw_sprite(_2d_array[2, _array[i]], 0, room_width * _space2 + (i * _space), room_height / 2)
	}
}