SMODS.Joker{ --Trading Enough Times
    key = "tradingenoughtimes",
    config = {
        extra = {
            sellage = 0,
            sell1 = 0,
            y = 0,
            sell2 = 0,
            n = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Trading Enough Times',
        ['text'] = {
            [1] = 'Sell this card {C:attention}3{} times to get a {C:red,E:0.4}Holographic{}',
            [2] = '{C:attention}Baseball Card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_holographic"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_holographic\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_baseball"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_baseball\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.selling_self  and not context.blueprint then
            if ((G.GAME.pool_flags.inkysupg_sell1 or false) and not ((G.GAME.pool_flags.inkysupg_sell2 or false))) then
                G.GAME.pool_flags.inkysupg_sell2 = true
                return {
                    message = "2/3"
                }
            elseif ((G.GAME.pool_flags.inkysupg_sell1 or false) and (G.GAME.pool_flags.inkysupg_sell2 or false)) then
                G.GAME.pool_flags.inkysupg_sell1 = false
                G.GAME.pool_flags.inkysupg_sell2 = false
                return {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_baseball' })
                                if joker_card then
                                    joker_card:set_edition("e_holo", true)
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "3/3!", colour = G.C.BLUE})
                        end
                        return true
                        end
                    }
                else
                    G.GAME.pool_flags.inkysupg_sell1 = true
                    return {
                        message = "1/3"
                    }
                end
            end
        end
}