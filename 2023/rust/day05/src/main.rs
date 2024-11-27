use day05::*;

fn main() {
    part01();
}

fn part01() {
    let input = include_str!("./input.txt");

    println!("{}", get_lowest_location(input));
}
