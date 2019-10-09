@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
    puts "1. Input the students."
    puts "2. Show the students."
    puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, please try again."
  end
end


def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
    name = gets.chomp
  until name.empty?
    @students << { name: name, cohort: :november }
    puts "Now we have #{@students.count} students."
    name = gets.chomp
  end
  @students
end

def show_students
  if @students.count == 0
    puts "There are no students enrolled."
  else
    print_header
    print_students_list
    print_footer
  end
end

def print_header
  puts "The students of Villains Academy:"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu