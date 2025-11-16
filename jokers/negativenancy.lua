SMODS.Joker{ --Negative Nancy
    key = "negativenancy",
    config = {
        extra = {
            negativecardsindeck = 0,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Negative Nancy',
        ['text'] = {
            [1] = '{C:attention}+1{} Joker Slot for every {C:attention}Negative{} Card in Deck',
            [2] = '{C:green}#2# in #3#{} chance to turn {C:attention}scored{} card into {C:dark_edition}Negative{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 9
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_inkysupg_negativenancy') 
        return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.negative then count = count + 1 end end; return count end)(), new_numerator, new_denominator}}
    end,

    set_ability = function(self, card, initial)
        card:set_edition("e_negative", true)
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_794b861f', 1, card.ability.extra.odds, 'j_inkysupg_negativenancy', false) then
                    context.other_card:set_edition("e_negative", true)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                    end
                end
            end
        end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.negative then count = count + 1 end end; return count end)()
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.negative then count = count + 1 end end; return count end)()
    end
}