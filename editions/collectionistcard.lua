SMODS.Shader({ key = 'sepia', path = 'sepia.fs' })

SMODS.Edition {
    key = 'collectionistcard',
    shader = 'sepia',
    config = {
        extra = {
            uncommonjokers = 0
        }
    },
    in_shop = false,
    weight = 0.5,
    extra_cost = 2,
    apply_to_float = false,
    badge_colour = HEX('20973e'),
    sound = { sound = "holo1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Collectionist Card',
        label = 'Collectionist Card',
        text = {
        [1] = '{C:red}+6{} Mult for each {C:uncommon}Uncommon{} Joker'
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
            return { mult = ((function() local count = 0; for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker.config.center.rarity == 2 then count = count + 1 end end; return count end)()) * 6 }
        end
    end
}