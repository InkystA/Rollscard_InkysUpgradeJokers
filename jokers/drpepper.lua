SMODS.Joker{ --Dr. Pepper
    key = "drpepper",
    config = {
        extra = {
            rounds = 0
        }
    },
    loc_txt = {
        ['name'] = 'Dr. Pepper',
        ['text'] = {
            [1] = 'Sell this card after {C:attention}2{} rounds to create a {C:attention}Negative Tag{}',
            [2] = '{C:inactive}(Currently{} {C:attention}#1#{}{C:inactive}/2){}',
            [3] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "inkysupg_infrequent",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_TAGS["tag_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"tag_negative\" isn't a valid Tag key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.rounds}}
    end,

    
    calculate = function(self, card, context)
        if context.selling_card  and not context.blueprint then
            if (card.ability.extra.rounds or 0) >= 2 then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_negative")
                            if tag.name == "Orbital Tag" then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end
                                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                            end
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                            end
                        }))
                        return true
                        end,
                        message = "Created Tag!"
                    }
                end
            end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.rounds = (card.ability.extra.rounds) + 1
                    return true
                    end
                }
            end
        end
}