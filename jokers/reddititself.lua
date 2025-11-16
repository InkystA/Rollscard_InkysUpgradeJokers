SMODS.Joker{ --Reddit Itself
    key = "reddititself",
    config = {
        extra = {
            Balance = 0
        }
    },
    loc_txt = {
        ['name'] = 'Reddit Itself',
        ['text'] = {
            [1] = 'If boss blind has {C:attention}not{} been activated,',
            [2] = '{C:purple}Balance{} {C:blue}Chips{} and {C:red}Mult{}',
            [3] = '{C:inactive,s:0.9}(Only works on Boss Blinds){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = "inkysupg_infrequent",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if G.GAME.blind.triggered then
                card.ability.extra.Balance = 1
            elseif (G.GAME.blind.boss and (card.ability.extra.Balance or 0) == 0) then
                return {
                    balance = true
                }
            end
        end
    if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
        return {
            func = function()
                card.ability.extra.Balance = 0
                return true
                end
            }
        end
    end
}