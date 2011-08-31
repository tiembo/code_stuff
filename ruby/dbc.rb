# i'm assuming that there are no 0-calorie activities

def sum_of_activities(array, combination)
  array.collect {|i| i.values}.combination(combination).collect {|c| c.reduce(:+)}
end

num_inputs = nil
i = 0

exercise = []
food = []

$stdin.each_line do |line|
  if num_inputs.nil?
    num_inputs = line.to_i 
    raise("First value must be between 1 and 50") if num_inputs < 1 or num_inputs > 50 # also catches non-numeric values
    break if num_inputs == 1 # need at least two inputs.
  else
    action = line.split
    cal_gain_or_loss = action.last.to_i
    if cal_gain_or_loss >= 0
      food << {action.first => cal_gain_or_loss}
    else
      exercise << {action.first => cal_gain_or_loss}
    end
  end
  break if i == num_inputs
  i += 1
end

output = ""
if exercise.empty? or food.empty?
  output = "no solution\n"
else
  found = false
  1.upto(exercise.length) do |e|
    exercise_values = sum_of_activities(exercise, e)
    1.upto(food.length) do |f|
      food_values = sum_of_activities(food, f)
      puts "food: #{f}, #{food_values}"
      puts "exercise: #{e}, #{exercise_values}"
      unless (food_values & exercise_values).empty?
        found = true
        break
      end
    end
  end
  puts found
end

$stdout << output
