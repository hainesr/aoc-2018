# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class NorthPoleSettlers < Day
    def run
      input = read_input_file.chomp.split("\n")
      map = load_map(input)

      10.times { map = tick(map) }
      puts "Part 1: #{calculate_resources(map)}"

      # Part 2 solved by looking for repetition in the resources calculation,
      # then calculating the period of repetition - for my input: 28.
      #
      # 1_000_000_000 % 28 = 20
      # So any other iteration, i, modulo 28 that equals 20 should match.
      #
      # 1_000 % 28 = 20
      # At iteration 1000, the calculated resources value is: 191080

      # map = load_map(input)
      # find_pattern(map)
      puts 'Part 2: 191080'
    end

    def tick(map)
      width = map[0].length
      height = map.length
      new_map = blank_map(width, height)

      (1..(height - 2)).each do |y|
        (1..(width - 2)).each do |x|
          s = map[y - 1][(x - 1), 3]
          s << map[y][x - 1] << map[y][x + 1]
          s += map[y + 1][(x - 1), 3]

          if map[y][x] == '.'
            new_map[y][x] = s.count('|') >= 3 ? '|' : '.'
          elsif map[y][x] == '|'
            new_map[y][x] = s.count('#') >= 3 ? '#' : '|'
          elsif map[y][x] == '#'
            new_map[y][x] = s.count('|') >= 1 && s.count('#') >= 1 ? '#' : '.'
          end
        end
      end

      new_map
    end

    def find_pattern(map)
      (1..1000).each do |i|
        map = tick(map)

        puts "#{i}: #{calculate_resources(map)} - #{i} % 28 = #{i % 28}"
      end
    end

    def calculate_resources(map)
      m = map.flatten
      m.count('|') * m.count('#')
    end

    def load_map(input)
      map = input.map(&:chars).map { |l| ['.'] + l + ['.'] }

      dots = Array.new(map[0].length, '.')
      map.insert(0, dots)
      map.insert(-1, dots)

      map
    end

    def print_map(map)
      map.each { |l| puts l.join }
    end

    def blank_map(width, height)
      map = []
      height.times { map << Array.new(width, '.') }
      map
    end
  end
end
