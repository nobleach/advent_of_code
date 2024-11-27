use day04::*;

fn main() {
    part01();
    part02();
}

fn part01() {
    println!(
        "{}",
        include_str!("./input.txt")
            .lines()
            .collect::<Vec<_>>()
            .into_iter()
            .map(|line| get_score(get_intersection_score(line)))
            .sum::<i32>(),
    );
}

fn part02() {
    let lines = include_str!("./input.txt")
        .lines()
        .collect::<Vec<_>>()
        .into_iter()
        .enumerate();

    let mut cards = vec![1usize; lines.len()];

    for (index, line) in lines {
        let match_length = get_intersection_score(line);

        if match_length > 0 {
            for j in 1..match_length + 1 {
                cards[index + j] += cards[index];
            }
        }
    }

    println!("{}", cards.iter().sum::<usize>());
}
