SMODS.Back {
    key = 'bankers_deck',
    pos = { x = 8, y = 0 },
    config = {
      repetitions = 3,
},
    loc_txt = {
        name = 'Bankers Deck',
        text = {
            [1] = 'Allow Up to {C:red}-$60{} in debt',
            [2] = '{C:inactive}(aka start with three negative, eternal credit cards.){}',
            [3] = '{C:inactive,s:0.7}(listen man, untill they add more stuff to decks, this is what i stuck with){}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            
      for i=1, 3 do
              
                G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_credit_card' })
                          new_joker:set_edition("negative", true)
                          new_joker:add_sticker('eternal', true)
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
           end
    end
}