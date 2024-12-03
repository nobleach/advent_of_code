package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	data, err := os.ReadFile("./input.txt")
	if err != nil {
		panic(err)
	}

	input := string(data)
	fmt.Println("Day 01 Part 1: %i", Part1(input))
}

func ParseToSliceOfSlices(input string) [][]int {
	lines := strings.Split(input, "\n")

	for _, v := range lines {
		if v == "" {
			continue
		}

		splits := strings.Split(v, " ")
	}

}

func Part1(input string) int {
	return 0
}
