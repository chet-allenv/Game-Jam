if start {
	count += delta_time / 200000
		if count >= 1 {
			start = false
		}
} else {
	count -= delta_time / 200000
}