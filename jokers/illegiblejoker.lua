SMODS.Joker{ --illegible joker
    key = "illegiblejoker",
    config = {
        extra = {
            odds = 3,
            dollars = 5,
            odds2 = 4,
            mult = 7
        }
    },
    loc_txt = {
        ['name'] = 'illegible joker',
        ['text'] = {
            [1] = 'when {C:attention}blind i{}s selec ted {C:green}one in thre{}e chsn e',
            [2] = 'to grive like{C:gold} 5{} {C:money}dollar{} an also {C:green}on is four{} to',
            [3] = 'grv {C:red}sven{} mlu to each palyed car',
            [4] = '{C:inactive}(Credits to ToxicPlayer){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_63e5729c', 1, card.ability.extra.odds, 'j_inkysupg_illegiblejoker', false) then
                        SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                    end
                end
            end
            if context.individual and context.cardarea == G.play  then
                if true then
                    if SMODS.pseudorandom_probability(card, 'group_0_f76bbee4', 1, card.ability.extra.odds2, 'j_inkysupg_illegiblejoker', false) then
                            SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                        end
                    end
                end
            end
}