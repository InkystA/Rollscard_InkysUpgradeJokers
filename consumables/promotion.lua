SMODS.Consumable {
    key = 'promotion',
    set = 'Spectral',
    pos = { x = 3, y = 1 },
    config = { extra = {
        dollars_value = -100
    } },
    loc_txt = {
        name = 'Promotion',
        text = {
        [1] = 'Grant an {X:attention,C:white,E:1}Ascended{} Joker,',
        [2] = 'Set money to {C:red,s:1.3}-$100{}'
    }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local current_dollars = G.GAME.dollars
                    local target_dollars = -100
                    local difference = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(-100), colour = G.C.MONEY})
                    ease_dollars(difference, true)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'inkysupg_ascended' })
                      if new_joker then
                      end
                          G.GAME.joker_buffer = 0
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}