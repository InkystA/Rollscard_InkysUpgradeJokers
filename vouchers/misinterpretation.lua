SMODS.Voucher {
    key = 'misinterpretation',
    pos = { x = 5, y = 0 },
    config = { extra = {
        item_rate = 0.05
    } },
    loc_txt = {
        name = 'Misinterpretation',
        text = {
            [1] = '{C:attention}Vouchers{} can rarely {C:attention}appear {}in shop'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_inkysupg_miscounting'},
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.voucher_rate = 0.05
                return true
            end
        }))
    end
}