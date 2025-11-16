SMODS.Joker{ --Commondoro
    key = "commondoro",
    config = {
        extra = {
            chips = 64
        }
    },
    loc_txt = {
        ['name'] = 'Commondoro',
        ['text'] = {
            [1] = 'Whenever a {C:attention}6{} and a {C:attention}4{} are scored, this joker will give {C:chips}+64{} Chips',
            [2] = '{C:inactive}(Credits to Glitchkat10 for art){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 0
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
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 6 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 1
                end)() and (function()
                    local rankCount = 0
                    for i, c in ipairs(context.scoring_hand) do
                        if c:get_id() == 4 then
                            rankCount = rankCount + 1
                        end
                    end
                    
                    return rankCount >= 1
                    end)()) then
                        return {
                            chips = card.ability.extra.chips
                        }
                    end
                end
            end
}