SMODS.Joker{ --Ruh-Roh!!
    key = "ruhroh",
    config = {
        extra = {
            yay = 0,
            odds = 10,
            respect = 0,
            eternal = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ruh-Roh!!',
        ['text'] = {
            [1] = 'When {C:orange}Blind{} is selected, {C:green}#5# in 10{} chance to create {C:orange}1{} {C:legendary}Legendary{} {C:orange}Joker{},',
            [2] = 'Otherwise, create 1 {C:dark_edition}Eternal{}, {C:blue}Common{} Joker{C:inactive}.',
            [3] = '(Must have room for the legendary, but not for the common){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "inkysupg_infrequent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_inkysupg_ruhroh') 
        return {vars = {card.ability.extra.yay, card.ability.extra.eternal, card.ability.extra.ignore, card.ability.extra.respect, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if not ((card.ability.extra.yay or 0) == 1) then
                return {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                                if joker_card then
                                    
                                    joker_card:add_sticker('eternal', true)
                                end
                                G.GAME.joker_buffer = 0
                                return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Cursed!", colour = G.C.BLUE})
                        end
                        return true
                        end
                    }
                elseif true then
                    if SMODS.pseudorandom_probability(card, 'group_0_12bb238f', 1, card.ability.extra.odds, 'j_inkysupg_ruhroh', false) then
                            SMODS.calculate_effect({func = function()
                                
                                local created_joker = false
                                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                    created_joker = true
                                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                    G.E_MANAGER:add_event(Event({
                                    func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                    end
                                }))
                            end
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                            end}, card)
                                SMODS.calculate_effect({func = function()
                                    card.ability.extra.yay = 1
                                    return true
                                    end}, card)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Legend!", colour = G.C.PURPLE})
                            end
                        end
                    end
                if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                    return {
                        func = function()
                            card.ability.extra.yay = (card.ability.extra.yay) + 0
                            return true
                            end
                        }
                    end
                end
}