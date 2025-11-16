SMODS.Joker{ --Painted Deck
    key = "painteddeck",
    config = {
        extra = {
            freejokerslots = 0,
            hand_size = 8
        }
    },
    loc_txt = {
        ['name'] = 'Painted Deck',
        ['text'] = {
            [1] = '{C:attention}+2{} Hand Size',
            [2] = '{C:attention}+1{} More for every {C:attention}Empty{} Joker Slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_Decks"] = true },

    
    calculate = function(self, card, context)
        if context.selling_self  then
            if G.hand.config.card_limit > 8 then
                return {
                    func = function()
                        local current_hand_size = G.hand.config.card_limit
                        local target_hand_size = card.ability.extra.hand_size
                        local difference = target_hand_size - current_hand_size
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Hand Size set to "..tostring(card.ability.extra.hand_size), colour = G.C.BLUE})
                            G.hand:change_size(difference)
                                return true
                                end
                            }
                        end
                    end
                end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(2)
        G.hand:change_size(((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {})))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-2)
        G.hand:change_size(-((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {})))
    end
}