SMODS.Joker{ --Monedia
    key = "monedia",
    config = {
        extra = {
            alljokerssellvalue = 0
        }
    },
    loc_txt = {
        ['name'] = 'Monedia',
        ['text'] = {
            [1] = 'Add {C:attention}Double{} the combined sell value of all Jokers',
            [2] = 'to {C:gold}Money{} when Blind is {C:attention}Defeated{}',
            [3] = '{C:inactive}({}{C:gold}$#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 9
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {((function() local total = 0; for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do total = total + joker.sell_cost end; return total end)()) * 2}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        return {
        dollars = ((function() local total = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do total = total + joker.sell_cost end; return total end)()) * 2
        }
    end
end
}