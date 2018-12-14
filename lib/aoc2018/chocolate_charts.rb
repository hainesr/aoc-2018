# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class ChocolateCharts < Day
    def run
      puts "Part 1: #{practice_scores(635041)}"
    end

    def practice_scores(num, initial = [3, 7])
      scores = initial.dup
      elf1 = 0
      elf2 = 1

      loop do
        elf1_s = scores[elf1]
        elf2_s = scores[elf2]
        total_s = elf1_s + elf2_s

        if total_s > 9
          scores << 1 << (total_s - 10)
        else
          scores << total_s
        end

        len_s = scores.length
        break if len_s >= num + 10

        elf1 = (elf1 + elf1_s + 1) % len_s
        elf2 = (elf2 + elf2_s + 1) % len_s
      end

      scores[num, 10].map(&:to_s).join
    end
  end
end
