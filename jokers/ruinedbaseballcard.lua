SMODS.Joker{ --Ruined Baseball Card
    key = "ruinedbaseballcard",
    config = {
        extra = {
            xchips = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Ruined Baseball Card',
        ['text'] = {
            [1] = '{C:common}Common{} Jokers each give {X:blue,C:white}X1.2{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = "inkysupg_infrequent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.other_joker  then
            if (function()
                return context.other_joker.config.center.rarity == 1
                end)() then
                    return {
                        x_chips = card.ability.extra.xchips
                    }
                end
            end
        end
}