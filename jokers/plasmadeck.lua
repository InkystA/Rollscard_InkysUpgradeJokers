SMODS.Joker{ --Plasma Deck
    key = "plasmadeck",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Plasma Deck',
        ['text'] = {
            [1] = '{C:inactive,s:0.7}(...do i even need to tell you? sigh....){}',
            [2] = 'Balance {C:blue}Chips{} and {C:red}Mult{} when hand is played.',
            [3] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_Decks"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            return {
                balance = true
            }
        end
    end
}