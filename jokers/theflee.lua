SMODS.Joker{ --The Flee
    key = "theflee",
    config = {
        extra = {
            xhips = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Flee',
        ['text'] = {
            [1] = '{X:chips,C:white}x#1#{} Chips if played hand contains a {C:attention}Straight{}',
            [2] = 'Increase by {X:chips,C:white}x0.15{} if condition succeeds'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xhips}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if next(context.poker_hands["Straight"]) then
                return {
                    func = function()
                        card.ability.extra.xhips = (card.ability.extra.xhips) + 0.15
                        return true
                        end
                    }
                end
            end
            if context.cardarea == G.jokers and context.joker_main  then
                if next(context.poker_hands["Straight"]) then
                    return {
                        x_chips = card.ability.extra.xhips
                    }
                end
            end
        end
}