SMODS.Joker{ --Side Road
    key = "sideroad",
    config = {
        extra = {
            dollars = 2,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Side Road',
        ['text'] = {
            [1] = 'If played hand contains a Straight and RANK,',
            [2] = 'Every scored card gives {C:money}+$2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    set_ability = function(self, card, initial)
        G.GAME.current_round.burp_card = { rank = 'Ace', id = 14 }
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (next(context.poker_hands["Straight"]) and (function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if  then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount >= 1
                end)()) then
                    G.GAME.pool_flags.inkysupg_true = true
                end
            end
            if context.individual and context.cardarea == G.play  then
                if (G.GAME.pool_flags.inkysupg_true or false) then
                    return {
                        dollars = card.ability.extra.dollars
                    }
                end
            end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if G.playing_cards then
                local valid_burp_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_burp_cards[#valid_burp_cards + 1] = v
                    end
                end
                if valid_burp_cards[1] then
                    local burp_card = pseudorandom_element(valid_burp_cards, pseudoseed('burp' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.burp_card.rank = burp_card.base.value
                    G.GAME.current_round.burp_card.id = burp_card.base.id
                end
            end
            G.GAME.pool_flags.inkysupg_true = false
        end
    end
}