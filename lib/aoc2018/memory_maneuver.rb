# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class MemoryManeuver < Day
    def run
      input = read_input_file.split.map(&:to_i)
      tree = read_tree(input)

      puts "Part 1: #{sum_metadata(tree)}"
      puts "Part 2: #{value(tree)}"
    end

    def sum_metadata((children, metadata))
      sum = 0
      sum += metadata.reduce(&:+)
      children.each do |c|
        sum += sum_metadata(c)
      end

      sum
    end

    def value((children, metadata))
      return metadata.reduce(&:+) if children.empty?

      sum = 0
      metadata.each do |m|
        sum += value(children[m - 1]) if m >= 1 && m <= children.length
      end

      sum
    end

    def read_tree(input)
      _read_tree(input)[1..-1]
    end

    private

    def _read_tree(input, i = 0)
      children = []
      j = i

      nc, nm = input[i..i + 1]
      nc.times do |_|
        tree = _read_tree(input, j + 2)
        j = tree[0]
        children << tree[1..-1]
      end
      metadata = input[j + 2...j + 2 + nm]

      [j + nm, children, metadata]
    end
  end
end
