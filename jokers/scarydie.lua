SMODS.Joker{ --Scary Die
    key = "scarydie",
    config = {
        extra = {
            cardsindeck = 0,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Scary Die',
        ['text'] = {
            [1] = 'This joker adds {X:green,C:white}X0.1{} to the {C:attention}numerator{}',
            [2] = 'on {C:green,E:1}probabilities{} for every {C:attention}card{} in deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        x = 7,
        y = 9
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator * ((#(G.deck and G.deck.cards or {})) * 0.1)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}