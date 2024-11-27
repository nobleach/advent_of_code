pub fn sum_game_ids_sum() -> i32 {}
pub fn get_legitimate_id_or_zero(line: &str) -> i32 {}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_returns_one_if_game_is_possible() {
        let input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green";
    }

    fn it_returns_zero_if_game_is_impossible() {
        let input = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red";
    }
}
