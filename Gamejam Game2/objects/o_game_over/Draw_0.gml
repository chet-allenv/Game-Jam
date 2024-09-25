// Space between text
var _gap = 100

// Draws each option
for (var i = 0; i < array_length(replay); i++) {
	draw_set_color(c_white)
	if index == i draw_set_color(c_red)
    draw_text(room_width / 2, room_height / 2 + _gap * i, replay[i])

}

// Draws game over title:
draw_text(room_width / 2, room_height * 0.1, "And so the legacy passes on...")

// Case specific endings:
var _text
if global.loss == "Cash" {
	_text = "You ran out of cash!\nManage funds better next time..."
}	else if global.loss == "Popularity" {
	_text = "The public has turned against you!\nWork on your popularity more next time..."
}	else if global.loss == "Skills" {
	_text = "You ran out of skilled laborers!\nYour company is nothing without employees.\nManage them better next time..."
}

draw_text(room_width / 2, room_height * 0.2, _text) // Make it so it can tell what ending it was