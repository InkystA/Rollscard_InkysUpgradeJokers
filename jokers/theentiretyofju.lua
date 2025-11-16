SMODS.Joker{ --The Entirety of JU
    key = "theentiretyofju",
    config = {
        extra = {
            Chips = 387,
            odds = 8,
            odds2 = 6,
            odds3 = 15,
            odds4 = 25
        }
    },
    loc_txt = {
        ['name'] = 'The Entirety of JU',
        ['text'] = {
            [1] = '{C:blue}+0.5{} Chips for every member of the',
            [2] = 'Jackbox University Discord Server',
            [3] = 'Will randomly either {C:attention}gain{} or {C:attention}lose {}{C:blue}10{} Chips when hand',
            [4] = 'finishes scoring',
            [5] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_inkysupg_theentiretyofju')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_inkysupg_theentiretyofju')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_inkysupg_theentiretyofju')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_inkysupg_theentiretyofju')
        return {vars = {card.ability.extra.Chips, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Chips
            }
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_88f54957', 1, card.ability.extra.odds, 'j_inkysupg_theentiretyofju', false) then
                        SMODS.calculate_effect({func = function()
                            card.ability.extra.Chips = (card.ability.extra.Chips) + 10
                            return true
                            end}, card)
                        end
                        if SMODS.pseudorandom_probability(card, 'group_1_c36bdbee', 1, card.ability.extra.odds2, 'j_inkysupg_theentiretyofju', false) then
                                SMODS.calculate_effect({func = function()
                                    card.ability.extra.Chips = math.max(0, (card.ability.extra.Chips) - 10)
                                    return true
                                    end}, card)
                                end
                                if SMODS.pseudorandom_probability(card, 'group_2_69d34cf1', 1, card.ability.extra.odds3, 'j_inkysupg_theentiretyofju', false) then
                                        SMODS.calculate_effect({func = function()
                                            card.ability.extra.Chips = (card.ability.extra.Chips) * 2
                                            return true
                                            end}, card)
                                        end
                                        if SMODS.pseudorandom_probability(card, 'group_3_78843182', 1, card.ability.extra.odds4, 'j_inkysupg_theentiretyofju', false) then
                                                SMODS.calculate_effect({func = function()
                                                    card.ability.extra.Chips = (card.ability.extra.Chips) / 3
                                                    return true
                                                    end}, card)
                                                end
                                            end
                                        end
                                    end
}