SMODS.Back {
    key = 'voucher_deck',
    pos = { x = 3, y = 0 },
    config = {
      item_rate = 0.05,
      vouchers = { "v_blank" },
},
    loc_txt = {
        name = 'Voucher Deck',
        text = {
            [1] = 'Start the run with {C:attention}Blank Voucher{}',
            [2] = 'Vouchers may {C:red}rarely{} appear in shop'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.GAME.voucher_rate = 0.05
    end
}