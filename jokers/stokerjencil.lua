SMODS.Joker{ --Stoker Jencil
    key = "stokerjencil",
    config = {
        extra = {
            jokercount = 1
        }
    },
    loc_txt = {
        ['name'] = 'Stoker Jencil',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult for each filled {C:attention}Joker{} slot.',
            [2] = 'Joker Stencil included',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 5
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.jokercount + (#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 0.5}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.jokercount + (#(G.jokers and G.jokers.cards or {})) * 0.5
            }
        end
    end
}