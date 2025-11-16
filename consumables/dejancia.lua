SMODS.Consumable {
    key = 'dejancia',
    set = 'Spectral',
    pos = { x = 6, y = 0 },
    loc_txt = {
        name = 'Dejancia',
        text = {
        [1] = 'Select 1 Card to apply a {C:attention}Red{} Seal*',
        [2] = '{C:enhanced,s:0.6}(*Enhancement){}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    can_use = function(self, card)
        return true
    end
}