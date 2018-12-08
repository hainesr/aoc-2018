# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class SumOfItsParts < Day
    def run
      input = read_input_file.chomp.split("\n")

      puts "Part 1: #{order_steps(parse_steps(input))}"
      puts "Part 2: #{run_steps(parse_steps(input))}"
    end

    def order_steps(steps)
      result = ''

      until steps.empty?
        exe = steps.select { |_, v| v.empty? }.keys.min
        steps.delete(exe)
        steps.each { |_, v| v.delete(exe) }
        result += exe
      end

      result
    end

    def run_steps(steps, num_workers = 5, base_time = 60)
      time = 0

      # Each worker: [task, finish time for task].
      workers = Array.new(num_workers, nil)

      until steps.empty?
        # Clean up finished workers.
        workers.each_index do |id|
          next if workers[id].nil?

          if workers[id][1] == time
            steps.each { |_, v| v.delete(workers[id][0]) }
            workers[id] = nil
          end
        end

        # Set up new jobs.
        workers.each_index do |id|
          next unless workers[id].nil?

          exe = steps.select { |_, v| v.empty? }.keys.min
          break if exe.nil?

          steps.delete(exe)
          finish_time = time + exe.ord - 64 + base_time
          workers[id] = [exe, finish_time]
        end

        time += 1
      end

      # We've scheduled all the tasks, so when does the last task end?
      workers.reject(&:nil?).max_by { |w| w[1] }[1]
    end

    def parse_steps(steps)
      list = {}

      steps.each do |step|
        i = step[36]
        j = step[5] # j is a dependency of i...

        list[i] ||= []
        list[j] ||= [] # to catch the 'first' element...
        list[i] << j
      end

      list
    end
  end
end
