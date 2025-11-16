SMODS.Enhancement {
    key = 'redseal',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            retrigger_times = 1,
            retrigger_times = 1
        }
    },
    loc_txt = {
        name = 'Red Seal',
        text = {
        [1] = 'Acts as a {C:attention}Red{} Seal'
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
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.should_retrigger = false
            card.should_retrigger = true
        end
    end
}