SMODS.Voucher {
    key = 'miscounting',
    pos = { x = 4, y = 0 },
    config = { extra = {
        voucher_slots_value = 1
    } },
    loc_txt = {
        name = 'Miscounting',
        text = {
            [1] = '{C:attention}+1{} Voucher Slot'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
            func = function()
        SMODS.change_voucher_limit(1)
                return true
            end
        }))
    end
}