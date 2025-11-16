SMODS.Joker{ --The Spared
    key = "thespared",
    config = {
        extra = {
            Xmult = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'The Spared',
        ['text'] = {
            [1] = '{X:red,C:white}X2.5{} Mult if played hand contains a {C:attention}Two Pair{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Two Pair"]) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}