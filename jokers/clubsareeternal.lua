SMODS.Joker{ --Clubs are Eternal
    key = "clubsareeternal",
    config = {
        extra = {
            emult = 1.3
        }
    },
    loc_txt = {
        ['name'] = 'Clubs are Eternal',
        ['text'] = {
            [1] = 'Played cards with {C:clubs}Club{} suit',
            [2] = 'give {C:white,X:mult}^1.3{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 40,
    rarity = "inkysupg_ascended",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                return {
                    e_mult = card.ability.extra.emult
                }
            end
        end
    end
}