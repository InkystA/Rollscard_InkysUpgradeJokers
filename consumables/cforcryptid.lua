SMODS.Consumable {
    key = 'cforcryptid',
    set = 'flashcards',
    pos = { x = 3, y = 0 },
    config = { extra = {
        copy_cards_amount = 1
    } },
    loc_txt = {
        name = 'C for Cryptid',
        text = {
        [1] = 'Create {C:attention}one \"copy\"{} of a {C:attention}selected{} card',
        [2] = 'from your hand'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _first_materialize = nil
                    local new_cards = {}
                    
                    for _, selected_card in pairs(G.hand.highlighted) do
                        for i = 1, card.ability.extra.copy_cards_amount do
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local copied_card = copy_card(selected_card, nil, nil, G.playing_card)
                            copied_card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, copied_card)
                            G.hand:emplace(copied_card)
                            copied_card:start_materialize(nil, _first_materialize)
                            _first_materialize = true
                            new_cards[#new_cards + 1] = copied_card
                            
                            local cen_pool = {}
                            for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                                if enhancement_center.key ~= 'm_stone' then
                                    cen_pool[#cen_pool + 1] = enhancement_center
                                end
                            end
                            local enhancement = pseudorandom_element(cen_pool, 'copy_cards_enhancement')
                            copied_card:set_ability(enhancement)
                        end
                    end
                    
                    SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}