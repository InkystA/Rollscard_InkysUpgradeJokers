SMODS.Joker{ --Champion of Jokes
    key = "championofjokes",
    config = {
        extra = {
            money = 2
        }
    },
    loc_txt = {
        ['name'] = 'Champion of Jokes',
        ['text'] = {
            [1] = 'If played hand is a single card, {C:money}+$#1#{}',
            [2] = 'Increase payout by {C:money}+$2{} when activated'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "inkysupg_infrequent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.money}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if #context.full_hand == 1 then
                local money_value = card.ability.extra.money
                card.ability.extra.money = (card.ability.extra.money) + 2
                return {
                    dollars = money_value
                }
            end
        end
    end
}