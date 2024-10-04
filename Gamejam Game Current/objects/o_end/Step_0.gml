timer += delta_time / 1000000

if start {
	if timer % 0.1 {
		count += 0.5
		if count == 1 {
			start = false
		}
	}
} else {
	if timer % 0.1 {
		count -= 0.5
	}
}