package main

import (
	"slices"
	"testing"
)

func TestSortColumns(t *testing.T) {
	columns := Columns{
		Left:  []int{4, 2, 1, 3, 3},
		Right: []int{3, 5, 3, 9, 3},
	}

	columns.SortColumns()

	gotLeft := columns.Left
	expectedLeft := []int{1, 2, 3, 3, 4}

	if !slices.Equal(gotLeft, expectedLeft) {
		t.Fatalf("Expected %v but got %v", expectedLeft, gotLeft)
	}
}

func TestParseToColumns(t *testing.T) {
	input := `3   4
4   3
2   5
1   3
3   9
3   3`

	columns := Columns{}

	columns.ParseToColumns(input)

	gotLeft := columns.Left
	expectedLeft := []int{3, 4, 2, 1, 3, 3}

	if !slices.Equal(gotLeft, expectedLeft) {
		t.Fatalf("Expected %v but got %v", expectedLeft, gotLeft)
	}
}

func TestPart1(t *testing.T) {
	input := `3   4
4   3
2   5
1   3
3   9
3   3`
	got := Part1(input)
	if got != 11 {
		t.Fatalf("Expected 11, got %d", got)
	}
}
