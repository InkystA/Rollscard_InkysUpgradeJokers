SMODS.Joker{ --Ghost Deck
    key = "ghostdeck",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Ghost Deck',
        ['text'] = {
            [1] = 'Every {C:attention}scored{} card gains a {C:attention}random{} editon.',
            [2] = '{C:green}#1# in #2#{} chance to {C:red}destroy{} said card after scoring'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_Decks"] = true },

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_inkysupg_ghostdeck') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if true then
                local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative','e_inkysupg_anaglyphic','e_inkysupg_charged','e_inkysupg_collectionistcard','e_inkysupg_flipped'}, 'random edition')
                if random_edition then
                    context.other_card:set_edition(random_edition, true)
                end
                return {
                    message = "Card Modified!"
                        ,
                        func = function()
                            if SMODS.pseudorandom_probability(card, 'group_0_a4484fff', 1, card.ability.extra.odds, 'j_inkysupg_ghostdeck', false) then
                                context.other_card.should_destroy = true
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            return true
                            end
                        }
                    end
                end
            end
}