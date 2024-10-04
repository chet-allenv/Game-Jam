// Get input

var _up = keyboard_check_pressed(vk_up)
var _down = keyboard_check_pressed(vk_down)
var _select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space)

var _move = _down - _up

// Moves the index
if _move != 0 {
	index += _move

	if index == -1 index = 2		// Loops to bottom
	else if index == 3 index = 0	// Loops to start
}


// Handles the current screen
if _select {
	switch(index) {
		case 0: 
			global.money = 50; // Total money
			global.employee = 50; // Employee stat
			global.investor = 50; // investor stat
			global.public = 50; // public stat
			global.vis = false
			global.choice = noone
			room_goto_previous()
			break
		case 1:
			room_goto(0)
			break
		case 2:
			game_end()
	}
}