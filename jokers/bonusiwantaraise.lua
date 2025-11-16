SMODS.Joker{ --Bonus? I WANT A RAISE!
    key = "bonusiwantaraise",
    config = {
        extra = {
            bonuscardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bonus? I WANT A RAISE!',
        ['text'] = {
            [1] = 'All scored {C:attention}Bonus{} Cards give {C:blue}+10{} Chips',
            [2] = 'for every {C:attention}Bonus{} Card in deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_bonus"] == true then
                return {
                chips = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_bonus') then count = count + 1 end end; return count end)()) * 10
                }
            end
        end
    end
}