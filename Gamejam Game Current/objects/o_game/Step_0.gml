


var _select = false;

if rectangle1.is_mouse_within_rectangle() { _index_of_hover_card = 0; hovering = true; }
else if rectangle2.is_mouse_within_rectangle() { _index_of_hover_card = 1; hovering = true; }
else if rectangle3.is_mouse_within_rectangle() { _index_of_hover_card = 2; hovering = true; }
else if rectangle4.is_mouse_within_rectangle() { _index_of_hover_card = 3; hovering = true; }
else { _index_of_hover_card = -1; hovering = false; }

if (hovering && mouse_check_button_pressed(mb_left)) 
{
	clicked = true;
} 

if (mouse_check_button_released(mb_left)) 
{
	clicked = false;

	if (hovering) 
	{
		_select = true;
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
	global.loss = "Employees"
	room_goto_next()
}	else if global.investor < 0 {
	global.loss = "Investors"
	room_goto_next()
} else if global.public < 0 {
	global.loss = "Public"
	room_goto_next()
}