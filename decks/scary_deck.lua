SMODS.Back {
    key = 'scary_deck',
    pos = { x = 2, y = 0 },
    config = {
      add_starting_cards_count = 4,
        ante_win_value = 10,
},
    loc_txt = {
        name = 'Scary Deck',
        text = {
            [1] = 'Start with {C:attention}double{} face cards',
            [2] = 'All Face Cards have a {C:attention}Bonus{} {C:enhanced}Enhancement{}',
            [3] = 'Win at {C:attention}Ante 10{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 4 do
                        local _rank = 'King'
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_bonus']
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_edition( "none", true, true, true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 4 do
                        local _rank = 'Queen'
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_bonus']
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_edition( "none", true, true, true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.3,
                func = function()
                    local cards = {}
                    for i = 1, 4 do
                        local _rank = 'Jack'
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_bonus']
                        local new_card_params = { set = "Base", area = G.deck }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_edition( "none", true, true, true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 13 then
                        v:set_ability('m_bonus')
                        end
                        if v:get_id() == 13 then
                        v:set_ability('m_bonus')
                        end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 12 then
                        v:set_ability('m_bonus')
                        end
                        if v:get_id() == 12 then
                        v:set_ability('m_bonus')
                        end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 11 then
                        v:set_ability('m_bonus')
                        end
                        if v:get_id() == 11 then
                        v:set_ability('m_bonus')
                        end
                    end
                    return true
                end
            }))
            G.GAME.win_ante = 10
    end
}