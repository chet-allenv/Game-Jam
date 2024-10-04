


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
		if cards_chosen % 5 == 0 and cards_chosen != 0{
		} else {
		_select = true;
		}
	}
	
} 


// Handles selecting a card
if _select 
{
	select_card();
}

if global.money > global.max_cash {
	global.max_cash = global.money
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
	
// Winning
if global.money >= 10000 and global.employee >= 5000 and global.investor >= 5000 and global.public >= 6000 {
	room_goto(5)
}
	
	
if global.choice != noone and o_no.visible{
	if global.choice == true {
		if current_event[0]._modifier == 0 {
			multipliers[0]++
		} else if current_event[0]._modifier == 1 {
			multipliers[1]++
		} else if current_event[0]._modifier == 2 {
			multipliers[2]++
		} else if current_event[0]._modifier == 3 {
			multipliers[3]++
		}
		global.money += current_event[0]._money_change * multipliers[0]
		global.employee += current_event[0]._employee_change * multipliers[1]
		global.investor += current_event[0]._investor_change * multipliers[2]
		global.public += current_event[0]._public_change * multipliers[3]
	} else {
		global.money -= current_event[0]._money_change * multipliers[0]
		global.employee -= current_event[0]._employee_change * multipliers[1]
		global.investor -= current_event[0]._investor_change * multipliers[2]
		global.public -= current_event[0]._public_change * multipliers[3]
	}
	global.choice = noone
	o_no.visible = false
	o_yes.visible = false
	cards_chosen++
}