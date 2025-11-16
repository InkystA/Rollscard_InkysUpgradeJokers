SMODS.Enhancement {
    key = 'recarditulate',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        name = 'Recarditulate',
        text = {
        [1] = '{C:red}+2{} Mult for each ante',
        [2] = '{C:inactive}(Currently {C:red}+#1#{}{C:inactive} Mult){}'
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
        return {vars = {((G.GAME.round_resets.ante or 0)) * 2}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { mult = (G.GAME.round_resets.ante) * 2 }
        end
    end
}