use regex::Regex;

pub fn get_legitimate_id_or_zero(line: &str) -> i32 {
    let red_max = 12;
    let green_max = 13;
    let blue_max = 14;

    let re = Regex::new(r"(?P<count>\d+)\s(?P<color>\w+)").unwrap();

    let mut split = line.split(':');
    let head = split.nth(0).unwrap();
    let tail = split.nth(0).unwrap();
    let turns: Vec<&str> = tail.split(';').collect();
    let num_color_pairs = turns
        .iter()
        .map(|&x| x.trim().split(' '))
        .collect::<Vec<_>>();
    eprintln!(
        "DEBUGPRINT[3]: lib.rs:14: num_color_pairs={:#?}",
        num_color_pairs
    );

    let game_id = parse_game_id(head);

    let game_caps = re.captures(tail).expect("nothing here man");
    println!("Caps: {}", &game_caps["color"]);
    3
}

pub fn parse_game_id(line: &str) -> isize {
    let re = Regex::new(r"^Game\s(?P<id>\d+)$").unwrap();
    let cap = re.captures(line).expect("nothing here man");
    let id = cap
        .name("id")
        .map(|id| id.as_str())
        .unwrap()
        .parse::<isize>()
        .expect("failed to parse int");

    id
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_returns_a_game_id_from_a_line() {
        let input = "Game 1";

        assert_eq!(parse_game_id(input), 1);
    }

    #[test]
    fn it_returns_one_if_game_is_possible() {
        let input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green";

        assert_eq!(get_legitimate_id_or_zero(input), 1);
    }

    #[test]
    fn it_returns_zero_if_game_is_impossible() {
        let input = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red";

        assert_eq!(get_legitimate_id_or_zero(input), 0);
    }
}
