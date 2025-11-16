SMODS.Joker{ --The Outliar
    key = "theoutliar",
    config = {
        extra = {
            Xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'The Outliar',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult if played hand is a {C:attention}High Card{} with',
            [2] = 'at least {C:attention}2{} unscored cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == "High Card" and (#context.full_hand - #context.scoring_hand) >= 2) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}