SMODS.Enhancement {
    key = 'riffcarff',
    pos = { x = 6, y = 0 },
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        name = 'Riff Carff',
        text = {
        [1] = 'When this card is scored, {C:green}#1# in #2#{} Chance to',
        [2] = 'create {C:attention}1{} {C:dark_edition}Negative{} {C:blue}Common{} Joker',
        [3] = '{C:inactive,s:0.8}(Credits to mik9749 for the card art improvement){}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_inkysupg_riffcarff')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_02a4d168', 1, card.ability.extra.odds, 'm_inkysupg_riffcarff') then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            
                        end
                        
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
            end
        end
    end
}