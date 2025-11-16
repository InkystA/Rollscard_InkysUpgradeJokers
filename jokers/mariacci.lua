SMODS.Joker{ --Mariacci
    key = "mariacci",
    config = {
        extra = {
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Mariacci',
        ['text'] = {
            [1] = '{C:money}+$3{} for every Fibonacci {C:enhanced}Enhancement{} that',
            [2] = 'doesnt have its {C:attention}Fibonacci{} Rank'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_inkysupg_fibonacci"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_inkysupg_fibonacci\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (SMODS.get_enhancements(context.other_card)["m_inkysupg_fibonacci"] == true and context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9 or context.other_card:get_id() == 10 or context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}