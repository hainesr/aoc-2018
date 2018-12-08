# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class AlchemicalReduction < Day
    def run
      input = read_input_file.chomp
      reduced_polymer = reduction_reaction(input)

      # Optimization! Feed the answer to part 1 into part 2.
      puts "Part 1: #{reduced_polymer.length}"
      puts "Part 2: #{reduced_polymer_reaction(reduced_polymer)}"
    end

    def reduction_reaction(polymer)
      i = 0
      last_i = polymer.length - 2
      result = polymer.chars

      loop do
        unit = result[i..i + 1].sort
        break if unit.length == 1

        if /[[:upper:]]/.match(unit[0]) && unit[1] == unit[0].downcase
          result.delete_at(i)
          result.delete_at(i)
          i -= 1 if i.positive?
        else
          i += 1
        end

        break if i > last_i || result.empty?
      end

      result.join
    end

    def reduced_polymer_reaction(polymer)
      min = 1_000_000

      ('a'..'z').each do |char|
        next unless polymer.include?(char)

        chars = char + char.upcase
        length = reduction_reaction(polymer.delete(chars)).length
        min = length if length < min
      end

      min
    end
  end
end
