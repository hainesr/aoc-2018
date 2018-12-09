# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  module Extra
    class RingBufferNode
      attr_accessor :value, :prev, :next

      def initialize(value)
        @value = value
        @prev = self
        @next = self
      end

      def remove
        @prev.next = @next
        @next.prev = @prev
        @value
      end

      def insert(value)
        node = RingBufferNode.new(value)
        node.prev = self
        node.next = @next
        @next.prev = node
        @next = node
        node
      end
    end
  end
end
