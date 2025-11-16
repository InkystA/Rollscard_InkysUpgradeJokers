SMODS.Joker{ --Dead Mans Hand
    key = "deadmanshand",
    config = {
        extra = {
            xmult = 1,
            DIE = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Dead Mans Hand',
        ['text'] = {
            [1] = 'Whenever a {C:attention}Two Pair{} is played,',
            [2] = 'The played cards are destroyed,',
            [3] = 'and this joker gains {X:red,C:white}X0.5{} Mult.',
            [4] = '{C:inactive}(Currently {X:red,C:white}x#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 7
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
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (context.scoring_name == "Two Pair" and (function()
                local rankCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == 14 then
                        rankCount = rankCount + 1
                    end
                end
                
                return rankCount == 2
                end)() and (function()
                    local rankCount = 0
                    for i, c in ipairs(context.scoring_hand) do
                        if c:get_id() == 8 then
                            rankCount = rankCount + 1
                        end
                    end
                    
                    return rankCount == 2
                    end)()) then
                        G.GAME.pool_flags.inkysupg_DIE = true
                    elseif context.scoring_name == "Two Pair" then
                        context.other_card.should_destroy = true
                        card.ability.extra.xmult = (card.ability.extra.xmult) + 0.5
                        return {
                            message = "Destroyed!"
                        }
                    end
                end
                if context.destroy_card and context.destroy_card.should_destroy  then
                    return { remove = true }
                end
            if context.individual and context.cardarea == G.hand and not context.end_of_round  then
                context.other_card.should_destroy = false
                if (G.GAME.pool_flags.inkysupg_DIE or false) then
                    G.GAME.pool_flags.inkysupg_DIE = false
                    for i = 1, (G.hand and G.hand.config.card_limit or 0) do
                        context.other_card.should_destroy = true
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                end
            end
        end
}