# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'
require 'aoc2018/chronal_classification'

module AOC2018
  class GoWithTheFlow < ChronalClassification
    def run
      input = read_input_file.chomp.split("\n")

      # registers = run_program(input)

      # Inputs to sim_program are obtained by peeking at register[2] when
      # the instruction pointer is 2 for the first time.
      puts "Part 1: #{sim_program(905)}"
      puts "Part 2: #{sim_program(10551305)}"
    end

    # The input program seems to add up the divisors of a number, n.
    def sim_program(n)
      (1..n).reduce(0) do |acc, i|
        acc = (n % i == 0) ? acc + i : acc
      end
    end

    def run_program(input)
      registers = [0, 0, 0, 0, 0, 0]
      ip_reg = input[0].scan(/\d/).first.to_i
      ip = 0
      last_i = input.length - 1

      loop do
        line = input[ip + 1].split
        op = line[0].to_sym
        a, b, c = line[1..-1].map(&:to_i)

        registers[ip_reg] = ip
        INSTRUCTIONS[op][registers, a, b, c]
        ip = registers[ip_reg]
        ip += 1
        break if ip < 0 || ip >= last_i
      end

      registers
    end
  end
end
