# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'
require 'set'

module AOC2018
  class ChronalCoordinates < Day
    def run
      input = read_input_file.split("\n").map { |l| l.split(',').map(&:to_i) }

      puts "Part 1: #{max_finite_area(input)}"
      puts "Part 2: #{region_within_sum(input, 10_000)}"
    end

    def max_finite_area(points)
      max_x = points.max_by { |p| p[0] }[0]
      max_y = points.max_by { |p| p[1] }[1]

      distances = []
      infinites = Set.new

      (0..max_y).each do |y|
        distances[y] = []

        (0..max_x).each do |x|
          c = closest(points, x, y)
          distances[y][x] = c

          # If we are on an edge, then that ID represents an infinite area.
          infinites.add(c) if x.zero? || x == max_x || y.zero? || y == max_y
        end
      end

      # Count each area by grouping the IDs and removing those that are infinte.
      distances.flatten.group_by(&:itself).reject do |k, _|
        infinites.include?(k)
      end.transform_values(&:count).values.max
    end

    def region_within_sum(points, sum)
      max_x = points.max_by { |p| p[0] }[0]
      max_y = points.max_by { |p| p[1] }[1]

      region_size = 0

      (0..max_y).each do |y|
        (0..max_x).each do |x|
          region_size += 1 if closest_within_sum?(points, x, y, sum)
        end
      end

      region_size
    end

    def manhattan(p1, p2)
      (p1[0] - p2[0]).abs + (p1[1] - p2[1]).abs
    end

    def closest(points, x, y)
      # Find all the IDs that are closest to a point.
      all_closest = points.each_with_index.map do |point, index|
        [index, manhattan([x, y], point)]
      end.sort_by { |_, dist| dist }.first(2)

      # If we have at least two closest then we set to nil.
      all_closest[0][1] == all_closest[1][1] ? nil : all_closest[0][0]
    end

    def closest_within_sum?(points, x, y, sum)
      points.reduce(0) { |s, p| s + manhattan(p, [x, y]) } < sum
    end
  end
end
