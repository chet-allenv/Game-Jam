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
	switch(sub_menu) {
		case 0: 
			// Main menu
			switch(index) {
				case 0:
					// Start
					room_goto_next()
				break
				case 1:
					// Options
					sub_menu = 1
					index = 0
				break
				case 2:
					// Exit
					game_end()
				break
				}
		break
		case 1:
			// Options submenu
			switch(index) {
				case 0:
					// Volume - Add later
					
				break
				case 1:
					// Mushroom - Add later
					mushroom += 100
				break
				case 2:
					// Back
					sub_menu = 0
					index = 1
				break
			}
		break
	}
}
	