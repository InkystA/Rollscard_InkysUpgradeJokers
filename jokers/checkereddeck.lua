SMODS.Joker{ --Checkered Deck
    key = "checkereddeck",
    config = {
        extra = {
            chips = 50,
            Xmult = 1.5,
            Xmult2 = 1.5,
            chips2 = 50
        }
    },
    loc_txt = {
        ['name'] = 'Checkered Deck',
        ['text'] = {
            [1] = 'Scored {C:hearts}Hearts{} will give {C:blue}+50{} Chips',
            [2] = 'Scored {C:spades}Spades{} will give {X:red,C:white}X1.5{} Mult',
            [3] = 'Scored {C:clubs}Clubs{} and {C:diamonds}Diamonds{} will turn into',
            [4] = 'their respective other suit'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
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
    pools = { ["inkysupg_Decks"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                return {
                    chips = card.ability.extra.chips
                }
            elseif context.other_card:is_suit("Spades") then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif context.other_card:is_suit("Clubs") then
                assert(SMODS.change_base(context.other_card, "Spades", nil))
                return {
                    message = "Card Modified!",
                        extra = {
                        Xmult = card.ability.extra.Xmult2
                    }
                }
            elseif context.other_card:is_suit("Diamonds") then
                assert(SMODS.change_base(context.other_card, "Hearts", nil))
                return {
                    message = "Card Modified!",
                        extra = {
                        chips = card.ability.extra.chips2,
                        colour = G.C.CHIPS
                    }
                }
            end
        end
    end
}