# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'
require 'set'

module AOC2018
  class ChronalCalibration < Day

    def run
      input = read_input_file.split.map do |line|
        line.chomp.to_i
      end

      puts "Part 1: #{add_freqs(input)}"
      puts "Part 2: #{find_repeated_freq(input)}"
    end

    def add_freqs(input)
      input.reduce(:+)
    end

    def find_repeated_freq(input)
      acc = 0
      seen = Set[0]

      loop do
        input.each do |freq|
          acc += freq

          return acc if seen.add?(acc).nil?
        end
      end
    end

  end
end
