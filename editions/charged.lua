SMODS.Edition {
    key = 'charged',
    shader = 'negative_shine',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {
        extra = {
            x_chips = 1.2
        }
    },
    in_shop = false,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Charged',
        label = 'Charged',
        text = {
        [1] = '{X:chips,C:white}x1.2{} Chips for each {C:attention}Joker{}'
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
            for i = 1, #(G.jokers and G.jokers.cards or {}) do
              SMODS.calculate_effect({x_chips = card.edition.extra.x_chips}, card)
          end
        end
    end
}