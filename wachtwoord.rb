suitable = File.readlines('nl.dic')
	.map(&:chomp)
	.select{|w|w.length >= 3}
	.select{|w|w.length <= 8}

amount = 4
keyspace = suitable.length ** amount
guesses_per_second = 1.0 / 1_000_000
seconds_in_year = 365 * 24 * 60 * 60
years_required = keyspace  * guesses_per_second / seconds_in_year

puts "Suitable passwords: #{suitable.length}"
puts "Entropy for #{amount} words: 2^#{Math.log2(keyspace)}"
puts "Years required at 1 million guesses/second: #{years_required.round}"
puts "Password: #{3.times.map{suitable.sample}.join('')}"