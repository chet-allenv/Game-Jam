for (var i = 0; i < 18; i++) {
	switch(i) {
		case 0: texts[i] = "Listen closely, the Mushrooms found me and I don't \nhave much time left...          "; break;
		case 1: texts[i] = "It's your... turn now...\nI couldn't manage our company, I'm sorry...          "; break;
		case 2: texts[i] = "It's all up to you... to bring... \nour business back from the grave...          "; break;
		case 3: texts[i] = "Hehe... our \"business\" indeed...          "; break;
		case 4: texts[i] = "To run the business... \nyou must be able to manage four areas perfectly...          "; break;
		case 5: texts[i] = "Money - obviously. \nGo bankrupt and our \"plans\" are ruined...          "; break;
		case 6: texts[i] = "Employees - personally, I said heck 'em... \n\nbut look where that got us...          "; break;
		case 7: texts[i] = "Investors - they're... important. \nYou understand the nature of our business. \n\nI need not say more...          "; break;
		case 8: texts[i] = "The Public - no matter our...\n\"product,\"\ncustomers won't buy if they hate us...          "; break;
		case 9: texts[i] = "If any of these drops below 0, you're done for...          "; break;
		case 10: texts[i] = "Me...?\n\nWell I...\n\nThat's my own secret..."; break;
		case 11: texts[i] = "Anyways...          "; break;
		case 12: texts[i] = "The business... we constantly face decisions...\n\nyou would do well to...\nremember...          "; break;
		case 13: texts[i] = "Your decisions matter...\nThere are benefits and drawbacks...\nto every decision...          "; break;
		case 14: texts[i] = "Sometimes, you'll only have one...\nOne decision...\n\nTo those, you must accept or decline...          "; break;
		case 15: texts[i] = "Surely... you can do... better than me... right...?          "; break;
		case 16: texts[i] = "You must... be the one...\nThe one to take us...\nTo...\n\n\nThe \"end...\"          "; break;
		case 17: texts[i] = "Good... bye... old friend...\n\n\n\n\n\nHeh...\n\n\n\n\n\n\"Good luck\" indeed...\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"; break;
	}
}


if global.loss == "Cash" {
	texts[10] = "Me...?\n\nWell I...\n\nI couldn't manage the cash.\nI though we could manage but...\n\nMoney's your lifeblood...\n\n\nDon't forget that...          "
}	else if global.loss == "Employees" {
	texts[10] = "Me...?\n\nWell I...\n\nI couldn't manage the Employees.\nI thought I should ignore them but...\n\nNo workers, no produce.\nNo produce, no business.\n\n\nSimple as that...          "
}	else if global.loss == "Investors" {
	texts[10] = "Me...?\n\nWell I...\n\nI couldn't manage the investors.\nI thought they were useless but...\n\nInvestors are our future.\nWe need them for expansion.\nThey sided with our rivals...\n\n\nGet them back...          "
}	else if global.loss == "Public" {
	texts[10] = "Me...?\n\nWell I...\n\nI couldn't manage the the public.\nI focused too hard on the business but...\n\nPublic opinion is essential...\nNo customers and well...\n\n\nAnd nothing else matters...          "
}	else {
	texts[10] =  " unknown loss value."	
}

text_speed = 0.05
char_index = 0
index = 0
timer = 0
displayed_text = ""

