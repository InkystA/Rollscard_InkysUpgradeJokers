SMODS.Back {
    key = 'daredevils_deck',
    pos = { x = 4, y = 0 },
    config = {
},
    loc_txt = {
        name = 'Daredevils Deck',
        text = {
            [1] = 'Start the run with a',
            [2] = '{C:dark_edition}Negative{}, {C:red}Eternal{} {C:attention}Stuntman{} and {C:attention}+1{} hand size,',
            [3] = '{X:attention,C:white}X1.5{} Blind Size'
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
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_stuntman' })
                          new_joker:set_edition("negative", true)
                          new_joker:add_sticker('eternal', true)
                          G.GAME.joker_buffer = 0
                      end
                      return true
                  end
              }))
    end
}