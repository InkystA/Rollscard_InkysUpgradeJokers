SMODS.Back {
    key = 'heirloom_deck',
    pos = { x = 6, y = 0 },
    config = {
      hand_size_value = 2,
        base_blind_size_value = 2.5,
},
    loc_txt = {
        name = 'Heirloom Deck',
        text = {
            [1] = 'All Kings in deck are {C:attention}Red Seal{}, {C:attention}Steel{} cards',
            [2] = 'All Queens in deck are {C:attention}Steel{} cards',
            [3] = 'All Jacks in deck have a {C:attention}Red Seal{}',
            [4] = '{C:attention}+2{} Hand Size, {X:attention,C:white}x2.5{} Blind Size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 13 then
                        v:set_ability('m_steel')
                        end
                        if v:get_id() == 13 then
                        v:set_ability('m_steel')
                        end
                        if v:get_id() == 13 then
                        v:set_seal("Red", true, true)
                        end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 12 then
                        v:set_ability('m_steel')
                        end
                        if v:get_id() == 12 then
                        v:set_ability('m_steel')
                        end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                        if v:get_id() == 11 then
                        v:set_seal("Red", true, true)
                        end
                    end
                    return true
                end
            }))
            G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 2
        
            G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2.5
    end
}