SMODS.Joker{ --Wii
    key = "wii",
    config = {
        extra = {
            Money = 0
        }
    },
    loc_txt = {
        ['name'] = 'Wii',
        ['text'] = {
            [1] = 'This Joker gains {C:money}+$2{} when each played {C:attention}2{} is scored',
            [2] = '{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 0.7, 
        h = 95 * 0.7
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 6
    },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Money}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:get_id() == 2 then
                card.ability.extra.Money = (card.ability.extra.Money) + 2
                return {
                    message = "Wii!"
                }
            end
        end
    if context.end_of_round and context.game_over == false and context.main_eval  then
        return {
            dollars = card.ability.extra.Money
        }
    end
end
}