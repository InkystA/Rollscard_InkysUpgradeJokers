SMODS.Joker{ --Self Referencing Joker
    key = "srj",
    config = {
        extra = {
            mult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Self Referencing Joker',
        ['text'] = {
            [1] = '{C:green}When a Hand is Played{} >',
            [2] = '{C:attention}Add Mult = 4{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}