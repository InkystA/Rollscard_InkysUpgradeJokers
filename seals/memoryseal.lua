SMODS.Seal {
    key = 'memoryseal',
    pos = { x = 3, y = 0 },
    badge_colour = HEX('32CD32'),
   loc_txt = {
        name = 'Memory Seal',
        label = 'Memory Seal',
        text = {
        [1] = 'Generate {C:attention}1{} {C:green}Flashcard{} Consumable',
        [2] = 'when card is held in hand',
        [3] = 'if no{C:red} discards{} are left'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring and G.GAME.current_round.discards_left == 0 then
            return { func = function()
    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'flashcards', })                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                  end }
        end
    end
}