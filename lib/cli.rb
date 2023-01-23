class CLI 
    def run 
        User.seed
        system('clear')
        greeting
        signup_or_login
        while menu != "exit"
        end
        end_program
    end

    def signup_or_login
        response = ""
        
        while response != 'login' && response!= 'signup'
            puts "Do you want to login or signup?"
            response = gets.chomp 
        end

        if response == 'login'
            login
        else 
            signup 
        end
    end

    def login
        authenticate = false
        while authenticate != true
          puts "Please enter your username."
          username = gets.chomp
          puts "Please enter your password."
          password = gets.chomp
    
          if Auth.authenticate_user(User.all, username, password)
            authenticated = true
            puts "login successful!"
            break
          else 
            puts "Please try logging in again."
          end
        end
    end 

      def signup
        puts "Please enter a username"
        username = gets.chomp
        puts "Please enter a password"
        password = gets.chomp
        puts "Sign up successful. Please login."
        User.new(username, password)
        login
      end

    def menu
        user_input = ""

        while user_input != "exit"
            puts "Request details by country name"
            user_input = gets.chomp

            break if user_input == 'exit'

            Scraper.scrape_and_print_countries(user_input)
        end
    end

    def greeting
        puts "Welcome!"
    end

    def end_program
        puts "See you later!"
    end

end
