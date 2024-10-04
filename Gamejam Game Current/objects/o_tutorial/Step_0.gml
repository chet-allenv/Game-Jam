if (char_index < string_length(texts[index])) {
	timer += delta_time / 1000000
			 
	if (timer > text_speed) {
		char_index += 1
		timer = 0
	}
}
displayed_text = string_copy(texts[index], 0, char_index)

for (var i = 0; i < 18; i++) {
	if (displayed_text == texts[i]) {
		displayed_text = ""
		char_index = 0
		index++
		if (i == 17) {
			room_goto_next()	
		}
	} 
}
