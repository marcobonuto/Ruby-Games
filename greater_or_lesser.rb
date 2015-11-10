def welcome
  puts
  puts 
  puts "       /_\_|_|_/_\                              "
  puts "   n_n | ||. .|| | n_n         Welcome to the   "
  puts "   |_|_|nnnn nnnn|_|_|         Guessing Game!   "
  puts "  |' '  |  |_|  |'  ' |                         "
  puts "  |_____| ' _ ' |_____|                         " 
  puts "        \__|_|__/                               "
  puts
  puts "What is your name?"
  name = gets.strip # Esse método remove os espaços e caracteres em branco
  puts ".\n..\n...\n"
  puts "Are you ready? Lets go #{name} ..."
  name
end

def ask_difficulty
  puts "Which level of difficulty?"
  puts "(1) Very easy (2) Easy (3) Normal (4) Hard (5) Impossible, huaaau, very nice! :D"
  puts "Choice: "
  difficulty = gets.to_i
end

def draws_secret_number(difficulty)
	case difficulty
	when 1
		maximum = 30
	when 2
		maximum = 60
	when 3
		maximum = 100
	when 4
		maximum = 150
	else
		maximum = 200
	end
	puts "Choosing a secret number between 1 e #{maximum}..."
	drawn = rand(maximum) + 1
	puts "Number chosen, you already can start guessing!"
	drawn
end

def ask_number(kicks, attempet, limit_off_attempts)
	puts ".\n..\n...\n"
	puts "Attempet #{attempet} off #{limit_off_attempts}"
	puts "Kicks so far: #{kicks}"
	puts "Enter a number..."
	kick = gets.strip
	puts "You think you hit? You kicked #{kick}"
	kick.to_i
end

def won
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "       CONGRATULATIONS! YOU HIT        "
  puts
end

def check_won(secret_number, kick)
	hit = secret_number == kick
	if hit
		won
		return true
	end
	bigger = secret_number > kick
	if bigger
		puts "The secret number is higher"
	else
		puts "The secret number is lower"
	end
	false
end

def play(name, difficulty)
	secret_number = draws_secret_number difficulty

	limit_off_attempts = 5
	kicks = []
	points_so_far = 1000

	for attempet in 1..limit_off_attempts
		kick = ask_number kicks, attempet, limit_off_attempts
		kicks << kick

		if name == "Marco"
			won
			break
		end

		points_to_lose = (kick - secret_number).abs / 2.0
		points_so_far = points_so_far - points_to_lose
		if check_won secret_number, kick
			break
		end
	end

	puts "You won #{points_so_far} points."
end

def not_to_play?
	puts "Want to play again? (S/N)"
	i_want_to_play = gets.strip
	i_not_to_play = i_want_to_play.upcase == "N"
end

name = welcome
difficulty = ask_difficulty

loop do
	play name, difficulty
	break if not_to_play?
end