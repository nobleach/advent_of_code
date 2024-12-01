package main

import (
	"fmt"
	"os"
	"sort"
	"strconv"
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

type Columns struct {
	Left  []int
	Right []int
}

func (c *Columns) SortColumns() {
	sort.Ints(c.Left)
	sort.Ints(c.Right)
}

func (c *Columns) ParseToColumns(input string) {
	lines := strings.Split(input, "\n")

	for _, v := range lines {
		if v == "" {
			continue
		}

		splits := strings.Split(v, "   ")

		l, err := strconv.Atoi(splits[0])
		if err != nil {
			panic(err)
		}

		r, err := strconv.Atoi(splits[1])
		if err != nil {
			panic(err)
		}

		c.Left = append(c.Left, l)
		c.Right = append(c.Right, r)
	}
}

func Part1(input string) int {
	sum := 0

	columns := Columns{}

	columns.ParseToColumns(input)
	columns.SortColumns()

	for i, v := range columns.Left {
		rightColumn := columns.Right[i]

		res := v - rightColumn

		if res < 0 {
			res = -res
		}

		sum += res
	}

	return sum
}
