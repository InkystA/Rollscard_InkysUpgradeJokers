SMODS.Enhancement {
    key = 'mailjunk',
    pos = { x = 7, y = 0 },
    config = {
        extra = {
            dollars = 2
        }
    },
    loc_txt = {
        name = 'Mail Junk',
        text = {
        [1] = '{C:money}+$2{} when you discard this card'
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
        if context.discard and context.other_card == card then
            G.E_MANAGER:add_event(Event({
     func = function()
    play_sound("inkysupg_yougotmail")
    
    return true
    end,
}))
            SMODS.calculate_effect({dollars = lenient_bignum(card.ability.extra.dollars)}, card)
        end
    end
}