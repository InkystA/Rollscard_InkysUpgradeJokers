SMODS.Joker{ --Red Deck
    key = "reddeck",
    config = {
        extra = {
            discard_change = 1
        }
    },
    loc_txt = {
        ['name'] = 'Red Deck',
        ['text'] = {
            [1] = '{C:attention}+1{} Discard Size',
            [2] = '{C:attention}+1{} Discard'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
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
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_change
        SMODS.change_discard_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_change
        SMODS.change_discard_limit(-1)
    end
}