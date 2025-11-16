SMODS.Joker{ --Theorem
    key = "theorem",
    config = {
        extra = {
            FLAGREPLACE = 0
        }
    },
    loc_txt = {
        ['name'] = 'Theorem',
        ['text'] = {
            [1] = 'If scored hand includes a {C:attention}Mult{} {C:enhanced}Enhancement{}',
            [2] = 'and a {C:attention}Bonus{} {C:enhanced}Enhancement{}, turn',
            [3] = 'all scored hands into {C:attention}Lucky{} Cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_mult"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_mult\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_bonus"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_bonus\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["m_lucky"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if SMODS.get_enhancements(playing_card)["m_mult"] == true then
                        count = count + 1
                    end
                end
                return count >= 1
                end)() and (function()
                    local count = 0
                    for _, playing_card in pairs(context.scoring_hand or {}) do
                        if SMODS.get_enhancements(playing_card)["m_bonus"] == true then
                            count = count + 1
                        end
                    end
                    return count >= 1
                    end)()) then
                        return {
                            func = function()
                                card.ability.extra.FLAGREPLACE = 1
                                return true
                                end,
                                message = "Yes!"
                            }
                        end
                    end
                    if context.individual and context.cardarea == G.play  and not context.blueprint then
                        if (card.ability.extra.FLAGREPLACE or 0) == 1 then
                            context.other_card:set_ability(G.P_CENTERS.m_lucky)
                            return {
                                message = "Card Modified!"
                                }
                            end
                        end
                        if context.after and context.cardarea == G.jokers  and not context.blueprint then
                            return {
                                func = function()
                                    card.ability.extra.FLAGREPLACE = 0
                                    return true
                                    end
                                }
                            end
                        end
}