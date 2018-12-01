# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

module AOC2018
  class Day

    def run; end

    private

    def read_input_file
      ::File.read(get_input_file)
    end

    def get_input_file
      file = "#{class_snake_case}.txt"
      ::File.join(INPUT_DIR, file)
    end

    def class_snake_case
      ::File.basename(self.method(:run).source_location[0]).split('.')[0]
    end
  end
end
