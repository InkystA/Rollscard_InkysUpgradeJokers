SMODS.Joker{ --What? THE 50/50!!
    key = "whatthe5050",
    config = {
        extra = {
            set_probability = 2,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = 'What? THE 50/50!!',
        ['text'] = {
            [1] = 'All possible {C:green}Denominators{} will be set',
            [2] = 'to {C:green}2{}',
            [3] = '{C:inactive}({C:green}1 in 6{} {C:inactive}becomes{} {C:green}1 in 2{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.fix_probability and not context.blueprint then
            local numerator, denominator = context.numerator, context.denominator
            denominator = card.ability.extra.set_probability
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}