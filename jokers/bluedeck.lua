SMODS.Joker{ --Blue Deck
    key = "bluedeck",
    config = {
        extra = {
            hand_change = 1
        }
    },
    loc_txt = {
        ['name'] = 'Blue Deck',
        ['text'] = {
            [1] = '{C:attention}+1{} Hand',
            [2] = '{C:attention}+1{} Hand Size',
            [3] = '{C:attention}+1{} Play Size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_Decks"] = true },

    
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_change
        G.hand:change_size(1)
        SMODS.change_play_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_change
        G.hand:change_size(-1)
        SMODS.change_play_limit(-1)
    end
}