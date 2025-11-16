SMODS.Joker{ --Mythical Pull
    key = "mythicalpull",
    config = {
        extra = {
            y = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mythical Pull',
        ['text'] = {
            [1] = 'All {C:spectral}Spectral{} cards and {C:spectral}Spectral Packs{} in the shop are {C:attention}free{},',
            [2] = 'Spawn one {C:dark_edition}Negative{} {C:spectral}Spectral{} Consumable when Blind is {C:attention}Selected{}',
            [3] = '{C:inactive}(this also includes The Soul){}'
        },
        ['unlock'] = {
            [1] = 'Win a round using a high card with 6 dollars'
        }
    },
    pos = {
        x = 2,
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
    unlocked = false,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 9
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            return {
                func = function()
                    
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            end
                            
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Spectral', edition = 'e_negative', soulable = true, })                            
                            card:juice_up(0.3, 0.5)
                            return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                    end
                }
            end
        end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
    end,
  check_for_unlock = function(self,args)
    if args.type == "round_win" then
      local count = 0
 return G.GAME.last_hand_played == "High Card" and G.GAME.dollars == to_big(6)
  end
  return false
  end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_inkysupg_mythicalpull")) then
        if (self.ability.set == 'Spectral' or (self.ability.set == 'Booster' and self.config.center.kind == 'Spectral')) then
            self.cost = 0
        end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end