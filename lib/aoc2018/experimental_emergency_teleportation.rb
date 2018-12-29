# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'
require 'z3'

module AOC2018
  class ExperimentalEmergencyTeleportation < Day
    def run
      input = read_input_file.chomp.split("\n").map(&:chomp)
      bots = parse_input(input)

      puts "Part 1: #{in_range(bots)}"
      puts "Part 2: #{manhattan([0, 0, 0], most_in_range(bots))}"
    end

    def in_range(bots)
      str_pos, str = find_strongest(bots)
      bots.reduce(0) do |num, (pos, _)|
        manhattan(str_pos, pos) <= str ? num + 1 : num
      end
    end

    def most_in_range(bots)
      x = Z3.Int('x')
      y = Z3.Int('y')
      z = Z3.Int('z')
      point = [x, y, z]

      cost = x * 0
      bots.each do |pos, r|
        cost += Z3.IfThenElse(z3_manhattan(point, pos) <= r, 1, 0)
      end

      optimizer = Z3::Optimize.new

      # Maximise for the number of bots in range...
      optimizer.maximize(cost)

      # Then minimize the distance from the origin for the tie-breaker.
      optimizer.minimize(z3_manhattan([0, 0, 0], [x, y, z]))
      optimizer.check
      model = optimizer.model

      [model[x].to_i, model[y].to_i, model[z].to_i]
    end

    def parse_input(input)
      input.each_with_object({}) do |line, bots|
        l = line.scan(/-?\d+/).map(&:to_i)
        bots[l[0, 3]] = l[3]
      end
    end

    def find_strongest(bots)
      bots.max_by { |_, v| v }
    end

    def manhattan(p1, p2)
      (p1[0] - p2[0]).abs + (p1[1] - p2[1]).abs + (p1[2] - p2[2]).abs
    end

    private

    def z3_abs(x)
      Z3.IfThenElse(x >= 0, x, -x)
    end

    def z3_manhattan(p1, p2)
      z3_abs(p1[0] - p2[0]) + z3_abs(p1[1] - p2[1]) + z3_abs(p1[2] - p2[2])
    end
  end
end
