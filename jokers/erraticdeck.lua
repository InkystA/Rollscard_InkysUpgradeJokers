SMODS.Joker{ --Erratic Deck
    key = "erraticdeck",
    config = {
        extra = {
            repetitions = 10
        }
    },
    loc_txt = {
        ['name'] = 'Erratic Deck',
        ['text'] = {
            [1] = 'Add {C:attention}1{} randomized card for each reroll',
            [2] = 'Add {C:attention}10{} when Boss is Defeated'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_Decks"] = true },
    soul_pos = {
        x = 4,
        y = 8
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.reroll_shop  and not context.blueprint then
            local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
            local new_card = create_playing_card({
            front = card_front,
            center = 
            pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_enhancement'))
        }, G.discard, true, false, nil, true)
    new_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','inkysupg_fibonacciseal','inkysupg_giftwrap','inkysupg_memoryseal','inkysupg_steelseal'}, pseudoseed('add_card_seal')), true)
        new_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative','e_inkysupg_anaglyphic','e_inkysupg_charged','e_inkysupg_collectionistcard','e_inkysupg_flipped'}, pseudoseed('add_card_edition')), true)
        
        G.E_MANAGER:add_event(Event({
        func = function()
            new_card:start_materialize()
            G.play:emplace(new_card)
            return true
            end
        }))
        return {
            func = function()
                G.E_MANAGER:add_event(Event({
                func = function()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                end,
                message = "Added Card!"
            }
        end
    if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
        if true then
            for i = 1, card.ability.extra.repetitions do
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                front = card_front,
                center = 
                pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_enhancement'))
            }, G.discard, true, false, nil, true)
        new_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','inkysupg_fibonacciseal','inkysupg_giftwrap','inkysupg_memoryseal','inkysupg_steelseal'}, pseudoseed('add_card_seal')), true)
            new_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative','e_inkysupg_anaglyphic','e_inkysupg_charged','e_inkysupg_collectionistcard','e_inkysupg_flipped'}, pseudoseed('add_card_edition')), true)
            
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
            end
        end
    end
}