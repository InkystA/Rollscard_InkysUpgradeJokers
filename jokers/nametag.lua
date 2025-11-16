SMODS.Joker{ --Name Tag
    key = "nametag",
    config = {
        extra = {
            mult = 5,
            chips = 10,
            yes = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Name Tag',
        ['text'] = {
            [1] = 'Every Joker gives {C:red}+#1#{} Mult and {C:blue}+#2#{} Chips',
            [2] = 'If \"{C:attention}Joker{}\" is present, destroy it and increment values by {C:red}+1{} and {C:blue}+2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
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
        
        local info_queue_0 = G.P_CENTERS["j_joker"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_joker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.mult, card.ability.extra.chips}}
    end,

    
    calculate = function(self, card, context)
        if context.other_joker  then
            return {
                mult = card.ability.extra.mult,
                extra = {
                chips = card.ability.extra.chips,
                colour = G.C.CHIPS
            }
        }
    end
    if context.setting_blind  then
        if (function()
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.key == "j_joker" then
                    return true
                    end
                end
                return false
                end)() then
                    return {
                        func = function()
                            local target_joker = nil
                            for i, joker in ipairs(G.jokers.cards) do
                                if joker.config.center.key == "j_joker" and not joker.getting_sliced then
                                    target_joker = joker
                                    break
                                end
                            end
                            
                            if target_joker then
                                if target_joker.ability.eternal then
                                    target_joker.ability.eternal = nil
                                end
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            return true
                            end,
                            extra = {
                            func = function()
                                card.ability.extra.mult = (card.ability.extra.mult) + 1
                                return true
                                end,
                                colour = G.C.GREEN,
                                extra = {
                                func = function()
                                    card.ability.extra.chips = (card.ability.extra.chips) + 2
                                    return true
                                    end,
                                    colour = G.C.GREEN
                                }
                            }
                        }
                    end
                end
            end
}