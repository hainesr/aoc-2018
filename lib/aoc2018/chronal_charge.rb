# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class ChronalCharge < Day
    def run
      grid = populate_grid(8141)

      region3 = find_largest_region(grid)
      puts "Part 1: #{region3[1][0]},#{region3[1][1]}"
    end

    def find_largest_region(grid, width = 3)
      last_i = 300 - (width - 1)
      max = [0, [0, 0]]

      (1..last_i).map do |y|
        (1..last_i).map do |x|
          p = grid[(y - 1)...(y - 1 + width)].map do |column|
            column[(x - 1)...(x - 1 + width)]
          end.flatten.sum

          max = [p, [x, y]] if p > max[0]
        end
      end

      max
    end

    def cell_power_level(x, y, serial)
      rack_id = x + 10
      temp = ((rack_id * y) + serial) * rack_id
      temp.to_s.chars[-3].to_i - 5
    end

    def populate_grid(serial)
      (1..300).map do |y|
        (1..300).map { |x| cell_power_level(x, y, serial) }
      end
    end
  end
end
