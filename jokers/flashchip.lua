SMODS.Joker{ --Flashchip
    key = "flashchip",
    config = {
        extra = {
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Flashchip',
        ['text'] = {
            [1] = 'Gain {C:blue}+4{} Chips for each {C:attention}Reroll{}, Resets after {C:attention}Boss Blind{} is defeated',
            [2] = '{C:inactive}(Currently {C:blue}+#1#{}{C:inactive} Chips){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "inkysupg_unusual",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips}}
    end,

    
    calculate = function(self, card, context)
        if context.reroll_shop  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + 4
                    return true
                    end,
                    message = "Increase!"
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips
                }
            end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.chips = 0
                    return true
                    end
                }
            end
        end
}