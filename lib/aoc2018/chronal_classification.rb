# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class ChronalClassification < Day
    INSTRUCTIONS = {
      addr: ->(regs, a, b, c) { regs[c] = regs[a] + regs[b] },
      addi: ->(regs, a, b, c) { regs[c] = regs[a] + b },
      mulr: ->(regs, a, b, c) { regs[c] = regs[a] * regs[b] },
      muli: ->(regs, a, b, c) { regs[c] = regs[a] * b },
      banr: ->(regs, a, b, c) { regs[c] = regs[a] & regs[b] },
      bani: ->(regs, a, b, c) { regs[c] = regs[a] & b },
      borr: ->(regs, a, b, c) { regs[c] = regs[a] | regs[b] },
      bori: ->(regs, a, b, c) { regs[c] = regs[a] | b },
      setr: ->(regs, a, _, c) { regs[c] = regs[a] },
      seti: ->(regs, a, _, c) { regs[c] = a },
      gtir: ->(regs, a, b, c) { regs[c] = a > regs[b] ? 1 : 0 },
      gtri: ->(regs, a, b, c) { regs[c] = regs[a] > b ? 1 : 0 },
      gtrr: ->(regs, a, b, c) { regs[c] = regs[a] > regs[b] ? 1 : 0 },
      eqir: ->(regs, a, b, c) { regs[c] = a == regs[b] ? 1 : 0 },
      eqri: ->(regs, a, b, c) { regs[c] = regs[a] == b ? 1 : 0 },
      eqrr: ->(regs, a, b, c) { regs[c] = regs[a] == regs[b] ? 1 : 0 }
    }.freeze

    def run
      input = read_input_file.chomp.split("\n")

      puts "Part 1: #{count_instructions(input)}"
    end

    def count_instructions(input)
      last_test_line = input.rindex { |line| line.start_with?('After: ') }

      input[0..last_test_line].each_slice(4).count do |before, op, after, _|
        before = before.scan(/\d+/).map(&:to_i)
        op, a, b, c = op.split.map(&:to_i)
        after = after.scan(/\d+/).map(&:to_i)

        match = INSTRUCTIONS.select do |_, v|
          regs = before.dup
          v[regs, a, b, c]
          regs == after
        end

        # '.count' above will count the number of loops that return 'true'.
        match.size >= 3
      end
    end
  end
end
