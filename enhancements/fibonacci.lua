SMODS.Enhancement {
    key = 'fibonacci',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            mult = 8
        }
    },
    loc_txt = {
        name = 'Fibonacci',
        text = {
        [1] = '{C:red}+8{} Mult if this card is a {C:attention}Fibonacci*{} Rank',
        [2] = '{C:inactive,s:0.8}(*2, 3, 5, 8, and Ace){}'
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
        if context.main_scoring and context.cardarea == G.play and (card:get_id() == 2 or card:get_id() == 3 or card:get_id() == 5 or card:get_id() == 8 or card:get_id() == 14) then
            return { mult = card.ability.extra.mult }
        end
    end
}