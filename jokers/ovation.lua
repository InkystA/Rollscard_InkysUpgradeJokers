SMODS.Joker{ --Ovation
    key = "ovation",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Ovation',
        ['text'] = {
            [1] = 'If Played Hand Contains an {C:attention}Ace{} and a {C:attention}10{},',
            [2] = 'Retrigger played hand'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if ((function()
                local rankCount = 0
                for i, c in ipairs(context.full_hand) do
                    if c:get_id() == 14 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 1
                end)() and (function()
                    local rankCount = 0
                    for i, c in ipairs(context.full_hand) do
                        if c:get_id() == 10 then
                            rankCount = rankCount + 1
                        end
                    end
                    
                    return rankCount >= 1
                    end)()) then
                        return {
                            repetitions = card.ability.extra.repetitions,
                            message = localize('k_again_ex')
                        }
                    end
                end
            end
}