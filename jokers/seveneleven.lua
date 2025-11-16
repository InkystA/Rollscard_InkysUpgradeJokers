SMODS.Joker{ --7 Sevens, 11 Elevens
    key = "seveneleven",
    config = {
        extra = {
            mult = 7,
            xchips = 1.1,
            odds = 7,
            Xmult = 7,
            dollars = 11
        }
    },
    loc_txt = {
        ['name'] = '7 Sevens, 11 Elevens',
        ['text'] = {
            [1] = 'Whever a {C:attention}7{} or a {C:attention}Jack{} is played,',
            [2] = '{C:red}+7{} Mult and {X:blue,C:white}X1.1{} Chips, {C:green}1 in 7{} chance',
            [3] = 'to also give {X:red,C:white}X7{} Mult and {C:money}+$11{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = "inkysupg_infrequent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 7 or context.other_card:get_id() == 11) then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                    x_chips = card.ability.extra.xchips,
                    colour = G.C.DARK_EDITION
                }
                ,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'group_0_893905ff', 1, card.ability.extra.odds, 'j_inkysupg_seveneleven', false) then
                            SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                                SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                            end
                            return true
                            end
                        }
                    end
                end
            end
}