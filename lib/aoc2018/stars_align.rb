# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class StarsAlign < Day
    def run
      input = read_input_file.chomp.split("\n")
      points = read_points(input)

      puts "Part 1:\n#{output(align(points))}"
    end

    def read_points(input)
      input.map { |line| line.scan(/-?\d+/).map(&:to_i) }
    end

    def align(points, height = 9)
      loop do
        points.map! do |x, y, dx, dy|
          [x + dx, y + dy, dx, dy]
        end

        min_y = points.min_by { |p| p[1] }[1]
        max_y = points.max_by { |p| p[1] }[1]

        return points if max_y - min_y == height
      end
    end

    def output(points)
      min_x = points.min_by { |p| p[0] }[0]
      max_x = points.max_by { |p| p[0] }[0]
      min_y = points.min_by { |p| p[1] }[1]
      max_y = points.max_by { |p| p[1] }[1]

      matrix = {}
      points.each { |x, y, dx, dy| matrix[[x, y]] = true }

      out = ''
      (min_y..max_y).each do |y|
        (min_x..max_x).each do |x|
          out += (matrix[[x, y]] ? '#' : ' ')
        end
        out += "\n"
      end

      out
    end
  end
end
