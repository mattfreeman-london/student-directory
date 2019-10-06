# let's put all the students into an array
students = [
"Dr Hannibal Lecter",
"Darth Vader",
"Nurse Ratchet", 
"Michael Corleone", 
"Alex DeLarge", 
"The Wicked Witch of the West", 
"Terminator", 
"Freddy Kreuger", 
"The Joker", 
"Joffrey Baratheon", 
"Norman Bates"
]
# and then print them
students.each do |student|
    puts student
end

# finally, we print the total number of students
puts "Overall, we have #{students.count} great students."