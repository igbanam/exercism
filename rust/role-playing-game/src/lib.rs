pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health > 0 {
            return None
        } else {
            if self.mana.is_none() {
                return Some(Player { health: 100, mana: None, level: self.level })
            } else {
                return Some(Player { health: 100, mana: Some(100), level: self.level })
            }
        }
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        if self.mana.is_none() {
            if self.health < mana_cost {
                self.health = 0;
            } else {
                self.health -= mana_cost;
            }
            return 0
        } else if self.mana.unwrap() < mana_cost {
            return 0
        } else {
            self.mana = Some(self.mana.unwrap() - mana_cost);
            return mana_cost * 2
        }
    }
}
