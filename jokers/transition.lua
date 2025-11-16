SMODS.Joker{ --Transition
    key = "transition",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Transition',
        ['text'] = {
            [1] = 'Scored {C:attention}Queens{} of {C:spades}Da{}{C:clubs}rk{} Suits turn into {C:attention}Kings{}',
            [2] = 'Scored {C:attention}Queens{} of {C:hearts}Lig{}{C:diamonds}ht{} Suits turn into {C:attention}Jacks{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = "inkysupg_infrequent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_inkysupg_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 12 and context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs")) then
                assert(SMODS.change_base(context.other_card, nil, "King"))
                return {
                    message = "Card Modified!"
                    }
                elseif (context.other_card:get_id() == 12 and context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds")) then
                    assert(SMODS.change_base(context.other_card, nil, "Jack"))
                    return {
                        message = "Card Modified!"
                        }
                    end
                end
            end
}