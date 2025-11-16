SMODS.Joker{ --joker.png
    key = "jokerpng",
    config = {
        extra = {
            mylifeislikeavideogame = 0,
            chippia = 1
        }
    },
    loc_txt = {
        ['name'] = 'joker.png',
        ['text'] = {
            [1] = 'If played hand has{C:attention} EXACTLY{} two suits,',
            [2] = 'This joker gains {X:chips,C:white}x0.5{} Chips',
            [3] = '{C:inactive}(Currently {X:chips,C:white}#2#{} {C:inactive}Chips){}{}',
            [4] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "inkysupg_workinprogress",
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
        
        return {vars = {card.ability.extra.mylifeislikeavideogame, card.ability.extra.chippia}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local suitCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:is_suit("Diamonds") then
                        suitCount = suitCount + 1
                    end
                end
                
                return suitCount >= 1
                end)() then
                    card.ability.extra.mylifeislikeavideogame = (card.ability.extra.mylifeislikeavideogame) + 1
                    elseif (card.ability.extra.mylifeislikeavideogame or 0) == 2 then
                        card.ability.extra.chippia = (card.ability.extra.chippia) + 0.5
                    elseif (function()
                        local suitCount = 0
                        for i, c in ipairs(context.scoring_hand) do
                            if c:is_suit("Clubs") then
                                suitCount = suitCount + 1
                            end
                        end
                        
                        return suitCount >= 1
                        end)() then
                            card.ability.extra.mylifeislikeavideogame = (card.ability.extra.mylifeislikeavideogame) + 1
                            elseif (function()
                                local suitCount = 0
                                for i, c in ipairs(context.scoring_hand) do
                                    if c:is_suit("Hearts") then
                                        suitCount = suitCount + 1
                                    end
                                end
                                
                                return suitCount >= 1
                                end)() then
                                    card.ability.extra.mylifeislikeavideogame = (card.ability.extra.mylifeislikeavideogame) + 1
                                    elseif (function()
                                        local suitCount = 0
                                        for i, c in ipairs(context.scoring_hand) do
                                            if c:is_suit("Spades") then
                                                suitCount = suitCount + 1
                                            end
                                        end
                                        
                                        return suitCount >= 1
                                        end)() then
                                            card.ability.extra.mylifeislikeavideogame = (card.ability.extra.mylifeislikeavideogame) + 1
                                            end
                                        end
                                        if context.after and context.cardarea == G.jokers  and not context.blueprint then
                                            return {
                                                func = function()
                                                    card.ability.extra.mylifeislikeavideogame = 0
                                                        return true
                                                        end
                                                    }
                                                end
                                            end
}