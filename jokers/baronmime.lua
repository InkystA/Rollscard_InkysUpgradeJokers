SMODS.Joker{ --The Red Seal Steel King Effect
    key = "baronmime",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'The Red Seal Steel King Effect',
        ['text'] = {
            [1] = 'When Blind is selected, {C:green}1 in 4{} chance to',
            [2] = 'grant a {C:attention}Red{} Seal, {C:attention}Steel{} King to hand',
            [3] = 'if you own a {C:attention}Baron{} and a {C:attention}Mime{}.',
            [4] = '{C:inactive,s:0.7}(Basic Ass Baron Mime Build, smh){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 5
    },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_baron"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_baron\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["j_mime"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_mime\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_inkysupg_baronmime') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if ((function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_baron" then
                        return true
                        end
                    end
                    return false
                    end)() and (function()
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i].config.center.key == "j_mime" then
                                return true
                                end
                            end
                            return false
                            end)()) then
                                if SMODS.pseudorandom_probability(card, 'group_0_7a8c0040', 1, card.ability.extra.odds, 'j_inkysupg_baronmime', false) then
                                        SMODS.calculate_effect({func = function()
                                            
                                            suit_prefix = 'r'
                                            rank_suffix = 'K'
                                            local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                                            local new_card = create_playing_card({
                                            front = card_front,
                                            center = 
                                            G.P_CENTERS.m_steel
                                        }, G.discard, true, false, nil, true)
                                        new_card:set_seal("Red", true)
                                        
                                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                                        new_card.playing_card = G.playing_card
                                        table.insert(G.playing_cards, new_card)
                                        
                                        G.E_MANAGER:add_event(Event({
                                        func = function()
                                            G.hand:emplace(new_card)
                                            new_card:start_materialize()
                                                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                                                return true
                                                end
                                            }))
                                        end}, card)
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card to Hand!", colour = G.C.GREEN})
                                    end
                                end
                            end
                        end
}