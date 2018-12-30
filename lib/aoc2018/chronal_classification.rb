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
      part1, op_map = map_instructions(input)

      puts "Part 1: #{part1}"

      registers = run_program(input, op_map)
      puts "Part 2: #{registers.first}"
    end

    def run_program(input, op_map)
      registers = [0, 0, 0, 0]
      first_line = input.rindex { |line| line.start_with?('After: ') } + 4

      input[first_line..-1].each do |line|
        op, a, b, c = line.split.map(&:to_i)

        INSTRUCTIONS[op_map[op]][registers, a, b, c]
      end

      registers
    end

    def map_instructions(input, map = true)
      last_line = input.rindex { |line| line.start_with?('After: ') }
      possible_map = (0..15).each_with_object({}) do |num, hash|
        hash[num] = INSTRUCTIONS.keys
      end

      part1 = input[0..last_line].each_slice(4).count do |before, op, after, _|
        before = before.scan(/\d+/).map(&:to_i)
        op, a, b, c = op.split.map(&:to_i)
        after = after.scan(/\d+/).map(&:to_i)

        match = INSTRUCTIONS.select do |_, v|
          regs = before.dup
          v[regs, a, b, c]
          regs == after
        end

        # Cut down the possibilities for each op.
        possible_map[op] &= match.keys

        # '.count' above will count the number of loops that return 'true'.
        match.size >= 3
      end

      return part1 unless map

      op_map = {}
      until op_map.length == 16
        possible_map.select { |_, codes| codes.length == 1 }.each do |num, code|
          op_map[num] = code[0]

          possible_map.each do |_, v|
            op_map.values.each { |o| v.delete(o) }
          end
        end
      end

      [part1, op_map]
    end
  end
end
