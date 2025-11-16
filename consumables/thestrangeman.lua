SMODS.Consumable {
    key = 'thestrangeman',
    set = 'Tarot',
    pos = { x = 3, y = 2 },
    config = { extra = {
        copy_cards_amount = 1,
        odds = 6
    } },
    loc_txt = {
        name = 'The Strange Man',
        text = {
        [1] = 'Copy {C:attention}1{} selected card, {C:green}1 in 6{} chance to add a',
        [2] = '{C:attention}second{} copy, with {C:attention}randomized{} Enhancement, Seal',
        [3] = 'and {C:dark_edition}Edition.{}'
    }
    },
    cost = 3,
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
                        end
                    end
                    
                    SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                    return true
                end
            }))
            delay(0.6)
            if SMODS.pseudorandom_probability(card, 'group_0_f83067ec', 1, card.ability.extra.odds, 'c_inkysupg_thestrangeman', false) then
                
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
                            local seal_pool = {'Gold','Red','Blue','Purple','inkysupg_fibonacciseal','inkysupg_giftwrap','inkysupg_memoryseal','inkysupg_steelseal'}
                            local random_seal = pseudorandom_element(seal_pool, 'copy_cards_seal')
                            copied_card:set_seal(random_seal, nil, true)
                            
                            local edition = poll_edition('copy_cards_edition', nil, true, true, 
                                { 'e_polychrome', 'e_holo', 'e_foil' })
                            copied_card:set_edition(edition, true)
                        end
                    end
                    
                    SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                    return true
                end
            }))
            delay(0.6)
            end
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}