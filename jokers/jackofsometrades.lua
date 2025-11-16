SMODS.Joker{ --Jack of Some Trades
    key = "jackofsometrades",
    config = {
        extra = {
            chips = 10,
            mult = 6,
            Xmult = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Jack of Some Trades',
        ['text'] = {
            [1] = 'Each {C:attention}Jack{} held in hand gives {C:red}+6{} Mult,',
            [2] = '{C:blue}+10{} Chips, and {X:red,C:white}X1.25{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
    if context.individual and context.cardarea == G.hand and not context.end_of_round  then
        if context.other_card:get_id() == 11 then
            return {
                chips = card.ability.extra.chips,
                extra = {
                mult = card.ability.extra.mult,
                extra = {
                Xmult = card.ability.extra.Xmult
            }
        }
    }
end
end
end
}