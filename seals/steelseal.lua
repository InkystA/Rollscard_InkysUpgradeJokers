SMODS.Seal {
    key = 'steelseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 1.5
        }
    },
    badge_colour = HEX('9cb1ba'),
   loc_txt = {
        name = 'Steel Seal',
        label = 'Steel Seal',
        text = {
        [1] = 'Acts as {C:attention}Steel{} {C:enhanced}Enhancement{}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return { x_mult = card.ability.seal.extra.x_mult }
        end
    end
}