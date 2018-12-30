# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class ModeMaze < Day
    def initialize(depth = 10_689, target = [11, 722])
      @depth = depth
      @target = target
      @e_index = {}

      @e_index[[0, 0]] = 0
      @e_index[[target[0], target[1]]] = 0
    end

    def run
      puts "Part 1: #{risk_level}"
    end

    def risk_level
      acc = 0

      (0..@target[0]).each do |x|
        (0..@target[1]).each { |y| acc += (erosion_index(x, y) % 3) }
      end

      acc
    end

    def erosion_index(x, y)
      return @e_index[[x, y]] unless @e_index[[x, y]].nil?

      g = if y.zero?
            x * 16_807
          elsif x.zero?
            y * 48_271
          else
            erosion_index(x - 1, y) * erosion_index(x, y - 1)
          end

      @e_index[[x, y]] = (g + @depth) % 20_183
    end
  end
end
