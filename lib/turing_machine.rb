# Joshua Antonishen
# 10/2/11

class TuringMachine
  attr_reader :transition_table

  def initialize(transition_table_file)
    @transition_table = load_transition_table(transition_table_file)
  end

  def load_transition_table(transition_table_file)
    tm = Hash.new(false)

    File.open(transition_table_file, "r") do |file|
      all_lines = file.read
      all_lines.split(/\n/).each do |line|
        state_name, final, *transitions = line.split(/,/).map { |item| item.to_sym }
        final = (final == :true) ? true : false

        tm[state_name] = Hash.new(false)
        tm[state_name][:final] = final

        transitions.each_slice(4) do |transition|
          tm[state_name][transition[1]] = { new_state: transition[0],
                                            output: transition[2],
                                            direction: transition[3] }
        end
      end
    end

    tm
  end

  def simulate(tape)
    current_state = :q0
    position = 0

    while(true)
      # infinite tape to left
      if (position == -1)
        position = 0
        tape = "/" << tape
      end

      # infinte tape to right
      tape[position] = "/" if (position == tape.length)

      transition = @transition_table[current_state][tape[position].to_sym]
      break unless transition

      move = 1 if transition[:direction] == :R
      move = -1 if transition[:direction] == :L

      tape[position] = transition[:output].to_s
      current_state = transition[:new_state]
      position += move

      return tape if @transition_table[current_state][:final]
    end

    false
  end

end
