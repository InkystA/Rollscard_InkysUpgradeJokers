SMODS.Joker{ --Factory Irregularity
    key = "factoryirregularity",
    config = {
        extra = {
            Xmult_min = 0.51,
            Xmult_max = 3.01
        }
    },
    loc_txt = {
        ['name'] = 'Factory Irregularity',
        ['text'] = {
            [1] = '{X:red,C:white}x0.5{} to {X:red,C:white}x3{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = pseudorandom('Xmult_6221be91', card.ability.extra.Xmult_min, card.ability.extra.Xmult_max)
            }
        end
    end
}