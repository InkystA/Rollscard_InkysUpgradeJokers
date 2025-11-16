SMODS.Joker{ --Sketch
    key = "sketch",
    config = {
        extra = {
            Numerator = 1,
            Denominator = 6
        }
    },
    loc_txt = {
        ['name'] = 'Sketch',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to copy the {C:attention}1st{}',
            [2] = 'and the {C:attention}5th{} joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Numerator, card.ability.extra.Denominator}}
    end
}