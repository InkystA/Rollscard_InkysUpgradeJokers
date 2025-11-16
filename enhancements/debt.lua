SMODS.Enhancement {
    key = 'debt',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            dollars = 2,
            dollars = 2,
            dollars = 2,
            dollars = 2
        }
    },
    loc_txt = {
        name = 'Debt',
        text = {
        [1] = 'When this card is {C:attention}held in hand{},',
        [2] = '{C:attention}discarded{} or {C:attention}scored{}, {C:red}-$2{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_credit_card' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
            SMODS.calculate_effect({dollars = -lenient_bignum(card.ability.extra.dollars)}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
        end
        if context.cardarea == G.hand and context.main_scoring then
            return { dollars = -lenient_bignum(card.ability.extra.dollars) }
        end
        if context.discard and context.other_card == card then
            return { dollars = -lenient_bignum(card.ability.extra.dollars) }
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            return { dollars = -lenient_bignum(card.ability.extra.dollars) }
        end
    end
}