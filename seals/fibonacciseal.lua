SMODS.Seal {
    key = 'fibonacciseal',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            odds = 13
        }
    },
    badge_colour = HEX('00CED1'),
   loc_txt = {
        name = 'Fibonacci Seal',
        label = 'Fibonacci Seal',
        text = {
        [1] = '{C:green}#1# in #2#{} Chance to Create {C:attention}Fibonacci{}',
        [2] = 'If this card is a {C:attention}Fibonacci*{} Rank',
        [3] = '{C:inactive}(Must Have Room){}',
        [4] = '{C:inactive,s:0.7}(*2, 3, 5, 8 or Ace){}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds, 'inkysupg_fibonacciseal')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and (card:get_id() == 2 or card:get_id() == 3 or card:get_id() == 5 or card:get_id() == 8 or card:get_id() == 14) then
            if SMODS.pseudorandom_probability(card, 'group_0_f2bf20bb', 1, card.ability.seal.extra.odds, 'm_inkysupg_fibonacciseal') then
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_fibonacci' })
                        if joker_card then
                            
                            
                        end
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
                end
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Fibonacci!", colour = G.C.BLUE})
            end
        end
    end
}