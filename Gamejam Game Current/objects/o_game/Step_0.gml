draw_set_font(fnt_menu)

// Keyboard inputs collected
var _left = keyboard_check_pressed(vk_left)
var _right = keyboard_check_pressed(vk_right)
var _select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space)

var _move = _right - _left

// Changes the index (indicating which card you are hovering over)
if _move != 0 {
	index += _move
	if cards_chosen % event_round != 0 or cards_chosen == 0 {	// Normal cards
		if index == -1 index = 3		// Loops to bottom
		else if index == 4 index = 0	// Loops to start
	} else {										// Event cards
		if index == -1 index = 2		// Loops to bottom
		else if index == 3 index = 0	// Loops to start
	}
}


// Handles selecting a card
if _select 
{
	select_card();
}


// Losing, the global variable carries the lose condition to the next room (game_over)
if global.money < 0 { // Out of cash
	global.loss = "Cash"
	room_goto_next()
}	else if global.employee < 0 {
	global.loss = "Employee"
	room_goto_next()
}	else if global.investor < 0 {
	global.loss = "Investor"
	room_goto_next()
} else if global.public < 0 {
	global.loss = "Public"
	room_goto_next()
}