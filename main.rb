require_relative 'monty_hall.rb'

monty = MontyHall.new

count_cycle = 1000

count_cycle.times do
  # Перетасовали рандомно от 0 до 20 раз.
  monty.shuffle_values_doors(rand(20))

  # Выбрали рандомную дверь из перетасованного массива.
  choose_door = monty.choose_door(rand(3))

  # Если выбрана дверь с автомобилем, переходим к следующей итерации.
  next if choose_door == "win_no_change +1"

  # Удаляем вторую проигрышную дверь.
  monty.remove_an_extra_door

  # Обновляем счётчики побед.
  monty.update_win_yes_change
end

puts "  Сыграно раз               | #{count_cycle}"
puts "  Побед с изменением двери  | #{monty.win_yes_change}"
puts "  Побед без изменения двери | #{monty.win_no_change}"
