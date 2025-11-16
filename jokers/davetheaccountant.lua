SMODS.Joker{ --Dave the Accountant
    key = "davetheaccountant",
    config = {
        extra = {
            money÷50 = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Dave the Accountant',
        ['text'] = {
            [1] = 'Spawn a {C:dark_edition}Negative{} {C:attention}To the Moon{} when you defeat the boss blind.',
            [2] = '{X:red,C:white}x0.1{} for every {C:money}$50{}',
            [3] = '{C:inactive,s:0.8}(Currently {X:red,C:white,s:0.8}x#2#{}{C:inactive,s:0.8} Mult){}',
            [4] = '{C:inactive,s:0.6}(I\'m not paid enough for this...){}',
            [5] = '{X:money,C:white}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
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
        
        return {vars = {card.ability.extra.ignore, (math.floor(lenient_bignum(G.GAME.dollars / 50)) or 0)}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = math.floor(lenient_bignum(G.GAME.dollars / 50))
            }
        end
    if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
        return {
            func = function()
                
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_to_the_moon' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                    end
                }))
                
                if created_joker then
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                end
                return true
                end
            }
        end
    end
}