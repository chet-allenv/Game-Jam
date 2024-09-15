draw_set_halign(fa_center)
draw_set_font(fnt_menu)

// Space between text
var _gap = 100

// Draws items
for (var i = 0; i < array_length_2d(menu, sub_menu); i++) {

	// Draws the text
	draw_set_color(c_white)
	if i == index draw_set_color(c_red)
    draw_text(room_width / 2, room_height / 2 + _gap * i, menu[sub_menu, i])

}

// Mushroom:
var _text = "Mushroom Game"
if mushroom < 1000 draw_set_color(c_white)
else if mushroom > 999 and mushroom < 1999 draw_set_color(c_yellow)
else if mushroom > 1999 and mushroom < 2999 draw_set_color(c_orange)
else draw_set_color(c_red)

if mushroom > 4999 _text += " Mushroom"

draw_text(room_width / 2, room_height * 0.1, _text)