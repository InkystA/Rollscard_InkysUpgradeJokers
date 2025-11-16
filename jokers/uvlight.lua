SMODS.Joker{ --UV Light
    key = "uvlight",
    config = {
        extra = {
            mullet = 0
        }
    },
    loc_txt = {
        ['name'] = 'UV Light',
        ['text'] = {
            [1] = 'This joker gains {C:red}+4{} Mult for each',
            [2] = 'card sold this run.',
            [3] = 'Resets whenever a {C:attention}Three of a Kind{}',
            [4] = 'or a {C:attention}Full House{} is played',
            [5] = '{C:inactive}(Currently {C:red}+#1#{}{C:inactive} Mult){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mullet}}
    end,

    
    calculate = function(self, card, context)
        if context.selling_card  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.mullet = (card.ability.extra.mullet) + 10
                    return true
                    end
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mullet
                }
            end
            if context.before and context.cardarea == G.jokers  and not context.blueprint then
                if (next(context.poker_hands["Three of a Kind"]) and next(context.poker_hands["Full House"])) then
                    return {
                        func = function()
                            card.ability.extra.mullet = 0
                            return true
                            end,
                            message = "Reset!"
                        }
                    end
                end
            end
}