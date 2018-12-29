# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  module Extra
    class UnionFind
      def initialize(set)
        @parent = set.map { |x| [x, x] }.to_h
        @rank = set.map { |x| [x, 0] }.to_h
      end

      def union(x, y)
        parent_x = find(x)
        parent_y = find(y)

        return if parent_x == parent_y

        if @rank[parent_x] < @rank[parent_y]
          @parent[parent_x] = parent_y
        elsif @rank[parent_x] > @rank[parent_y]
          @parent[parent_y] = parent_x
        else
          @parent[parent_y] = parent_x
          @rank[parent_x] += 1
        end
      end

      def find(x)
        @parent[x] = find(@parent[x]) if @parent[x] != x
        @parent[x]
      end

      def disjoint_sets
        @parent.count { |k, v| k == v }
      end
    end
  end
end
