SMODS.Back {
    key = 'fibonacci_deck',
    pos = { x = 0, y = 0 },
    config = {
},
    loc_txt = {
        name = 'Fibonacci Deck',
        text = {
            [1] = 'Start the run with only {C:attention}Fibonacci{} Ranks',
            [2] = '{C:inactive}(Ace, 2, 3, 5, and 8s){}'
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
                    if v:get_id() == 10 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 9 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 7 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 6 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                    func = function()
                    for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 4 then
                    v:remove()
                    end
                    end
                    return true
                end
            }))
    end
}