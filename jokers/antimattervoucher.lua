SMODS.Joker{ --Anti... Matter... Voucher?
    key = "antimattervoucher",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Anti... Matter... Voucher?',
        ['text'] = {
            [1] = '...{C:dark_edition}+1{} Joker Slot?',
            [2] = '{C:inactive}But like, why is this a Joker?{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 5
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

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["v_antimatter"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"v_antimatter\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    set_ability = function(self, card, initial)
        card:set_edition("e_negative", true)
    end,

    
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}