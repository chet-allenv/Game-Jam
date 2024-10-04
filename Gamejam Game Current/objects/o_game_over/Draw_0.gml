draw_set_font(fnt_menu)

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
draw_set_font(fnt_text)
if global.loss == "Cash" {
	draw_set_color(c_yellow)
	_text = "You ran out of cash!\nManage funds better next time..."
}	else if global.loss == "Popularity" {
	draw_set_color(c_red)
	_text = "The public has turned against you!\nWork on your popularity more next time..."
}	else if global.loss == "Skills" {
	draw_set_color(c_purple)
	_text = "You ran out of skilled laborers!\nYour company is nothing without employees.\nManage them better next time..."
}

draw_text(room_width / 2, room_height * 0.2, _text)