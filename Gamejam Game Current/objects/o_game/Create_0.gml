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
	var _card = instance_create_layer(0, 0, 0, o_normal_cards)
	all_cards[i] = _card
}

if (all_cards[10] != noone) {
	all_cards[0].set_values("Sponsoring", 0, 0, 5, 5, spr_luck, "")
	all_cards[1].set_values("Employee Raise", 0, 5, -5, 0, spr_raise, "")
	all_cards[2].set_values("Employee Party", 0, 5, 0, 0, spr_luck, "")
	all_cards[3].set_values("Copyright Claim", 0, 0, 5, -5, spr_copyright, "")
	all_cards[4].set_values("Acquisition", 0, 0, 5, -5, spr_luck, "")
	all_cards[5].set_values("Charity Donation", 0, 0, -5, 5, spr_luck, "")
	all_cards[6].set_values("Charity Work", 0, -5, 0, 5, spr_luck, "")
	all_cards[7].set_values("Trending Medicine", 0, -5, 5, 0, spr_trend, "")
	all_cards[8].set_values("Tax Evasion", 0, -5, 0, -5, spr_luck, "")
	all_cards[9].set_values("Cost Cutting", 0, -5, 5, 0, spr_luck, "")
	all_cards[10].set_values("Pop Up Ads", 0, 0, 5, -5, spr_ads, "")
	all_cards[11].set_values("Professional Hire", 0, 0, 0, 0, spr_professional, "")
	all_cards[12].set_values("Well Stocked", 0, 0, 0, 0, spr_stocked, "")
	all_cards[13].set_values("\"Personal\" Expenses", 0, -5, -5, 0, spr_luck, "")
	all_cards[14].set_values("Outsourcing", 0, -5, 10, -5, spr_luck, "")
	all_cards[15].set_values("Environmental Initiative", 0, 0, -5, 5, spr_luck, "")
	all_cards[16].set_values("International Expansion", 0, -5, 5, 0, spr_luck, "")
	all_cards[17].set_values("Privacy Policy Update", 0, -5, 0, -5, spr_luck, "")
	all_cards[18].set_values("Remote Work Policy", 0, 5, -5, 0, spr_luck, "")
	all_cards[19].set_values("Subscription Service", 0, 0, 5, -5, spr_luck, "")
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
	global.money -= 10		// Employee pay each round, not during event rounds
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
		var _temp = array_choose(all_cards)
		current_cards[i] = _temp
	}
}

// Shuffles cards immediately
shuffle()