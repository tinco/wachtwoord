require 'securerandom'

class Rng
	def self.rand(lim)
		SecureRandom.random_number(lim)
	end
end

suitable = File.readlines('nl.dic')
	.map(&:chomp)
	.select{|w|w.length >= 3}
	.select{|w|w.length <= 8}

amount = 4
keyspace = suitable.length ** amount
guesses_per_second = 1_000_000
seconds_in_year = 365 * 24 * 60 * 60
years_required = keyspace  / guesses_per_second / seconds_in_year
password = amount.times.map{suitable.sample(random: Rng)}.join('')

puts "Suitable passwords: #{suitable.length}"
puts "Entropy for #{amount} words: 2^#{Math.log2(keyspace)}"
puts "Years required at 1 million guesses/second: #{years_required.round}"
puts "Password: #{password}"