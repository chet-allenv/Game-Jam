// Gamemaker runs on the same RNG value each time it is run, unless randomize() is used
randomize()

// Indicates which card the player is hovering over
index = 0

// Number of cards picked so far (rounds)
cards_chosen = 0

// Picks the next event round
event_round = 5

// Cards
current_cards = [0, 0, 0, 0]

// Instantiation of cards (and putting them in an array)
for (var i = 0; i < 20; i++) {
	var _card = instance_create_layer(0, 0, "instances", o_normal_cards)
	all_cards[i] = _card
	
	// Setting the values:
	switch(i) {
		case 0: _card.set_values("Sponsoring", -5, 0, 5, 5, spr_luck, ""); break;
        case 1: _card.set_values("Employee Raise", 5, 5, -5, 0, spr_raise, ""); break;
        case 2: _card.set_values("Employee Party", -5, 5, 0, 0, spr_luck, ""); break;
        case 3: _card.set_values("Copyright Claim", 5, 0, 5, -5, spr_copyright, ""); break;
        case 4: _card.set_values("Acquisition", 5, 0, 5, -5, spr_luck, ""); break;
        case 5: _card.set_values("Charity Donation", 5, 0, -5, 5, spr_luck, ""); break;
        case 6: _card.set_values("Charity Work", 5, -5, 0, 5, spr_luck, ""); break;
        case 7: _card.set_values("Trending Medicine", 5, -5, 5, 0, spr_trend, ""); break;
        case 8: _card.set_values("Tax Evasion", 10, -5, 0, -5, spr_luck, ""); break;
        case 9: _card.set_values("Cost Cutting", 5, -5, 5, 0, spr_luck, ""); break;
        case 10: _card.set_values("Pop Up Ads", 5, 0, 5, -5, spr_ads, ""); break;
        case 11: _card.set_values("Professional Hire", 0, 0, 0, 0, spr_professional, ""); break;
        case 12: _card.set_values("Well Stocked", 0, 0, 0, 0, spr_stocked, ""); break;
        case 13: _card.set_values("\"Personal\" Expenses", 10, -5, -5, 0, spr_luck, ""); break;
        case 14: _card.set_values("Outsourcing", 5, -5, 10, -5, spr_luck, ""); break;
        case 15: _card.set_values("Environmental Initiative", 5, 0, -5, 5, spr_luck, ""); break;
        case 16: _card.set_values("International Expansion", 5, -5, 5, 0, spr_luck, ""); break;
        case 17: _card.set_values("Privacy Policy Update", 10, -5, 0, -5, spr_luck, ""); break;
        case 18: _card.set_values("Remote Work Policy", 5, 5, -5, 0, spr_luck, ""); break;
        case 19: _card.set_values("Subscription Service", 5, 0, 5, -5, spr_luck, ""); break;
	}
}


for (var i = 0; i < 20; i++) {
    if (all_cards[i] != noone) {
        // Print the default values (you might want to adjust this based on your initial values)
        show_debug_message("Card " + string(i) + " - ID: " + string(all_cards[i]) + ", Name: " + all_cards[i]._name);
    } else {
        show_debug_message("Card " + string(i) + " is no longer valid.");
    }
}

// Variables affecting stat calculations:
m_raise = 1 // Multiplier affecting how much employees are paid
m_cash = 1	// Multiplier affecting how much money is gained
m_popularity = 1 // Multiplier affecting how much popularity is gained
m_skills = 1 // Multiplier affecting how much skills is gained

// This method is to be run when the card is selected.
function select_card()
{
	for (var i = 0; i < 4; i++) {
		if index == i {
			global.money += current_cards[i]._money_change
			global.employee += current_cards[i]._employee_change
			global.investor += current_cards[i]._investor_change
			global.public += current_cards[i]._public_change
		}
	}
	cards_chosen++
	shuffle()
}

// This method is to be run when an event card is selected.
function select_event()
{	if bad_event {
		if event_cards[index] < 1 {
			bad_events[1, 0]++	// Increments charity event counter
			m_popularity += 0.5	// Increases popularity gain
			types[1, 0] /= 2	// - 1/2 Money
		}	else if event_cards[index] < 2 {	// Copyright
			bad_events[1, 1]++	// Increments copyright event counter
			m_popularity += 0.2	// Increases popularity gain
			m_skills += 0.2		// Increases skills gain
			types[1, 0] = floor(types[1, 0] * 0.6)	// - Money
			types[1, 1] = floor(types[1, 1] * 0.6)	// + Popularity
			types[1, 2] = floor(types[1, 2] * 0.6)	// + Skills
		}
		bad_event = false
} else {
	if event_cards[index] < 1 {	// Raise
		events[1, 0] ++	// Increments raise event counter
		m_raise += 0.2		// Increases raise
		m_popularity += 0.2	// Increases popularity gain
		types[1, 1] += 500	// + Popularity
		types[1, 2] += 100	// + Skills
	}  else if event_cards[index] < 2 {	// Stocked
			events[1, 1]++	// Increments the stocked event counter
			types[1, 0] += 1000	// + Money
			types[1, 2] -= 50	// - Skills
	}	else if event_cards[index] < 3 {	// Professional
			events[1, 2]++	// Increments the professional event counter
			m_skills += 0.5	// Increases skills gain
			types[1, 0] -= 1000	// - Money
			types[1, 1] += 100	// + Popularity
			types[1, 2] += 1000	// + Skills
	}	else if event_cards[index] < 4 {	// Pop-up ads
			events[1, 3]++	// Increments the ads event counter
			m_cash += 0.5	// Increases money gain
			types[1, 1] = floor(types[1, 1] * 0.75)	// - Popularity
	}	else if event_cards[index] < 5 {
			events[1, 4]++ // Increments the trend machine event counter
			types[1, 0] = floor(types[1, 0] * 1.1)	// + Money
			types[1, 1] = floor(types[1, 1] * 0.8)	// - Popularity
			
	}
}
	event_round = floor(random_range(5, 11))
	cards_chosen++
	shuffle()
}

// This method shuffles cards
// Basic logic for randomizing the cards that appear
function shuffle() {
	for (var i = 0; i < 4; i++) {
		_new = choose(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13, 14, 15, 16, 17, 18, 19)
		current_cards[i] = all_cards[_new]
	}
}

// Shuffles cards immediately
shuffle()