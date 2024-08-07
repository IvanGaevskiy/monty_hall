def simulate_game(switch)
  car_position = rand(3)
  initial_choice = rand(3)

  if switch
    revealed_door = ([0, 1, 2] - [initial_choice, car_position]).sample
    final_choice = ([0, 1, 2] - [initial_choice, revealed_door]).first
  else
    final_choice = initial_choice
  end

  final_choice == car_position
end

num_simulations = 10000

switch_wins = num_simulations.times.count { simulate_game(true) }
stay_wins = num_simulations.times.count { simulate_game(false) }

puts "Выигрыши при смене выбора: #{switch_wins} из #{num_simulations} (#{(switch_wins.to_f / num_simulations * 100).round(2)}%)"
puts "Выигрыши без смены выбора: #{stay_wins} из #{num_simulations} (#{(stay_wins.to_f / num_simulations * 100).round(2)}%)"