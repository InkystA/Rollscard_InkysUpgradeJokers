SMODS.Joker{ --Yellow Deck
    key = "yellowdeck",
    config = {
        extra = {
            dollars = 10
        }
    },
    loc_txt = {
        ['name'] = 'Yellow Deck',
        ['text'] = {
            [1] = '{C:money}+$10{} At the end of Round',
            [2] = 'Add 1 {C:attention}Gold{} Card to hand',
            [3] = 'when first hand is drawn.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_Decks"] = true },

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        return {
            dollars = card.ability.extra.dollars
        }
    end
    if context.first_hand_drawn  then
        return {
            func = function()
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                front = card_front,
                center = 
                G.P_CENTERS.m_gold
            }, G.discard, true, false, nil, true)
            
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
        }
    end
end
}