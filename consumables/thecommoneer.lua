SMODS.Consumable {
    key = 'thecommoneer',
    set = 'Tarot',
    pos = { x = 9, y = 1 },
    config = { extra = {
        odds = 5,
        cards_amount = 3
    } },
    loc_txt = {
        name = 'The Commoneer',
        text = {
        [1] = 'Select {C:attention}1{} card to become a {C:attention}Riff Carff{}',
        [2] = '{C:green}#1# in #2#{} chance to turn 3 cards in hand into {C:attention}Debt{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_inkysupg_thecommoneer')
        return {vars = {numerator, denominator}}
    end,use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_inkysupg_riffcarff'])            
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
            if SMODS.pseudorandom_probability(card, 'group_0_ac12fd28', 1, card.ability.extra.odds, 'c_inkysupg_thecommoneer', false) then
                
                
            local affected_cards = {}
            local temp_hand = {}

            for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )

            pseudoshuffle(temp_hand, 12345)

            for i = 1, math.min(card.ability.extra.cards_amount, #temp_hand) do 
                affected_cards[#affected_cards + 1] = temp_hand[i] 
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #affected_cards do
                local percent = 1.15 - (i - 0.999) / (#affected_cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        affected_cards[i]:flip()
                        play_sound('card1', percent)
                        affected_cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #affected_cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        affected_cards[i]:set_ability(G.P_CENTERS['m_inkysupg_debt'])
                        return true
                    end
                }))
            end
            for i = 1, #affected_cards do
                local percent = 0.85 + (i - 0.999) / (#affected_cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        affected_cards[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        affected_cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.5)
            end
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}