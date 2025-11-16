SMODS.Enhancement {
    key = 'reinforcedglassfromtemu',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            x_mult = 6,
            odds = 2
        }
    },
    loc_txt = {
        name = 'Reinforced Glass (From Temu)',
        text = {
        [1] = '{X:mult,C:white}x6{} Mult',
        [2] = '{C:green}#1# in #2#{} chance to Break'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_inkysupg_reinforcedglassfromtemu')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if SMODS.pseudorandom_probability(card, 'group_0_913ee46a', 1, card.ability.extra.odds, 'm_inkysupg_reinforcedglassfromtemu') then
                card.glass_trigger = true
            card.should_destroy = true
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Whoopsie!", colour = G.C.RED})
            end
            return { x_mult = card.ability.extra.x_mult }
        end
    end
}