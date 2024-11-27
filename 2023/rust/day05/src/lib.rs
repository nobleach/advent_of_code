use itertools::Itertools;

pub fn get_lowest_location(input: &str) -> u64 {
    //split lines on double space to tuple?
    let (seeds_str, blocks_str) = input.split_once("\n\n").unwrap();
    //pull first line
    //parse every digit to i32 after `seeds:`
    let seeds = seeds_str
        .split_once(":")
        .unwrap()
        .1
        .split_whitespace()
        .into_iter()
        .map(|s| s.parse::<u64>().unwrap())
        .collect::<Vec<_>>();

    // create result vec of u64
    let mut result: Vec<u64> = vec![];

    // pull every subsequent block

    let blocks = blocks_str
        .split("\n\n")
        .into_iter()
        .map(|s| {
            return s
                .split_once("\n")
                .unwrap()
                .1
                .split("\n")
                .into_iter()
                .map(|vals| {
                    let digits = vals
                        .split_ascii_whitespace()
                        .into_iter()
                        .map(|c| c.parse::<u64>().unwrap())
                        .collect::<Vec<u64>>();
                    if digits.len() > 0 {
                        return (digits[0], digits[1], digits[2]);
                    }

                    return (0, 0, 0);
                })
                .collect::<Vec<_>>();
        })
        .collect::<Vec<_>>();

    // loop over seeds
    for seed in seeds {
        let mut temp: u64 = seed;
        println!("-------------------------------------");
        println!("Starting value: {}", seed);
        for block in &blocks {
            for ranges in block {
                let (destination_start, source_range_start, range_length) = ranges;
                println!(
                    "Range is between {} and {}",
                    *source_range_start,
                    (source_range_start + range_length)
                );
                if temp >= *source_range_start && temp < (source_range_start + range_length) {
                    println!(
                        "Seed value was matched. Subtracting {} and Adding {}",
                        source_range_start, destination_start
                    );
                    let new_value = temp - source_range_start + destination_start;
                    println!("New value: {}", new_value);
                    temp = temp - source_range_start + destination_start;
                    break;
                } else {
                    println!("Seed value {} was NOT matched", temp);
                }
            }
        }
        result.push(temp);
        println!("result contains: {:?}", result);
    }

    *result.iter().min().unwrap()
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Interval {
    pub beg: isize,
    pub end: isize,
}

impl Interval {
    pub fn beg(self) -> isize {
        self.beg
    }
    pub fn end(self) -> isize {
        self.end
    }

    /// Create an interval from a starting point, and a length.
    pub fn from_len(beg: isize, l: isize) -> Interval {
        Interval {
            beg,
            end: beg + l - 1,
        }
    }

    /// Intersect two intervals.
    pub fn intersect(self, i2: &Interval) -> Option<Interval> {
        let beg = self.beg.max(i2.beg);
        let end = self.end.min(i2.end);
        (beg <= end).then_some(Interval { beg, end })
    }

    /// Return self without the interval i2.
    pub fn without(self, i2: &Interval) -> Option<Interval> {
        match self.intersect(i2) {
            None => Some(self), // Disjoint, so return self.
            Some(_) => {
                let (beg, end) = if self.beg < i2.beg {
                    (self.beg, (i2.beg - 1).min(self.end))
                } else {
                    (self.beg.max(i2.end + 1), self.end)
                };
                // Smother nonsensical intervals.
                (end >= beg).then_some(Interval { beg, end })
            }
        }
    }
}

type AlmanacMap = (isize, isize, isize);

pub fn solve_both() -> (isize, isize) {
    let inp = std::fs::read_to_string("../inputs/day05.txt").unwrap();
    let inp: Vec<Vec<_>> = inp.split("\n\n").map(|s| s.lines().collect()).collect();
    let (seeds, almanac_maps): (Vec<isize>, Vec<Vec<AlmanacMap>>) = (
        p_seeds(inp[0][0]),
        inp.iter().dropping(1).map(|m| p_maps(m)).collect(),
    );

    (
        solve(
            seeds.iter().map(|&s| Interval::from_len(s, 1)).collect(),
            &almanac_maps,
        ),
        solve(
            seeds
                .chunks(2)
                .map(|ch| Interval::from_len(ch[0], ch[1]))
                .collect(),
            &almanac_maps,
        ),
    )
}

fn solve(seedvals: Vec<Interval>, almanac_maps: &[Vec<AlmanacMap>]) -> isize {
    almanac_maps
        .iter()
        .fold(seedvals, |seeds, maps| {
            seeds
                .into_iter()
                .flat_map(|x| calc_intersections(x, maps))
                .collect()
        })
        .into_iter()
        .map(Interval::beg)
        .min()
        .unwrap()
}

fn calc_intersections(ival: Interval, maps: &[AlmanacMap]) -> Vec<Interval> {
    let mut res = vec![];
    let mut source_ival = Some(ival);
    for &(dest, source, len) in maps {
        match source_ival {
            None => return res,
            Some(iv) => {
                let ival2 = Interval::from_len(source, len);
                if let Some(Interval { beg, end }) = iv.intersect(&ival2) {
                    res.push(Interval::from_len(beg + (dest - source), 1 + end - beg));
                    source_ival = iv.without(&ival2);
                }
            }
        }
    }
    // If there is some interval left, verbatim copy it.
    source_ival.into_iter().for_each(|iv| res.push(iv));
    res
}

///////////////////////////////////////////////////////////////////////
// Parsing

fn p_seeds(seeds: &str) -> Vec<isize> {
    seeds.split(' ').flat_map(|w| w.parse::<isize>()).collect()
}

fn p_maps(maps: &[&str]) -> Vec<AlmanacMap> {
    maps.iter()
        .filter_map(|l| {
            let v: Vec<_> = l.split(' ').flat_map(|w| w.parse::<isize>()).collect();
            (!v.is_empty()).then(|| (v[0], v[1], v[2]))
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_gets_min_location_number() {
        let input = include_str!("./sample.txt");

        assert_eq!(get_lowest_location(input), 35);
    }
}
