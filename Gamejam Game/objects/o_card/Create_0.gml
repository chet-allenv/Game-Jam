// Gamemaker runs on the same RNG value each time it is run, unless randomize() is used
randomize()

// 2D array storing the effect of the card and sprites
// Stores the names of each column
types[0, 0] = "Money"
types[0, 1] = "Popularity"
types[0, 2] = "Skills"
types[0, 3] = "Luck"

// Stores the value of each attribute
types[1, 0] = 0
types[1, 1] = 0
types[1, 2] = 0
types[1, 3] = 0

// Stores the sprite of each attribute
types[2, 0] = spr_money
types[2, 1] = spr_popularity
types[2, 2] = spr_skills
types[2, 3] = spr_luck

// Actual cards (randomized in "step")
cards = [0, 0, 0, 0]

// Indicates which card the player is hovering over
index = 0

// Controls when to swap cards
start = true

// This method is to be run when the card is selected.
function select_card()
{
	// This is to be overridden...
	if cards[index] < 1 {
		types[1, 0] += 100	// Money
	} else if cards[index] < 2 {
		types[1, 1] += 100	// Popularity
	} else if cards[index] < 3 {
		types[1, 2] += 100	// Skills
	} else {
	types[1, 3] += 100		// Luck
	}
	start = true	// Runs the command to randomize cards again
}