require 'csv'
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file."
  puts "4. Load the list from a file."
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    puts "Thanks and goodbye!"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again."
  end
end

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  # get the first name
  name = STDIN.gets.chomp
    # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    info_to_students(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def info_to_students(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy:"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

def save_students
  puts "Please give a filename to save to:"
  filename = gets.chomp
  file = open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "The new students have been added to the list."
end

def load_students
  puts "Please give filename to load from:"
  filename = gets.chomp
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    info_to_students(name, cohort)
  end
  file.close
  puts "List of students loaded."
end

def try_load_students
  if ARGV.first == nil
    filename = "students.csv"
  end
  filename = ARGV.first 
  return if filename.nil? 
  if File.exists?(filename) 
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

try_load_students
interactive_menu