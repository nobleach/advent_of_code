package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	file, err := os.ReadFile("./input/input.txt")
	if err != nil {
		panic(fmt.Sprintf("%s: error %s", file, err))
	}

	rows := strings.Split(strings.TrimSpace(string(file)), "\n")

	position := 50
	var countPartOne int
	var countPartTwo int

	for _, v := range rows {
		direction := string(v[0])
		steps, err := strconv.Atoi(v[1:])
		if err != nil {
			fmt.Println("Error:", err)
			return
		}

		if direction == "R" {
			countPartTwo += (position + steps) / 100
			position = (position + steps) % 100
		}

		if direction == "L" {
			if position == 0 {
				countPartTwo += steps / 100
			} else if steps >= position {
				countPartTwo += 1 + (steps-position)/100
			}
			position = ((position-steps)%100 + 100) % 100
		}

		if position == 0 {
			countPartOne++
		}
	}

	log.Printf("Part 1: %d", countPartOne)
	log.Printf("Part 2: %d", countPartTwo)
}
