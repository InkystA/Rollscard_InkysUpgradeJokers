SMODS.Joker{ --The Pot
    key = "thepot",
    config = {
        extra = {
            Xmult = 4,
            burp = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Pot',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult if hand only contains scoring {C:attention}Wild{} cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if not (SMODS.get_enhancements(context.other_card)["m_wild"] == true) then
                G.GAME.pool_flags.inkysupg_burp = true
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if not ((G.GAME.pool_flags.inkysupg_burp or false)) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            G.GAME.pool_flags.inkysupg_burp = false
        end
    end
}