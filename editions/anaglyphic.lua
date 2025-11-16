SMODS.Shader({ key = 'anaglyphic', path = 'anaglyphic.fs' })

SMODS.Edition {
    key = 'anaglyphic',
    shader = 'anaglyphic',
    config = {
        extra = {
            mult = 5,
            chips = 25
        }
    },
    in_shop = false,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Anaglyphic',
        label = 'Anaglyphic',
        text = {
        [1] = '{C:red}+5{} Mult, {C:blue}+25{} Chips',
        [2] = 'Gain a {C:attention}Copy{} of a held consumable  if this card is',
        [3] = 'held in hand at the {C:attention}end of round{}'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return { mult = card.edition.extra.mult, chips = card.edition.extra.chips }
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            return { func = function()
            local target_cards = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                table.insert(target_cards, consumable)
            end
            if #target_cards > 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local copied_card = copy_card(card_to_copy)
                        copied_card:add_to_deck()
                        G.consumeables:emplace(copied_card)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Consumable!", colour = G.C.GREEN})
            end
                    return true
                end }
        end
    end
}