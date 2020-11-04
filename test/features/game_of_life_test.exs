defmodule Features.GameOfLifeTest do
  use ExUnit.Case

  describe "Any live cell with fewer than two live neighbors" do
    test "dies, as if by underpopulation." do
      #   0 1 2
      # 0 D D D
      # 1 D A D
      # 2 D D D
      current_generation = GameOfLife.new([{1, 1}])

      next_generation = GameOfLife.next_generation(current_generation)

      refute GameOfLife.alive?(next_generation, {1, 1})
    end
  end

  @tag :skip
  describe "Any live cell with two or three live neighbors" do
    test "lives on to the next generation" do
      #   0 1 2
      # 0 D A D
      # 1 D A D
      # 2 D A D
      current_generation = GameOfLife.new([{1, 0}, {1, 1}, {1, 2}])

      next_generation = GameOfLife.next_generation(current_generation)

      assert GameOfLife.alive?(next_generation, {1, 1})
    end
  end

  @tag :skip
  describe "Any live cell with more than three live neighbors" do
    test "dies, as if by overpopulation." do
      #   0 1 2
      # 0 D A D
      # 1 A A A
      # 2 D A D
      current_generation = GameOfLife.new([{1, 0}, {0, 1}, {1, 1}, {2, 1}, {1, 2}])

      next_generation = GameOfLife.next_generation(current_generation)

      refute GameOfLife.alive?(next_generation, {1, 1})
    end
  end

  @tag :skip
  describe "Any dead cell with exactly three live neighbors" do
    test "becomes a live cell, as if by reproduction." do
      #   0 1 2
      # 0 A A A
      # 1 D D D
      # 2 D D D
      current_generation = GameOfLife.new([{0, 0}, {1, 0}, {2, 0}])

      next_generation = GameOfLife.next_generation(current_generation)

      assert GameOfLife.alive?(next_generation, {1, 1})
    end
  end
end
