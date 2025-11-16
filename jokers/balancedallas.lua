SMODS.Joker{ --Balance Dallas
    key = "balancedallas",
    config = {
        extra = {
            Xmult = 1.7,
            xchips = 1.7,
            odds = 7,
            inkysupg_gongg = 0
        }
    },
    loc_txt = {
        ['name'] = 'Balance Dallas',
        ['text'] = {
            [1] = 'All Scored {C:attention}Even{} Cards give {X:red,C:white}x1.7{} Mult,',
            [2] = 'All Scored {C:attention}Odd{} Cards give {X:blue,C:white}x1.7{} Chips.',
            [3] = '{C:green}1 in 7{} Chance to {X:legendary,C:white,E:0.5}Balance{} Chips & Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 7
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
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_431a5558', 1, card.ability.extra.odds, 'j_inkysupg_balancedallas', false) then
                        SMODS.calculate_effect({balance = true}, card)
                    end
                end
            end
            if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("inkysupg_gongg")
                    
                    return true
                    end,
                }))
            end
        end
}