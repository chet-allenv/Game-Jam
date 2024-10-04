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

hovering = false;
clicked = false;
_index_of_hover_card = -1;

_space = 300

// Instantiation of cards (and putting them in an array)
for (var i = 0; i < 20; i++) {
	var _card = instance_create_layer(0, 0, "instances", o_normal_cards)
	all_cards[i] = _card
	
	// Setting the values:
	switch(i) {
		case 0: _card.set_values("Sponsoring", -5, 0, 5, 5, sponsors, "Your company is considering sponsoring\ncreators on a popular social media\nplatform. It will cost some funding\nfrom you upfront, but you could potentially\nreach a new audience."); break;
        case 1: _card.set_values("Employee Raise", 5, 5, -5, 0, raise, "A group of employees have banded together\nto ask for a pay raise from all of\ntheir hard work. Giving them one\nwould make them quite happy, but\nmight not go over well with your investors."); break;
        case 2: _card.set_values("Employee Party", -5, 5, 0, 0, party, "Your employees are asking for an office\nparty to celebrate the success of your most\nrecent medicine. This is a good\nopportunity to raise morale,\nbut youll have to pay out of pocket."); break;
        case 3: _card.set_values("Copyright Claim", 5, 0, 5, -5, copyright, "Youve discovered a popular online video\nthat uses unlicensed footage of one\nof your products! People may get angry\nif you press charges, but youll make a\ngood chunk of money doing so."); break;
        case 4: _card.set_values("Acquisition", 5, 0, 5, -5, aquisition, "You have an opportunity to absorb a smaller\npharmacy and merge all of your assets\nto expand your company. Investors\nwill be overjoyed to hear this, but the\npublic may see this as monopolization."); break;
        case 5: _card.set_values("Charity Donation", 5, 0, -5, 5, charity, "The monthly Charity For Children event\nis happening tomorrow. Donating would net\nyou some goodwill with the public,\nbut may agitate some of your investors."); break;
        case 6: _card.set_values("Charity Work", 5, -5, 0, 5, charity_work, "Your company is considering hosting a\nmandatory community service event to build\nhouses for the homeless. This would\ndefinitely increase your standing with\nthe public, but might annoy the employees\nyou are forcing to work there."); break;
        case 7: _card.set_values("Trending Medicine", 5, -5, 5, 0, trend, "A new type of medicine that rapidly\ntreats pneumonia has been developed.\nInvesting in it would benefit the growth of\nyour company, but would add another thing\nfor your employees to serve to customers."); break;
        case 8: _card.set_values("Tax Evasion", 10, -5, 0, -5, evasion, "One of your lawyers has found a\nloophole that would allow the company to\nkeep every single penny that would normally\ngo to paying taxes! This extra money\ncould go directly into your wallet,\nbut the public and your employees would\njudge you harshly for doing so."); break;
        case 9: _card.set_values("Cost Cutting", 5, -5, 5, 0, null_texture, "The company is considering cutting\nback on operating expenses in your\nlocations across the board. Your employees\nmay not like having some of their complementary\nluxuries taken away, but that money\ncan be used for other purposes."); break;
        case 10: _card.set_values("Pop Up Ads", 5, 0, 5, -5, pop_up, "Your company is thinking about investing\nin pop-up advertisements on websites\nincrease revenue from clicks. This may\nattract new customers to your pharmac and\nincrease revenue, but will frustrate anyone who\nisnt interested in your business."); break;
        case 11: _card.set_values("Professional Hire", -15, 15, 5, 0, professional, "A very professional resume\nhas hit your files...\nthey want more money\nbut are good for business."); break;
        case 12: _card.set_values("Well Stocked", 0, 0, 0, 5, stocked, "A simple way to\nplease the public"); break;
        case 13: _card.set_values("\"Personal\" Expenses", 10, -5, -5, 0, expenses, "You are thinking of upgrading\nyour degree of living\nwith a few more yachts,\nand where better is there to\nborrow these funds than from your own company?\n Youll be one step closer to being a billionaire,\n but your investors and workers\nwill be furious when they find out."); break;
        case 14: _card.set_values("Outsourcing", 5, -5, 10, -5, outsourced, "Your company has the opportunity to outsource\nproduction to a foreign country where labor\nis much cheaper. This would lower\nyour production costs and make investors\nhappy, but would result in letting go\nof some of your employees\nwhile also damaging your public image."); break;
        case 15: _card.set_values("Environmental Initiative", 5, 0, -5, 5, environment, "Your PR team has proposed to switch over\nto more environmentally friendly materials\nfor making your medicines. The public\nwould consider this a good move, but your\ninvestors wont like the loss in profits."); break;
        case 16: _card.set_values("International Expansion", 5, -5, 5, 0, expansion, "The company is thinking about branching\nout and selling your products in other\nneighboring countries. This would make\nyour brand more recognizable\nand overall increase revenue,\nbut adds more unpaid training\nthat employees will have to complete."); break;
        case 17: _card.set_values("Privacy Policy Update", 10, -5, 0, -5, private_policy, "Youre thinking about adding some fine\n print in the privacy policy for\nyour customers that will allow you to\ngather and sell their data. The workers\nwouldnt be happy about another task\nto remember and your customers would\nsurely be upset, but selling that data would\ngive you an extra source of income."); break;
        case 18: _card.set_values("Remote Work Policy", 5, 5, -5, 0, remote_work, "Your company is considering making\nremote work an option for your\nemployees. Not having to commute everyday\nwould make everyones mood better,\nbut may hurt productivity."); break;
        case 19: _card.set_values("Subscription Service", 5, 0, 5, -5, null_texture, "Your team has proposed to implement a\nnew service for your pharmacy that charges\ncustomers monthly fees to get their \nmedicine. This would attract more investors, \nbut would anger your loyal customers."); break;
	}
}

for (var i = 0; i < 5; i++)
{
	var _event_card = instance_create_layer(0, 0, "instances", o_event_cards);
	all_events[i] = _event_card;
	
	switch i
	{
		case 0:
			_event_card.set_values("Data Ransom", value_change(-10, 0, 0, 0),)


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
		_new = choose(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19)
		current_cards[i] = all_cards[_new]
	}
}

function is_mouse_over_card(_card_index)
{
	return collision_point(mouse_x, mouse_y, current_cards[_card_index], false, true);
}

function rectangle_struct(_x1, _x2)
{
	return {
		X1: _x1,
		X2: _x2,
		
		is_mouse_within_rectangle: function()
		{
			return point_in_rectangle(mouse_x, mouse_y, X1, 230, X2, 484);
		}
	}
}

rectangle1 = rectangle_struct(150, 310);
rectangle2 = rectangle_struct(430, 590);
rectangle3 = rectangle_struct(712, 880);
rectangle4 = rectangle_struct(992, 1153);


// Shuffles cards immediately
shuffle()