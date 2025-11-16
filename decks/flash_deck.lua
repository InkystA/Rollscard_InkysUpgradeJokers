SMODS.Back {
    key = 'flash_deck',
    pos = { x = 9, y = 0 },
    config = {
      vouchers = { "v_reroll_surplus" },
},
    loc_txt = {
        name = 'Flash Deck',
        text = {
            [1] = 'Start with both {C:attention}Flashcard {}Joker',
            [2] = 'and {C:attention}Reroll Surplus{} Voucher'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_flash' })
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
    end
}