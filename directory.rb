def input_students
  puts 'Please enter the names of the students.'
  puts 'To finish, just hit return twice.'
  students = []
  name = gets.capitalize.chomp
  until name.empty?
    students << { name: name, cohort: :november }
    if students.count == 1
      puts "Now we have #{students.count} student."
    elsif students.count > 1
      puts "Now we have #{students.count} students."
    end
    name = gets.capitalize.chomp
  end
  students
end

def print_header
  puts 'The students of Villains Academy are:'
  puts '-------------'
end

def print(students)
  if students.count == 0
    puts "There are no students enrolled."
  end
  students.each do |student|
    if student[:cohort].to_s == 'november'
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  if students.count == 1
    "Overall, we have #{students.count} great student."
  else
    puts "Overall, we have #{students.count} great students."
  end
end

students = input_students
print_header
print(students)
print_footer(students)
