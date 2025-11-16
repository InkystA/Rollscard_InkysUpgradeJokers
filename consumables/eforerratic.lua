SMODS.Consumable {
    key = 'eforerratic',
    set = 'flashcards',
    pos = { x = 7, y = 0 },
    config = { extra = {
        double_limit = 20,
        odds = 2,
        odds2 = 3,
        odds3 = 4,
        odds4 = 5,
        odds5 = 6,
        levels = 1,
        add_cards_count = 3,
        destroy_count = 3
    } },
    loc_txt = {
        name = 'E for... Erratic?',
        text = {
        [1] = 'I thought I made this',
        [2] = '{C:attention}Erosion{}?? What? Huh?',
        [3] = '',
        [4] = '{C:tarot,s:3.5}?{}{C:planet,s:3.5}?{}{C:spectral,s:3.5}?{}'
    }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    local double_amount = math.min(G.GAME.dollars, 20)
                    ease_dollars(double_amount, true)
                    return true
                end
            }))
            delay(0.6)
            if SMODS.pseudorandom_probability(card, 'group_0_0108cd8c', 1, card.ability.extra.odds, 'c_inkysupg_eforerratic', false) then
                
                update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = '???', chips = '???', mult = '???', level = '' })
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
            delay(1.3)            
            local hand_pool = {}
            for hand_key, _ in pairs(G.GAME.hands) do
                table.insert(hand_pool, hand_key)
            end
            local random_hand = pseudorandom_element(hand_pool, 'random_hand_levelup')
            level_up_hand(card, random_hand, true, 1)
            
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize(random_hand, 'poker_hands'), 
                 chips = G.GAME.hands[random_hand].chips, 
                 mult = G.GAME.hands[random_hand].mult, 
                 level=G.GAME.hands[random_hand].level})    
            delay(1.3)
            end
            if SMODS.pseudorandom_probability(card, 'group_1_02ffef24', 1, card.ability.extra.odds2, 'c_inkysupg_eforerratic', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.cards[i]:flip()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            local _suit = pseudorandom_element(SMODS.Suits, 'convert_all_suit').key
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local _card = G.hand.cards[i]
                        assert(SMODS.change_base(_card, nil, _suit))
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.cards do
                local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.cards[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.5)
            end
            if SMODS.pseudorandom_probability(card, 'group_2_1e8e4752', 1, card.ability.extra.odds3, 'c_inkysupg_eforerratic', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 3 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
            end
            if SMODS.pseudorandom_probability(card, 'group_3_e3c94c9f', 1, card.ability.extra.odds4, 'c_inkysupg_eforerratic', false) then
                
                
            local destroyed_cards = {}
            local temp_hand = {}

            for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )

            pseudoshuffle(temp_hand, 12345)

            for i = 1, 3 do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            SMODS.destroy_cards(destroyed_cards)

            delay(0.5)
            end
            if SMODS.pseudorandom_probability(card, 'group_4_77682ed0', 1, card.ability.extra.odds5, 'c_inkysupg_eforerratic', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.cards[i]:flip()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            local _rank = pseudorandom_element(SMODS.Ranks, 'convert_all_rank').key
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local _card = G.hand.cards[i]
                        assert(SMODS.change_base(_card, nil, _rank))
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.cards do
                local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.cards[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.5)
            end
    end,
    can_use = function(self, card)
        return true
    end
}