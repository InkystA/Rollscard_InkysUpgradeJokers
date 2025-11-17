SMODS.Joker { --Side Road
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
        y = 0
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
    atlas = 'Joker',
    pools = { ["modprefix_inkysupg_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { localize((G.GAME.current_round.burp_card or {}).rank or 'Ace', 'ranks') } }
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.burp_card = { rank = 'Ace', id = 14 }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if next(context.poker_hands["Straight"]) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        used_card:juice_up(0.3, 0.5)
                        card_eval_status_text(used_card, 'extra', nil, nil, nil, { message = "true", colour = G.C.BLUE })
                        G.GAME.pool_flags.modprefix_true = true
                        return true
                    end
                }))
                delay(0.6)
            end
        end
        if context.individual and context.cardarea == G.play then
            if (G.GAME.pool_flags.inkysupg_true or false) then
                return {

                    func = function()
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.dollars
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                            { message = "+" .. tostring(card.ability.extra.dollars), colour = G.C.MONEY })
                        return true
                    end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            if G.playing_cards then
                local valid_burp_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_burp_cards[#valid_burp_cards + 1] = v
                    end
                end
                if valid_burp_cards[1] then
                    local burp_card = pseudorandom_element(valid_burp_cards,
                        pseudoseed('burp' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.burp_card.rank = burp_card.base.value
                    G.GAME.current_round.burp_card.id = burp_card.base.id
                end
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, { message = "true", colour = G.C.BLUE })
                    G.GAME.pool_flags.modprefix_true = false
                    return true
                end
            }))
            delay(0.6)
        end
    end
}
