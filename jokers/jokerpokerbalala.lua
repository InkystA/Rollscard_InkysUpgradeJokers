SMODS.Joker{ --JOKER POKER BALAÑA
    key = "jokerpokerbalala",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'JOKER POKER BALAÑA',
        ['text'] = {
            [1] = 'cant buy anything now',
            [2] = '',
            [3] = '',
            [4] = '',
            [5] = '{C:blue,s:8.1}:){}',
            [6] = '',
            [7] = '',
            [8] = '',
            [9] = '',
            [10] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    
    calculate = function(self, card, context)
        if context.buying_card  then
            return {
                func = function()
                    
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                            G.STATE = G.STATES.GAME_OVER
                            G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
                end
            }
        end
    end
}