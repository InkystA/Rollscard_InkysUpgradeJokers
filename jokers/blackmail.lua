SMODS.Joker{ --Blackmail
    key = "blackmail",
    config = {
        extra = {
            dollars = 5,
            xchips = 1.3,
            mail = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Blackmail',
        ['text'] = {
            [1] = 'If played Hand contains a {C:attention}Mail Junk{}, {C:red}-$5{} and',
            [2] = '{X:blue,C:white}X1.3{} Chips for every {C:attention}Mail Junk{} Scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "inkysupg_unusual",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_inkysupg_mailjunk"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_inkysupg_mailjunk\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if SMODS.get_enhancements(playing_card)["m_inkysupg_mailjunk"] == true then
                        count = count + 1
                    end
                end
                return count >= 1
                end)() then
                    G.GAME.pool_flags.inkysupg_mail = true
                    return {
                        dollars = -card.ability.extra.dollars
                    }
                end
            end
            if context.individual and context.cardarea == G.play  then
                if (G.GAME.pool_flags.inkysupg_mail or false) then
                    G.GAME.pool_flags.inkysupg_mail = false
                    return {
                        x_chips = card.ability.extra.xchips
                    }
                end
            end
        end
}