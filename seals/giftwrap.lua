SMODS.Seal {
    key = 'giftwrap',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            money = 0
        }
    },
    badge_colour = HEX('FFB347'),
   loc_txt = {
        name = 'Gift Wrap',
        label = 'Gift Wrap',
        text = {
        [1] = '{C:money}+$0{} when this card is held at the end of round',
        [2] = '{C:attention}Increase{} value by {C:money}+$1{} when this card is {C:attention}Discarded{}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            SMODS.calculate_effect({func = function()
                    card.ability.seal.extra.money = (card.ability.seal.extra.money) + 1
                    return true
                end}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Value Up!", colour = G.C.MONEY})
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            return { dollars = lenient_bignum(card.ability.seal.extra.money) }
        end
    end
}