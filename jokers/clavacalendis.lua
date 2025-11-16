SMODS.Joker{ --Clava Calendis
    key = "clavacalendis",
    config = {
        extra = {
            Interest = 0,
            money÷5 = 0,
            Xmult = 2,
            mult = 8,
            mult2 = 3,
            mult3 = 13,
            xchips = 2.6,
            Xmult2 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Clava Calendis',
        ['text'] = {
            [1] = 'This joker Applies every value of every',
            [2] = '{C:clubs}Club{}-related (and moon-related) Joker.'
        },
        ['unlock'] = {
            [1] = 'Have 77 Clubs in deck from a single run'
        }
    },
    pos = {
        x = 1,
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
        x = 2,
        y = 8
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local suitCount = 0
                for i, c in ipairs(context.scoring_hand) do
                    if c:is_suit("Clubs") then
                        suitCount = suitCount + 1
                    end
                end
                
                return suitCount >= 1
                end)() and ((function()
                    local suitCount = 0
                    for i, c in ipairs(context.scoring_hand) do
                        if c:is_suit("Spades") then
                            suitCount = suitCount + 1
                        end
                    end
                    
                    return suitCount >= 1
                    end)() or (function()
                        local suitCount = 0
                        for i, c in ipairs(context.scoring_hand) do
                            if c:is_suit("Diamonds") then
                                suitCount = suitCount + 1
                            end
                        end
                        
                        return suitCount >= 1
                        end)() or (function()
                            local suitCount = 0
                            for i, c in ipairs(context.scoring_hand) do
                                if c:is_suit("Hearts") then
                                    suitCount = suitCount + 1
                                end
                            end
                            
                            return suitCount >= 1
                            end)())) then
                                return {
                                    Xmult = card.ability.extra.Xmult
                                }
                            end
                        end
                        if context.individual and context.cardarea == G.play  then
                            if context.other_card:is_suit("Clubs") then
                                return {
                                    mult = card.ability.extra.mult,
                                    extra = {
                                    mult = card.ability.extra.mult2
                                }
                            }
                        end
                    end
                if context.individual and context.cardarea == G.hand and not context.end_of_round  then
                    if context.other_card:get_id() == 12 then
                        return {
                            mult = card.ability.extra.mult3
                        }
                    elseif context.other_card:is_suit("Clubs") then
                        return {
                            x_chips = card.ability.extra.xchips
                        }
                    elseif (context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") and not (context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds"))) then
                        return {
                            Xmult = card.ability.extra.Xmult2
                        }
                    end
                end
            if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    dollars = math.floor(lenient_bignum(G.GAME.dollars / 5))
                }
            end
        end,
  check_for_unlock = function(self,args)
    if args.type == "modify_deck" then
      local count = 0
        if deck_initialized == nil then
          local deck_initialized = false
        end

        if not deck_initialized and #G.playing_cards >= 40 then
          deck_initialized = true
        end

        if not deck_initialized then
          return false
        end

        for _, card in ipairs(G.playing_cards or {}) do
    if card:is_suit("Clubs") then
      count = count + 1
    end
    end
      if count >= to_big(77) then
        return true
      end
  end
  return false
  end
}