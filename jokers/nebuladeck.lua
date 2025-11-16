SMODS.Joker{ --Nebula Deck
    key = "nebuladeck",
    config = {
        extra = {
            levels = 1,
            most = 0
        }
    },
    loc_txt = {
        ['name'] = 'Nebula Deck',
        ['text'] = {
            [1] = 'Whenever you use a {C:planet}Planet{},',
            [2] = '{C:planet}Level up{} the {C:attention}most{} played hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "inkysupg_infrequent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_Decks"] = true },

    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                local temp_played = 0
                local temp_order = math.huge
                local target_hand
                for hand, value in pairs(G.GAME.hands) do 
                    if value.played > temp_played and value.visible then
                        temp_played = value.played
                        temp_order = value.order
                        target_hand = hand
                    elseif value.played == temp_played and value.visible then
                        if value.order < temp_order then
                            temp_order = value.order
                            target_hand = hand
                        end
                    end
                end
                return {
                    level_up = card.ability.extra.levels,
                    level_up_hand = target_hand,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}