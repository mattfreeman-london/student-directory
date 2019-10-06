def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not emmpty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
def print_header
  puts "Introducing the students of this cohort at Villains Academy:"
  puts "-------------"
end
def print(students)
  students.each do |student| 
    if student[:name].length < 12
      puts "#{student[:name]} "
    end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we cal the methods
students = input_students
print_header
print (students)
print_footer(students)
