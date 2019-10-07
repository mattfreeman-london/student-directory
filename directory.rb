def input_students
  puts "Please enter the names of the students, then country of birth, then their favourite hobby."
  puts "To finish, just hit return twice."
  students = []
  name = gets.capitalize.chomp
  country = gets.capitalize.chomp
  hobby = gets.chomp
  while !name.empty? do
    students << {name: name, country: country, cohort: :November, hobby: hobby}
    puts "Now we have #{students.count} students"
    name = gets.capitalize.chomp
    country = gets.capitalize.chomp
    hobby = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy:".center(40)
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort, #{student[:country]}, #{student[:hobby]})".center(40)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students.".center(40)
end

students = input_students
print_header
print(students)
print_footer(students)