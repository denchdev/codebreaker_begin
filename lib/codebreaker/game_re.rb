module Codebreaker
	class Game
		CodeSize = 4
		def initialize
			puts "Welcome to the game: \nThe game begins. Good Luck To You"
			@secret_code = ""
		end

		def start
			random = Random.new
			CodeSize.times { @secret_code += random.rand(1..6).to_s }
		end

		def game
			gaming = true
			count = 0
			while gaming
				print "Enter your number:  "
				answer = gets
				puts "First element #{hint(0)}" if answer == "hint"
				if answer.length == 5
					result = _check answer
					puts result
					if result == "++++"
						puts "You are win!!!"
						gaming = false
					end
					count += 1
				else
					puts "The answer must be 4 digits" 
				end
				if count > 5
					gaming = false
					puts "You are lose!!!"
				end
			end

			puts "Do you want play more? y/n"
			if gets == "y"
				game 
			else
				puts "By, by" 
			end
		end

		def _check answer
			result = ""
			i = 0
			answer.each_char do |c|
				if c == @secret_code[i]
					result[0, 0] = "+"
				elsif @secret_code.include? c
					result << "-"
				end
				i += 1
			end
			result
		end

		def hint index
			@secret_code[index]
		end
	end
end
