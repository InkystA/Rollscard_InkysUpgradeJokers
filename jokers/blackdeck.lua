SMODS.Joker{ --Black Deck
    key = "blackdeck",
    config = {
        extra = {
            hand_change = 1,
            discard_change = 1
        }
    },
    loc_txt = {
        ['name'] = 'Black Deck',
        ['text'] = {
            [1] = '{C:attention}+2{} Joker slots',
            [2] = '{C:red}-1{} Discard, {C:red}-1{} Hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
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
        G.GAME.round_resets.hands = math.max(1, G.GAME.round_resets.hands - card.ability.extra.hand_change)
        G.GAME.round_resets.discards = math.max(0, G.GAME.round_resets.discards - card.ability.extra.discard_change)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 2
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_change
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_change
        G.jokers.config.card_limit = G.jokers.config.card_limit - 2
    end
}