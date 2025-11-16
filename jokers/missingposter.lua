SMODS.Joker{ --Missing Poster
    key = "missingposter",
    config = {
        extra = {
            MONEY = 0,
            no = 0
        }
    },
    loc_txt = {
        ['name'] = 'Missing Poster',
        ['text'] = {
            [1] = 'At the {C:attention}end of ante{}, This joker {C:attention}destroys{} a random joker',
            [2] = 'and adds {C:attention}Triple{} their {C:money}Sell Value{} as {C:money}${} at the end of round',
            [3] = '{C:inactive}(Currently{} {C:attention}$#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MONEY}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
        return {
            func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    local joker_sell_value = target_joker.sell_cost or 0
                    local sell_value_gain = joker_sell_value * 3
                    card.ability.extra.MONEY = card.ability.extra.MONEY + sell_value_gain
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                return true
                end
            }
        end
    if context.end_of_round and context.game_over == false and context.main_eval  then
        return {
            dollars = card.ability.extra.MONEY
        }
    end
end
}