SMODS.Voucher {
    key = 'trading_hoarder',
    pos = { x = 3, y = 0 },
    config = { extra = {
        rarity_rate = 0.2,
        rarity_rate = 0.1
    } },
    loc_txt = {
        name = 'Trading Hoarder',
        text = {
            [1] = '{C:rare}Rare{} Jokers are {C:attention}X4{} More likely to Appear',
            [2] = '{C:legendary}Legendary{} Jokers may appear in shop'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = false,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_inkysupg_baseball_collector'},
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.rare_mod = 0.2
                return true
            end
        }))
        
            
        G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.legendary_mod = 0.1
                return true
            end
        }))
    end
}