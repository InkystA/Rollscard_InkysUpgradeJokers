SMODS.Joker{ --Abandoned Deck
    key = "abandoneddeck",
    config = {
        extra = {
            pb_mult_a068b466 = 4,
            pb_bonus_91731ace = 31,
            perma_mult = 0,
            perma_bonus = 0
        }
    },
    loc_txt = {
        ['name'] = 'Abandoned Deck',
        ['text'] = {
            [1] = 'All scored {C:attention}numbered cards{}',
            [2] = 'gain a {C:attention}Bonus{} of {C:red}+4{} Mult and {C:blue}+31{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = "inkysupg_infrequent",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["inkysupg_Decks"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'jud' 
          or args.source == 'sho'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) or (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9)) then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.pb_mult_a068b466
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.pb_bonus_91731ace
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
    end
}