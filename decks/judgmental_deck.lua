SMODS.Back {
    key = 'judgmental_deck',
    pos = { x = 7, y = 0 },
    config = {
      hand_dollars_value = 0,
        ante_win_value = 2,
        base_blind_size_value = 1.5,
      consumables = {"c_judgement","c_judgement"},
},
    loc_txt = {
        name = 'Judgmental Deck',
        text = {
            [1] = 'Start with 2 {C:attention}Judgement{}s,',
            [2] = '{C:blue}Hands{} gains you {C:red}no{} money',
            [3] = 'Win at Ante 2, {X:attention,C:white}x1.5{} Blind Size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.E_MANAGER:add_event(Event({
            func = function()
            for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
  
            play_sound('timpani')
            SMODS.add_card({ set = 'Tarot', area = G.consumeables, key = 'c_judgement'
             })
        end
        return true
        end
        }))
            G.GAME.modifiers.money_per_hand = 0
        
            
        G.GAME.win_ante = 2
            
            G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.5
    end
}