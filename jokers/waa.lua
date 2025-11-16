SMODS.Joker{ --Waa
    key = "waa",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Waa',
        ['text'] = {
            [1] = 'This joker will {C:attention}gain{} {X:red,C:white}X0.8{} Mult if played hand',
            [2] = 'has at least four {C:attention}2{}\'s in played hand',
            [3] = '{C:inactive,s:0.8}(Currently {X:red,C:white,s:0.8}#1#{} {C:inactive,s:0.8}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    display_size = {
        w = 71 * 1.25, 
        h = 95 * 1.25
    },
    cost = 8,
    rarity = "inkysupg_infrequent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if (function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 2 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 4
                end)() then
                    return {
                        func = function()
                            card.ability.extra.xmult = (card.ability.extra.xmult) + 0.8
                            return true
                            end
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    return {
                        Xmult = card.ability.extra.xmult
                    }
                end
            end
}