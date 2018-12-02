# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class InventoryManagement < Day

    def run
      input = read_input_file.split.map(&:chomp)

      puts "Part 1: #{checksum(input)}"
    end

    def checksum(input)
      twos = 0
      threes = 0

      input.each do |line|
        counts = line.chars.group_by(&:itself).values.map(&:length).uniq

        twos += 1 if counts.include? 2
        threes += 1 if counts.include? 3
      end

      twos * threes
    end

  end
end
