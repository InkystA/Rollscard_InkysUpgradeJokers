SMODS.Joker{ --Jokeezer
    key = "jokeezer",
    config = {
        extra = {
            cardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jokeezer',
        ['text'] = {
            [1] = '{C:mult}+0.25{} Mult for each remaining card in {C:attention}deck{}',
            [2] = '{C:inactive,s:0.8}(Currently {C:mult,s:0.8}+#1#{} {C:inactive,s:0.8}Mult){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 3
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
    soul_pos = {
        x = 2,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {((#(G.deck and G.deck.cards or {}) or 0)) * 0.25}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = (#(G.deck and G.deck.cards or {})) * 0.25,
                message = "1994!"
            }
        end
    end
}