use std::collections::HashSet;

pub fn get_intersection_score(str: &str) -> usize {
    let parts: Vec<&str> = str.split(":").collect();
    let _game_id = parts[0]
        .split_whitespace()
        .last()
        .expect("could not get last piece")
        .parse::<i32>()
        .unwrap();
    let scores: Vec<&str> = parts[1].split("|").map(|s| s.trim()).collect();
    let my_scores: HashSet<i32> = HashSet::from_iter(
        scores[0]
            .split_whitespace()
            .map(|s| s.parse::<i32>().unwrap()),
    );
    let winning_scores: HashSet<i32> = HashSet::from_iter(
        scores[1]
            .split_whitespace()
            .map(|s| s.parse::<i32>().unwrap()),
    );

    let intersection: Vec<_> = my_scores.intersection(&winning_scores).copied().collect();

    intersection.len().try_into().unwrap()
}

pub fn get_score(len: usize) -> i32 {
    match len {
        0 => 0,
        1 => 1,
        _ => 2_i32.pow((len - 1).try_into().unwrap()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_gets_the_score_for_intersections() {
        let input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53";

        assert_eq!(get_score(get_intersection_score(input)), 8);
    }
}
