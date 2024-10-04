// Draws basic text
draw_set_color(c_white)	
draw_set_font(fnt_card_description)// Font color	


// Draws the number of cards chosen so far (rounds)
draw_text(room_width - 50, room_height * .875, cards_chosen)

// Draws the current value of each attribute


draw_set_halign(fa_center)
// Variables that adjust positions of variables depending on the number of cards:

// Loops over the cards array to draw each card

for (var i = 0; i < 4; i++) {
	
	if cards_chosen % 5 == 0 and cards_chosen != 0 {
		draw_sprite_ext(current_event[0]._sprite, 0, (room_width / 2) - sprite_get_width(current_event[0]._sprite) / 8, room_height / 3.25, 0.25, 0.25, 0, c_white, 1)	
		draw_text(room_width / 2 + 25, room_height * 0.15, current_event[0]._description)
	} else {
		if is_mouse_over_card(i)
		{ 
			draw_sprite_ext(current_cards[i]._sprite, 0, (room_width * 0.125 + (i * _space)) - sprite_get_width(current_cards[i]._sprite) / 16, room_height / 3, .25, .25, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(current_cards[i]._sprite, 0, room_width * 0.125 + (i * _space), room_height / 3, .125, .125, 0, c_white, 1);
		}
	}
}

function draw_card_regular(_index)
{
	if cards_chosen % 5 == 0 and cards_chosen != 0 {
		draw_sprite_ext(current_event[0]._sprite, 0, (room_width / 2) - sprite_get_width(current_event[0]._sprite) / 8, room_height / 3.25, 0.25, 0.25, 0, c_white, 1)	
	} else {
	draw_sprite_ext(current_cards[_index]._sprite, 0, room_width * 0.125 + (_index * _space), room_height / 3, .125, .125, 0, c_white, 1);
	}
}

function draw_cards_regular(pos0, pos1, pos2, pos3)
{
	if cards_chosen % 5 == 0 and cards_chosen != 0 {
		draw_sprite_ext(current_event[0]._sprite, 0, (room_width / 2) - sprite_get_width(current_event[0]._sprite) / 8, room_height / 3.25, 0.25, 0.25, 0, c_white, 1)	
	}	else {
	if pos0 { draw_card_regular(0) };
	if pos1 { draw_card_regular(1) };
	if pos2 { draw_card_regular(2) };
	if pos3 { draw_card_regular(3) };
	}
}

function draw_big_card(_index)
{
	if cards_chosen % 5 == 0 and cards_chosen != 0 {
		draw_sprite_ext(current_event[0]._sprite, 0, (room_width / 2) - sprite_get_width(current_event[0]._sprite) / 8, room_height / 3.25, 0.25, 0.25, 0, c_white, 1)	
	} else {
		draw_sprite_ext(current_cards[_index]._sprite, 0, (room_width * 0.125 + (_index * _space)) - sprite_get_width(current_cards[_index]._sprite) / 16, room_height / 3, .25, .25, 0, c_white, 1);

	    draw_text(room_width / 2 + 20, 120, current_cards[_index]._description); // Display the hover message
	}
}

switch _index_of_hover_card
{
	case 0:
		draw_big_card(0);
		draw_cards_regular(false, true, true, true);
		break;
	case 1:
		draw_big_card(1);
		draw_cards_regular(true, false, true, true);
		break;
	case 2:
		draw_big_card(2);
		draw_cards_regular(true, true, false, true);
		break;
	case 3:
		draw_big_card(3);
		draw_cards_regular(true, true, true, false);
		break;
	default:
		draw_cards_regular(true, true, true, true);
		break;
}