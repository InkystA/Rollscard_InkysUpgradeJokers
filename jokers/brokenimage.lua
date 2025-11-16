SMODS.Joker{ --brokenimage
    key = "brokenimage",
    config = {
        extra = {
            card_draw = 1
        }
    },
    loc_txt = {
        ['name'] = 'brokenimage',
        ['text'] = {
            [1] = '{C:attention}Before{} hand starts scoring,',
            [2] = 'Draw an {C:attention}extra{} card to hand',
            [3] = '{C:inactive,s:0.9}(Credits to ToxicPlayer for the card art){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if G.GAME.blind.in_blind then
                SMODS.draw_cards(card.ability.extra.card_draw)
            end
            return {
                message = "+"..tostring(card.ability.extra.card_draw).." Cards Drawn"
            }
        end
    end
}