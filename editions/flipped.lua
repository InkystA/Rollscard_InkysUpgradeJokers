SMODS.Shader({ key = 'flipped', path = 'flipped.fs' })

SMODS.Edition {
    key = 'flipped',
    shader = 'flipped',
    in_shop = false,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Flipped',
        label = 'Flipped',
        text = {
        [1] = 'Swap {C:blue}Chips{} and {C:red}Mult{} when this card',
        [2] = 'is held in hand'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return { swap = true }
        end
    end
}