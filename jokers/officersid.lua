SMODS.Joker{ --Fun Police
    key = "officersid",
    config = {
        extra = {
            wildcardsindeck = 0,
            blind_size = 0.33
        }
    },
    loc_txt = {
        ['name'] = 'Fun Police',
        ['text'] = {
            [1] = '{X:attention,C:white}x0.33{} Blind Requirement if you have at least',
            [2] = '{C:attention}5{} {C:attention}Wild{} cards in your full deck',
            [3] = '{C:inactive}(Currently {C:attention}#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 7
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)()}}
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
        if 5 <= (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)() then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.GREEN})
                    G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                        end
                    }
                end
            end
        end
}