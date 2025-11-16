SMODS.Consumable {
    key = 'dfordiscard',
    set = 'flashcards',
    pos = { x = 5, y = 0 },
    config = { extra = {
        discards_value = 1,
        hand_size_value = 1
    } },
    loc_txt = {
        name = 'D for Discard',
        text = {
        [1] = '{C:attention}+1{} Discard',
        [2] = '{C:red}-1{} Handsize'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discard", colour = G.C.ORANGE})
                    
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        ease_discard(1)
        
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hand Size", colour = G.C.RED})
                    G.hand:change_size(-1)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}