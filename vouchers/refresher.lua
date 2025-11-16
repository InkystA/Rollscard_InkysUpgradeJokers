SMODS.Voucher {
    key = 'refresher',
    pos = { x = 0, y = 0 },
    config = { extra = {
        rellors_value = 1,
        rellor_price_value = 1
    } },
    loc_txt = {
        name = 'Refresher',
        text = {
            [1] = '{C:attention}+1{} Free Reroll',
            [2] = '{C:money}+$1{} Reroll Cost'
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
            SMODS.change_free_rerolls(1)
            
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 1
                G.GAME.current_round.reroll_cost = math.max(0,
                G.GAME.current_round.reroll_cost + 1)
                return true
            end
        }))
    end
}