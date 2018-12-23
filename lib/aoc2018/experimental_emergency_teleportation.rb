# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class ExperimentalEmergencyTeleportation < Day
    def run
      input = read_input_file.chomp.split("\n").map(&:chomp)
      bots = parse_input(input)

      puts "Part 1: #{in_range(bots)}"
    end

    def in_range(bots)
      str_pos, str = find_strongest(bots)
      bots.reduce(0) do |num, (pos, _)|
        manhattan(str_pos, pos) <= str ? num + 1 : num
      end
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
  end
end
