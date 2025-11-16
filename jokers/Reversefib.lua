SMODS.Joker{ --Iccanobif
    key = "Reversefib",
    config = {
        extra = {
            chips = 10
        }
    },
    loc_txt = {
        ['name'] = 'Iccanobif',
        ['text'] = {
            [1] = 'Each played {C:orange}4{}, {C:orange}6{}, {C:orange}7{}, {C:orange}9{}, or {C:orange}10{}',
            [2] = 'gives {C:chips}+#1#{} Chips when scored, Increases',
            [3] = 'By {C:blue}+2{} for every Fibonacci card scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = "inkysupg_unusual",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9 or context.other_card:get_id() == 10) then
                return {
                    chips = card.ability.extra.chips
                }
            elseif (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 8 or context.other_card:get_id() == 14) then
                card.ability.extra.chips = (card.ability.extra.chips) + 2
                return {
                    message = "Fibonacci!"
                }
            end
        end
    end
}