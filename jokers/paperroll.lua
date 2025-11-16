SMODS.Joker{ --Paper Roll
    key = "paperroll",
    config = {
        extra = {
            odds = 2,
            odds2 = 4,
            dollars = 5,
            levels = 1
        }
    },
    loc_txt = {
        ['name'] = 'Paper Roll',
        ['text'] = {
            [1] = 'Whenever a {C:attention}Flush{} is Played,',
            [2] = '{C:green}#1# in #2#{} chance to gain {C:money}+$5{}',
            [3] = '{C:green}#3# in #4#{} to also {C:planet}Level up{} {C:attention}Flush{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
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

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_inkysupg_paperroll')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_inkysupg_paperroll')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if context.scoring_name == "Flush" then
                if SMODS.pseudorandom_probability(card, 'group_0_8c400d01', 1, card.ability.extra.odds, 'j_inkysupg_paperroll', false) then
                        SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                    end
                    if SMODS.pseudorandom_probability(card, 'group_1_ad0d6edf', 1, card.ability.extra.odds2, 'j_inkysupg_paperroll', false) then
                        local target_hand = (context.scoring_name or "High Card")
                            SMODS.calculate_effect({level_up = card.ability.extra.levels,
                        level_up_hand = target_hand}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
                    end
                end
            end
        end
}