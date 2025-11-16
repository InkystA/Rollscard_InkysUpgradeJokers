SMODS.Back {
    key = 'iccanobif_deck',
    pos = { x = 1, y = 0 },
    config = {
},
    loc_txt = {
        name = 'Iccanobif Deck',
        text = {
            [1] = 'Start the run with non-{C:attention}Fibonacci{} Ranks',
            [2] = '{C:inactive}(10, 9, 7, 6, and 4s){}'
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
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 12 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 11 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 8 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 5 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 3 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 2 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 14 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
    end
}