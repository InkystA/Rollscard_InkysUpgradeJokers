SMODS.Voucher {
    key = 'reanalyzing',
    pos = { x = 1, y = 0 },
    config = { extra = {
        rellors_value = 2,
        rellor_price_value = 2
    } },
    loc_txt = {
        name = 'Reanalyzing',
        text = {
            [1] = '{C:attention}+2{} Additional Free Rerolls',
            [2] = '{C:money}+$2{} Reroll Cost'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = false,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_inkysupg_refresher'},
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            SMODS.change_free_rerolls(2)
            
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 2
                G.GAME.current_round.reroll_cost = math.max(0,
                G.GAME.current_round.reroll_cost + 2)
                return true
            end
        }))
    end
}