# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'
require 'set'

module AOC2018
  class AlchemicalReduction < Day
    def run
      input = read_input_file.chomp

      puts "Part 1: #{reduction_reaction(input).length}"
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
          i -= 1 if i > 0
        else
          i += 1
        end

        break if i > last_i || result.length == 0
      end

      result.join
    end
  end
end
