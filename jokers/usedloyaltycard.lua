SMODS.Joker{ --Used Loyalty Card
    key = "usedloyaltycard",
    config = {
        extra = {
            rounds = 0,
            scale = 0.2,
            rotation = 0.2,
            Xmult = 3,
            scale2 = 0,
            rotation2 = 0,
            constant = 0
        }
    },
    loc_txt = {
        ['name'] = 'Used Loyalty Card',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult every {C:attention}3{} Rounds',
            [2] = '{C:inactive}(#1#/3){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "inkysupg_unusual",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rounds}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.rounds or 0) == 3 then
                local target_card = context.other_card
                local function juice_card_until_(card, eval_func, first, delay) -- balatro function doesn't allow for custom scale and rotation
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',delay = delay or 0.1, blocking = false, blockable = false, timer = 'REAL',
                func = (function() if eval_func(card) then if not first or first then card:juice_up(card.ability.extra.scale, card.ability.extra.rotation) end;juice_card_until_(card, eval_func, nil, 0.8) end return true end)
                }))
            end
            card.ability.extra.rounds = 0
            return {
                func = function()
                local eval = function() return not G.RESET_JIGGLES end
                    juice_card_until_(card, eval, true)
                    return true
                    end,
                    extra = {
                    Xmult = card.ability.extra.Xmult
                }
            }
        end
    end
if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
    local target_card = context.other_card
    local function juice_card_until_(card, eval_func, first, delay) -- balatro function doesn't allow for custom scale and rotation
        G.E_MANAGER:add_event(Event({
        trigger = 'after',delay = delay or 0.1, blocking = false, blockable = false, timer = 'REAL',
    func = (function() if eval_func(card) then if not first or first then card:juice_up(card.ability.extra.scale2, card.ability.extra.rotation2) end;juice_card_until_(card, eval_func, nil, 0.8) end return true end)
    }))
end
return {
    func = function()
        card.ability.extra.rounds = (card.ability.extra.rounds) + 1
        return true
        end,
        extra = {
        func = function()
        local eval = function() return not G.RESET_JIGGLES end
            juice_card_until_(card, eval, true)
            return true
            end,
            colour = G.C.WHITE
        }
    }
end
end
}