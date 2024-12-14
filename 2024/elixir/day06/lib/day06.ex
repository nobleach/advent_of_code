defmodule Day06 do
  def run do
    input = File.read!("./lib/input.txt")
    IO.inspect(part_one(input))
  end

  def part_one(input) do
    board =
      input
      |> parse_to_map

    distinct_positions = MapSet.new()
    walk(board, find_guard(board), :north, distinct_positions)
  end

  def look_ahead(board, position) do
    case Map.get(board, position) do
      # we've walked off the board  
      nil -> :out_of_bounds
      "^" -> :continue
      "." -> :continue
      "#" -> :blocked
    end
  end

  def walk(board, position, heading, positions) do
    case Map.get(board, position) do
      # we've walked off the board  
      nil ->
        MapSet.size(positions)

      "^" ->
        case look_ahead(board, coords_for_heading(heading, position)) do
          :continue ->
            walk(
              board,
              coords_for_heading(heading, position),
              heading,
              MapSet.put(positions, position)
            )

          :blocked ->
            walk(
              board,
              coords_for_heading(turn_right(heading), position),
              turn_right(heading),
              MapSet.put(positions, position)
            )
        end

      "." ->
        case look_ahead(board, coords_for_heading(heading, position)) do
          :continue ->
            walk(
              board,
              coords_for_heading(heading, position),
              heading,
              MapSet.put(positions, position)
            )

          :blocked ->
            walk(
              board,
              coords_for_heading(turn_right(heading), position),
              turn_right(heading),
              MapSet.put(positions, position)
            )

          :out_of_bounds ->
            positions = MapSet.put(positions, position)
            MapSet.size(positions)
        end
    end
  end

  @spec turn_right(atom) :: atom
  def turn_right(curr_direction) do
    case curr_direction do
      :north -> :east
      :east -> :south
      :south -> :west
      :west -> :north
    end
  end

  @spec parse_to_map(String.t()) :: %{{integer, integer} => String.t()}
  def parse_to_map(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {row_val, row_idx}, board ->
      row_val
      |> String.split("", trim: true)
      |> Enum.with_index()
      |> Enum.reduce(board, fn {col_val, col_idx}, board ->
        Map.put(board, {col_idx, row_idx}, col_val)
      end)
    end)
  end

  def coords_for_heading(:north, {x, y}), do: {x, y - 1}
  def coords_for_heading(:south, {x, y}), do: {x, y + 1}
  def coords_for_heading(:east, {x, y}), do: {x + 1, y}
  def coords_for_heading(:west, {x, y}), do: {x - 1, y}

  defp find_guard(board) do
    Enum.find(board, fn {_coord, key} -> key == "^" end)
    |> elem(0)
  end
end
