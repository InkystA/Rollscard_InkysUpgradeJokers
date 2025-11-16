SMODS.Joker{ --Kejor
    key = "kejor",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Kejor',
        ['text'] = {
            [1] = '{C:red}+1{} Mult for every card scored except for the first one',
            [2] = '{C:inactive}Literally just that.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (context.other_card == context.scoring_hand[1]) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}