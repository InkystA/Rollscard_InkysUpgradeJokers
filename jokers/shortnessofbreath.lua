SMODS.Joker{ --Shortness of Breath
    key = "shortnessofbreath",
    config = {
        extra = {
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Shortness of Breath',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult, You may only select up to {C:attention}4{} cards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "inkysupg_unusual",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_play_size = G.GAME.starting_params.play_limit
        local difference = 4 - G.GAME.starting_params.play_limit
        SMODS.change_play_limit(difference)
        card.ability.extra.original_play_size = G.GAME.starting_params.discard_limit
        local difference = 4 - G.GAME.starting_params.discard_limit
        SMODS.change_discard_limit(difference)
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_play_size then
            local difference = card.ability.extra.original_play_size - G.GAME.starting_params.play_limit
            SMODS.change_play_limit(difference)
        end
        if card.ability.extra.original_play_size then
            local difference = card.ability.extra.original_play_size - G.GAME.starting_params.discard_limit
            SMODS.change_discard_limit(difference)
        end
    end
}