// Keyboard inputs collected
var _left = keyboard_check_pressed(vk_left)
var _right = keyboard_check_pressed(vk_right)
var _select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space)

var _move = _right - _left

// Changes the index (indicating which card you are hovering over)
if _move != 0 {
	index += _move
	if index == -1 index = 3		// Loops to bottom
	else if index == 4 index = 0	// Loops to start
}

// Basic logic for randomizing the cards that appear
if start {
	for (var i = 0; i < array_length(cards); i++) {
		cards[i] = random_range(0, 3.99)
		// Because of how random_range() works, it returns decimals,
		// even when the range is between 2 integers.
		// Decimals are truncated, not rounded in subsequent operations
	}
	start = false
}

// Handles selecting a card
if _select {
	if cards[index] < 1 {
		types[1, 0] += 100	// Money
	} else if cards[index] < 2 {
		types[1, 1] += 100	// Popularity
	} else if cards[index] < 3 {
		types[1, 2] += 100	// Skills
	} else {
	types[1, 3] += 100		// Luck
	}
	start = true	// Runs the command to randomize cards again
}