SMODS.Joker{ --All Hail the Joker
    key = "allhailthejoker",
    config = {
        extra = {
            Thief = 0
        }
    },
    loc_txt = {
        ['name'] = 'All Hail the Joker',
        ['text'] = {
            [1] = 'Gain {C:blue}+10{} Chips for each Destroyed Face Card',
            [2] = '{C:inactive,s:0.8}(Currently {C:blue,s:0.8}+#1#{} {C:inactive,s:0.8}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Thief}}
    end,

    
    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card:is_face() then
                        return true
                        end
                    end
                    return false
                    end)() then
                        return {
                            func = function()
                                card.ability.extra.Thief = (card.ability.extra.Thief) + 10
                                return true
                                end
                            }
                        end
                    end
                    if context.cardarea == G.jokers and context.joker_main  then
                        return {
                            chips = card.ability.extra.Thief
                        }
                    end
                end
}