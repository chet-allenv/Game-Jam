// Gamemaker runs on the same RNG value each time it is run, unless randomize() is used
randomize()

test = 0
// 2D array storing the effect of the card and sprites
// Stores the names of each column
types[0, 0] = "Money"
types[0, 1] = "Popularity"
types[0, 2] = "Skills"
types[0, 3] = "Luck"

// Stores the value of each attribute
types[1, 0] = 1000	// Money
types[1, 1] = 0	// Popularity
types[1, 2] = 0	// Skills
types[1, 3] = 0	// Luck

// Stores the sprite of each attribute
types[2, 0] = spr_money
types[2, 1] = spr_popularity
types[2, 2] = spr_skills
types[2, 3] = spr_luck

// Stores the types of each event
events[0, 0] = "Raise"
events[0, 1] = "Stocked"
events[0, 2] = "Professional"
events[0, 3] = "Ads"
events[0, 4] = "Trend"

// Stores the number of each event happening
events[1, 0] = 0	// Raise
events[1, 1] = 0	// Stocked
events[1, 2] = 0	// Professional
events[1, 3] = 0	// Ads
events[1, 4] = 0	// Trend

// Stores the sprite of each event
events[2, 0] = spr_raise
events[2, 1] = spr_stocked
events[2, 2] = spr_professional
events[2, 3] = spr_ads
events[2, 4] = spr_trend

// Stores the types of bad events
bad_events[0, 0] = "Charity"
bad_events[0, 1] = "Copyright"
bad_events[0, 2] = ""

// Stores the number of each bad event happening
bad_events[1, 0] = 0
bad_events[1, 1] = 0
bad_events[1, 2] = 0

// Stores the types of bad events
bad_events[2, 0] = spr_charity
bad_events[2, 1] = spr_copyright
bad_events[2, 2] = false

// Actual cards (randomized in "step")
cards = [0, 0, 0, 0]

// Event cards
event_cards = [0, 0, 0]

// Indicates which card the player is hovering over
index = 0

// Number of cards picked so far (rounds)
cards_chosen = 0

// Picks the next event round
event_round = 5

// Indicates if it is a bad event
bad_event = false

// Variables affecting stat calculations:
m_raise = 1 // Multiplier affecting how much employees are paid
m_cash = 1	// Multiplier affecting how much money is gained
m_popularity = 1 // Multiplier affecting how much popularity is gained
m_skills = 1 // Multiplier affecting how much skills is gained


// This method is to be run when the card is selected.
function select_card()
{
	
	// Uses luck to randomly have beneficial effects
	var _luck = floor(random_range(0, types[1, 3]))
	// This is to be overridden...
	if cards[index] < 1 {
		// Extra cash calculation:
		var _payment = (m_cash * 100) + (types[1, 2] / 10) + floor(_luck * (types[1, 2] / 10))
		types[1, 0] += _payment	// Money
	} else if cards[index] < 2 {
		var _popularity = (m_popularity * 10) + (_luck)
		types[1, 1] += _popularity	// Popularity
	} else if cards[index] < 3 {
		types[1, 2] += 50	// Skills
	} else {
	types[1, 3] += 1		// Luck
	}
			types[1,0] = types[1,0] - (100 * m_raise)		// Employee pay each round, not during event rounds
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
	var _array
	var _range
	if cards_chosen % event_round == 0 and cards_chosen != 0 {
		_array = event_cards
		_range = 4.99	// Change this later to reflect the number of event cards that can appear
		if random_range(0, 10) < (3 - min((types[1, 3] / 25), 2)) {
			bad_event = true
			_range = 1.99 // Change this later to reflect the number of event cards that can appear
		}
		 
	}	else {
		_array = cards
		_range = 3.99
	}
	test = _range
	for (var i = 0; i < array_length(_array); i++) {
		_array[i] = random_range(0, _range)
		// Because of how random_range() works, it returns decimals,
		// even when the range is between 2 integers.
		// Decimals are truncated, not rounded in subsequent operations
	}
	index = 0
}

// Shuffles cards immediately
shuffle()