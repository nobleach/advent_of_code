package main

import (
	"testing"
)

func TestParseInputToNumber(t *testing.T) {
	input1 := "R42"
	input2 := "L7"
	input3 := "L42"

	got1 := ParseInputToNumber(input1)
	got2 := ParseInputToNumber(input2)
	got3 := ParseInputToNumber(input3)

	if got1 != 42 {
		t.Fatalf("Expected 42 but got %d", got1)
	}

	if got2 != -7 {
		t.Fatalf("Expected -7 but got %d", got2)
	}

	if got3 != -42 {
		t.Fatalf("Expected -42 but got %d", got3)
	}
}

func TestPart1(t *testing.T) {
	input := "L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82"

	expected := 3

	got := Part1(input)

	if got != expected {
		t.Fatalf("Expected %d but got %d", expected, got)
	}
}
