// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let note_tally: HashMap<String, i32> = tally(note);
    let magazine_tally: HashMap<String, i32>  = tally(magazine);

    println!("{:#?}", magazine_tally);
    println!("{:#?}", note_tally);

    note_tally.into_iter().all(|e| {
        magazine_tally.keys().into_iter().any(|v| v == &e.0) &&
            magazine_tally.get(&e.0).unwrap_or(&0) >= &e.1
    })
}

fn tally(v: &[&str]) -> HashMap<String, i32> {
    let mut res: HashMap<String, i32> = HashMap::new();
    for &a in v {
        *res.entry(String::from(a)).or_insert(0) += 1
    }
    res
}
