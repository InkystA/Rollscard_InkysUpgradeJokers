SMODS.Enhancement {
    key = 'stocktrading',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            dollars = 5,
            odds = 5,
            dollars = 10
        }
    },
    loc_txt = {
        name = 'Stock Trading',
        text = {
        [1] = 'When card is held in hand,',
        [2] = '{C:money}+$5{} if holding {C:money}+$25{} or more.',
        [3] = '{C:green}#1# in #2#{} to lose {C:red}$10{}',
        [4] = '{C:inactive,s:0.7}(Not affected by Seed Money or Money Tree){}'
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
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_inkysupg_stocktrading')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring and G.GAME.dollars >= to_big(25) then
            if SMODS.pseudorandom_probability(card, 'group_0_762ef70c', 1, card.ability.extra.odds, 'm_inkysupg_stocktrading') then
                SMODS.calculate_effect({dollars = -lenient_bignum(card.ability.extra.dollars)}, card)
            end
            return { dollars = lenient_bignum(card.ability.extra.dollars) }
        end
    end
}