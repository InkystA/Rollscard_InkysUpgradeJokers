SMODS.Joker{ --Joker Forge
    key = "jokerforge",
    config = {
        extra = {
            FORGEDCHIPS = 60
        }
    },
    loc_txt = {
        ['name'] = 'Joker Forge',
        ['text'] = {
            [1] = '{X:chips,C:white}x0.1{} Chips for every JokerForge Sever Member',
            [2] = '{C:inactive,s:0.8}(Updates every update){}',
            [3] = '{C:inactive}(Currently {X:chips,C:white}#1#{} {C:inactive}Chips){}',
            [4] = '{C:blue,s:0.79}https://discord.gg/eVJucjVEDJ{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
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
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.FORGEDCHIPS}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.FORGEDCHIPS
            }
        end
    end
}