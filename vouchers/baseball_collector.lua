SMODS.Voucher {
    key = 'baseball_collector',
    pos = { x = 2, y = 0 },
    config = { extra = {
        rarity_rate = 0.5
    } },
    loc_txt = {
        name = 'Baseball Collector',
        text = {
            [1] = '{C:uncommon}Uncommon{} Jokers are {C:attention}x2{} More likely to appear'
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
        G.GAME.uncommon_mod = 0.5
                return true
            end
        }))
    end
}