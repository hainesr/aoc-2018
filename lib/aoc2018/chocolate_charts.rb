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
      scores = practice_scores(16_000_000)

      puts "Part 1: #{next_ten(635_041, scores)}"
      puts "Part 2: #{find_sequence_index('635041', scores)}"
    end

    def practice_scores(num)
      scores = [3, 7]
      elf1 = 0
      elf2 = 1

      num.times do
        elf1_s = scores[elf1]
        elf2_s = scores[elf2]
        total_s = elf1_s + elf2_s

        if total_s > 9
          scores << 1 << (total_s - 10)
        else
          scores << total_s
        end

        len_s = scores.length
        elf1 = (elf1 + elf1_s + 1) % len_s
        elf2 = (elf2 + elf2_s + 1) % len_s
      end

      scores
    end

    def next_ten(num, scores)
      scores[num, 10].map(&:to_s).join
    end

    def find_sequence_index(seq, scores)
      scores.map(&:to_s).join.index(seq)
    end
  end
end
