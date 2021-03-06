# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class SliceIt < Day
    def run
      input = read_input_file.split("\n").map(&:chomp)
      fabric, overlap_count = overlap(input)

      puts "Part 1: #{overlap_count}"
      puts "Part 2: #{no_overlaps(input, fabric)}"
    end

    def overlap(input)
      fabric = []
      overlaps = 0

      input.each do |line|
        _, left, right, top, bottom = parse_claim(line)

        (left...right).each do |x|
          fabric[x] = [] if fabric[x].nil?

          (top...bottom).each do |y|
            if fabric[x][y] == 1
              overlaps += 1
              fabric[x][y] = 2
            elsif fabric[x][y].nil?
              fabric[x][y] = 1
            end
          end
        end
      end

      [fabric, overlaps]
    end

    def no_overlaps(input, fabric)
      input.each do |line|
        id, left, right, top, bottom = parse_claim(line)
        overlaps = false

        (left...right).each do |x|
          (top...bottom).each do |y|
            overlaps = true if fabric[x][y] != 1
          end
        end

        return id unless overlaps
      end
    end

    private

    def parse_claim(input)
      id, rest = input.split('@')
      corner, size = rest.split(':').map(&:strip)
      left, top = corner.split(',').map(&:to_i)
      width, height = size.split('x').map(&:to_i)

      [id[1..-1].to_i, left, left + width, top, top + height]
    end
  end
end
