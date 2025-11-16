SMODS.Joker{ --Blue Roomie
    key = "blueroomie",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Blue Roomie',
        ['text'] = {
            [1] = 'When blind is Selected, Generate 1 {C:attention}Blue{} Seal {C:attention}Bonus{} Card.',
            [2] = 'Generate {C:attention}1{} more for every {C:attention}Blue{} Seal in Deck'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                return {
                    func = function()
                        local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                        local new_card = create_playing_card({
                        front = card_front,
                        center = 
                        G.P_CENTERS.m_bonus
                    }, G.discard, true, false, nil, true)
                    new_card:set_seal("Blue", true)
                    
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
                    end,
                    message = "Added Card to Hand!"
                    ,
                    func = function()
                    for i = 1, (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.seal == 'Blue' then count = count + 1 end end; return count end)() do
                        local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                        local new_card = create_playing_card({
                        front = card_front,
                        center = 
                        G.P_CENTERS.m_bonus
                    }, G.discard, true, false, nil, true)
                    new_card:set_seal("Blue", true)
                    
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        new_card:start_materialize()
                        G.play:emplace(new_card)
                        return true
                        end
                    }))
                        SMODS.calculate_effect({func = function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                                end
                            }))
                            draw_card(G.play, G.deck, 90, 'up')
                                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                        end
                        return true
                        end
                    }
                end
            end
        end
}