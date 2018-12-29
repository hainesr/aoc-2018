# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'
require 'aoc2018/extra/union_find'

module AOC2018
  class FourDimensionalAdventure < Day
    def run
      input = read_input_file.chomp.split("\n")
      points = read_points(input)

      uf = Extra::UnionFind.new(points)

      points.combination(2) do |x, y|
        uf.union(x, y) if manhattan(x, y) <= 3
      end

      puts "Part 1: #{uf.disjoint_sets}"
    end

    def manhattan(p1, p2)
      p1.zip(p2).map { |x, y| x - y }.map(&:abs).sum
    end

    def read_points(input)
      input.map(&:chomp).map { |l| l.split(',').map(&:to_i) }
    end
  end
end
