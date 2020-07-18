defmodule Features.GameOfLifeTest do
  use ExUnit.Case

  describe "Any live cell with fewer than two live neighbors" do
    test "dies, as if by underpopulation." do
      current_generation = GameOfLife.new()

      next_generation = GameOfLife.next_generation(current_generation)

      expected_next_generation = nil
      assert GameOfLiife.equals?(next_generation, expected_next_generation)
    end
  end

  @tag :skip
  describe "Any live cell with two or three live neighbors" do
    test "lives on to the next generation" do
      current_generation = nil

      next_generation = GameOfLife.next_generation(current_generation)

      expected_next_generation = nil
      assert GameOfLiife.equals?(next_generation, expected_next_generation)
    end
  end

  @tag :skip
  describe "Any live cell with more than three live neighbors" do
    test "dies, as if by overpopulation." do
      current_generation = nil

      next_generation = GameOfLife.next_generation(current_generation)

      expected_next_generation = nil
      assert GameOfLiife.equals?(next_generation, expected_next_generation)
    end
  end

  @tag :skip
  describe "Any dead cell with exactly three live neighbors" do
    test "becomes a live cell, as if by reproduction." do
      current_generation = nil

      next_generation = GameOfLife.next_generation(current_generation)

      expected_next_generation = nil
      assert GameOfLiife.equals?(next_generation, expected_next_generation)
    end
  end
end
