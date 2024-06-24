fn collatz(seed int) int {
	mut steps := 0
	mut temp_seed := seed
	for temp_seed > 1 {
		if temp_seed % 2 == 0 {
			temp_seed /= 2
		} else {
			temp_seed = temp_seed * 3 + 1
		}
		steps++
	}
	return steps
}

fn main() {
	mut collatz_result := 0
	for seed := 1; seed <= 1_000_000; seed++ {
		collatz_result += collatz(seed)
	}
	println('steps $collatz_result')
}
