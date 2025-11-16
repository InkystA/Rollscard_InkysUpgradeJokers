SMODS.Joker{ --Self Referencing Message
    key = "srm",
    config = {
        extra = {
            Xmult = 1.8
        }
    },
    loc_txt = {
        ['name'] = 'Self Referencing Message',
        ['text'] = {
            [1] = '{C:green}When a Card is Scored{} >',
            [2] = '{C:inactive}(Condition Group 1) {}{C:blue}Specific Joker, j_inkysupg_srj{} >',
            [3] = '{C:attention}Apply xMult = 1.8{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_inkysupg_srj" then
                        return true
                        end
                    end
                    return false
                    end)() then
                        return {
                            Xmult = card.ability.extra.Xmult
                        }
                    end
                end
            end
}