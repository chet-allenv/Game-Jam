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
	_text = "You ran out of cash!\nMaybe the next CEO will manage funds better next time..."
}	else if global.loss == "Employees" {
	draw_set_color(c_red)
	_text = "Your employees all quit!\nYour company is nothing without employees.\nMaybe the next CEO will manage them better next time..."
}	else if global.loss == "Investors" {
	draw_set_color(c_purple)
	_text = "You ran out of investors!\nYour company needs its investors.\nMaybe the next CEO will manage them better next time..."
}	else if global.loss == "Public" {
	draw_set_color(c_green)
	_text = "The public has turned against you!\nMaybe the next CEO will be more popular..."
}

draw_text(room_width / 2, room_height * 0.2, _text)