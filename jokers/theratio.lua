SMODS.Joker{ --The Ratio
    key = "theratio",
    config = {
        extra = {
            Xmult = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'The Ratio',
        ['text'] = {
            [1] = '{X:red,C:white}X1.3{} Mult for each scoring {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{} and {C:attention}8{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 8 or context.other_card:get_id() == 5 or context.other_card:get_id() == 3 or context.other_card:get_id() == 2) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}