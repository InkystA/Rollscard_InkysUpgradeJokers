SMODS.Joker{ --Litterae Ex Memoria
    key = "exoticflash",
    config = {
        extra = {
            reroll_amount = 35,
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Litterae Ex Memoria',
        ['text'] = {
            [1] = '{C:attention}Gain{} {X:red,C:white}X0.02{} Mult for every reroll',
            [2] = 'The next {C:attention}35{} Rerolls are {C:green}Free{}',
            [3] = '{C:inactive}(A Flashcard is Required to grant the mult)',
            [4] = '(Currently{} {C:white,X:red}x#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 8
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
        x = 7,
        y = 8
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,

    
    calculate = function(self, card, context)
        if context.reroll_shop  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.02
                    return true
                    end,
                    message = "Memory!"
                }
            end
            if context.cardarea == G.jokers and context.joker_main  then
                if (function()
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].config.center.key == "j_flash" then
                            return true
                            end
                        end
                        return false
                        end)() then
                            return {
                                Xmult = card.ability.extra.xmult
                            }
                        end
                    end
                end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.reroll_amount)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-(card.ability.extra.reroll_amount))
    end
}