use day03::*;

fn main() {
    println!(
        "{}",
        include_str!("./input.txt")
            .lines()
            .collect::<Vec<_>>()
            .into_iter()
            .map(|line| get_legitimate_id_or_zero(line))
            .sum::<i32>(),
    );
}
