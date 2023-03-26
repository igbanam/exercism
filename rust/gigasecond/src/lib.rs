use time::PrimitiveDateTime as DateTime;
use time::Duration;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    let gs = 1_000_000_000;
    return start.checked_add(gs * Duration::SECOND).unwrap()
}
