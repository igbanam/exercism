use enum_iterator::{all, cardinality, first, next, Sequence};

#[derive(Debug, PartialEq, Eq, Sequence)]
pub enum ResistorColor {
    Black = 0,
    Brown,
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
    Grey,
    White,
}

pub fn color_to_value(color: ResistorColor) -> u32 {
    return color as u32
}

pub fn value_to_color_string(value: u32) -> String {
    let mut i: u32 = 0;
    let mut result = first::<ResistorColor>();
    if value > cardinality::<ResistorColor>() as u32 {
        return String::from("value out of range")
    }
    while i != value {
        i += 1;
        result = next(&result.unwrap());
    }
    return format!("{:?}", result.unwrap())
}

pub fn colors() -> Vec<ResistorColor> {
    return all::<ResistorColor>().collect::<Vec<ResistorColor>>()
}
