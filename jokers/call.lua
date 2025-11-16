SMODS.Joker{ --Call
    key = "call",
    config = {
        extra = {
            currentscoringchips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Call',
        ['text'] = {
            [1] = 'This joker gives equal {C:blue}Chips{}',
            [2] = 'to the amount of {C:attention}scored{} card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
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
            return {
                chips = hand_chips
            }
        end
    end
}