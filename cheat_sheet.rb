#commands that are available to search in the commandline menu
@commands_array = ['mv', 'cp', 'mkdir', 'ls', 'rm']

cheatsheet_menu_items = 3


def menu_display
	puts "CHEATSHEET MENU"
	puts "1. Command Line"
	puts "2. Search"
	puts "3. Exit"
end

# terminates the program
def terminate
	abort('Bye!')
end


# shows command line menu options
def commandline_menu
	command_selection = ''

	#this loop is set to run as long as the user doesn't want to go back
	while command_selection != 'back'
		puts 'These are the commands:'
		commands_array.each_with_index { |cmd, i| puts "#{i + 1}. #{cmd}" }
		puts "#{@commands_array.count + 1}. BACK"
		print 'Please select a command >'
		command_selection = gets.strip

		search(command_selection)
	end
end

# user selects the search option
def search_menu
	puts 'Now you can search!'
	command_selection = ''
	while command_selection != 'back'
		puts "For what would you like to search?"
		command_selection = gets.strip

		search(command_selection)
	end
end

# search method
def search(term)
	if term.downcase == 'exit'
		terminate
	else
		if term.to_i == 0 && term != 'back'
			puts `man #{term}`
		elsif term.to_i <= @commands_array.count && term != 'back'
			puts `man #{@commands_array[term.to_i - 1]}`
		elsif term == @commands_array.count + 1
			term = 'back'
		end	
	end
end



		# if term.to_i == 0
		# 	puts `man #{term}`
		# elsif term.to_i <= @commands_array.count
		# 	puts `man #{@commands_array[term.to_i - 1]}`
		# else
		# 	puts '`man #{@commands_array[term.to_i - 1]}`'	
		# end	





# The program will start running here because it is always true
while true
	menu_display
	print "\nPlease make a selection >"
	menu_selection = gets.strip
	case menu_selection.downcase
	when '1', 'command line'
		commandline_menu
	when '2', 'search'
		search_menu
	when '3', 'exit'
		terminate
	else
		puts 'This is not a valid option.'
	end
end