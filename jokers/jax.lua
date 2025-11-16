SMODS.Joker{ --Jax
    key = "jax",
    config = {
        extra = {
            FlushPlayed = 0,
            respect = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jax',
        ['text'] = {
            [1] = '{C:attention}Whenever{} you play a {C:attention}flush{}, at the end of the round',
            [2] = 'this joker will {C:attention}make a copy{} the joker to the {C:attention}left{},',
            [3] = 'But it will also {C:red}destroy{} the joker to its {C:attention}right{}.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if context.scoring_name == "Flush" then
                card.ability.extra.FlushPlayed = 1
            end
        end
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        if (card.ability.extra.FlushPlayed or 0) == 1 then
            return {
                func = function()
                    local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
                    
                    if target_joker and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                            
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                            G.GAME.joker_buffer = 0
                            return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                    end
                    return true
                    end,
                    extra = {
                    func = function()
                        local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_joker = nil
                        if my_pos and my_pos < #G.jokers.cards then
                            local joker = G.jokers.cards[my_pos + 1]
                            if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                target_joker = joker
                            end
                        end
                        
                        if target_joker then
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
                        end,
                        colour = G.C.RED
                    }
                }
            elseif ((card.ability.extra.FlushPlayed or 0) == 1 and (function()
                return G.jokers.cards[#G.jokers.cards] == card
                end)()) then
                    return {
                        func = function()
                            card:undefined()
                            return true
                            end
                        }
                    end
                end
                if context.setting_blind  and not context.blueprint then
                    return {
                        func = function()
                            card.ability.extra.FlushPlayed = 0
                            return true
                            end
                        }
                    end
                end
}