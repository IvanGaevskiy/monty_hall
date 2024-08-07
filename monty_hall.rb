class MontyHall
  attr_reader :instant_win, :win_yes_change, :win_no_change

  @@doors = ["Коза", "Коза", "Автомобиль"]

  def initialize
    # Счётчики побед.
    @win_yes_change = 0
    @win_no_change = 0

    # Массив с перетасованными значениями.
    @mixed_doors = []

    # Выбранная дверь.
    @my_door_id = nil
    @my_door = nil

    # id двери с автомобилем в @mixed_doors.
    @auto_id = nil
  end

  # ПЕРЕТАСОВКА ДВЕРЕЙ В @mixed_doors N-РАЗ.
  #============================================================================
  def shuffle_values_doors(count)
    count.times do 
    @mixed_doors = @@doors.shuffle
    end
  end

  # ВЫБОР ДВЕРИ.
  #============================================================================
  def choose_door(choice)
    if (0..2).include?(choice)
      @my_door_id = choice
      @my_door = @mixed_doors[@my_door_id]
      @auto_id = @mixed_doors.index("Автомобиль")
      if @my_door_id == @auto_id
        @win_no_change += 1 
        return "win_no_change +1"
      end
    else
      raise "Ожидалось число в диапазоне 0..2. Получено #{choice}."
    end
  end

  # УДАЛЕНИЕ ДРУГОЙ ПРОИГРЫШНОЙ ДВЕРИ.
  #============================================================================
  def remove_an_extra_door
    [0,1,2].each do |i|
      if i != @auto_id && i != @my_door_id
        @mixed_doors.delete_at(i)
      end
    end
  end

  # ОБНОВЛЕНИЕ СЧЁТЧИКА @win_yes_change.
  #============================================================================
  def update_win_yes_change
    # Если выбор меняет дверь
      @win_yes_change += 1 if @my_door_id != @auto_id
  end
end

