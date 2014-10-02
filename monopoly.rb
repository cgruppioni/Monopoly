class User
  def initialize
    @user = {0 => 1}
    @spaces = [*1..36]
    @spaces_stats = {}
  end

  def play
    1000000.times do
      turn_number = @user.size
      spaces_to_move = Roll.new.evaluate
      space_to_land_on = @user[turn_number -1] + spaces_to_move

      if space_to_land_on == 28
        space_to_land_on = 10
      end

      if space_to_land_on > 36
        space_to_land_on = space_to_land_on - 36
      end
      @user[turn_number] = @spaces.index(space_to_land_on)
      mark_spot_as_landed_on(space_to_land_on)
    end

    @spaces_stats = @spaces_stats.sort_by {|k,v| v}.reverse
    puts @spaces_stats
  end

  def mark_spot_as_landed_on(space_landed_on)
    if @spaces_stats.has_key?(space_landed_on)
      @spaces_stats[space_landed_on] = @spaces_stats[space_landed_on] + 1
    else
      @spaces_stats[space_landed_on] = 1
    end

  end
end
class Roll
  def initialize
    @die_1_roll_value = Die.new.roll
    @die_2_roll_value = Die.new.roll
  end

  def evaluate
    total_roll_value = @die_1_roll_value + @die_2_roll_value
   
    if @die_1_roll_value == @die_2_roll_value
    end

    total_roll_value
  end
end

class Die
  def initialize
    @die = [*1..6]
  end

  def roll
    @die.sample
  end
end

User.new.play
