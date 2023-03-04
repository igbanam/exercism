pub fn production_rate_per_hour(speed: u8) -> f64 {
    let m = 221.0 * speed as f64;
    if speed <= 0 {
        return 0 as f64;
    } else if speed > 0 && speed < 5 {
        return m * 1.0;
    } else if speed >= 5 && speed < 9 {
        return m * 0.9;
    } else if speed == 9 || speed == 10 {
        return m * 0.77;
    } else {
        unimplemented!("Unknown Speed");
    }
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    let real = production_rate_per_hour(speed) / 60 as f64;
    return real.floor() as u32
}
