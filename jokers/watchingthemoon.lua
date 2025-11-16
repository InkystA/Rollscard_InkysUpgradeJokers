SMODS.Joker{ --Watching the Moon
    key = "watchingthemoon",
    config = {
        extra = {
            xchips = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Watching the Moon',
        ['text'] = {
            [1] = 'Each {C:clubs}Club{} held in hand gives {X:chips,C:white}x1.5{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round  then
        if context.other_card:is_suit("Clubs") then
            return {
                x_chips = card.ability.extra.xchips
            }
        end
    end
end
}