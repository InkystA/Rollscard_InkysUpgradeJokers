SMODS.Joker{ --Green Deck
    key = "greendeck",
    config = {
        extra = {
            handsremaining = 0,
            discardsremaining = 0,
            money÷5 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Green Deck',
        ['text'] = {
            [1] = 'Remaining {C:blue}Hands{} give {C:money}+$3{}',
            [2] = 'Remaining {C:red}Discards{} give {C:money}+$2{}',
            [3] = 'Earn {C:attention}Double{} Interest'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
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
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        return {
            dollars = (G.GAME.current_round.hands_left) * 3,
            extra = {
            dollars = (G.GAME.current_round.discards_left) * 2,
            colour = G.C.MONEY,
            extra = {
            dollars = math.floor(lenient_bignum(G.GAME.dollars / 5)),
            colour = G.C.MONEY
        }
    }
}
end
end
}