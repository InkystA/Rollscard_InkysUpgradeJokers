SMODS.Joker{ --M. Kirbs
    key = "mkirbs",
    config = {
        extra = {
            Mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'M. Kirbs',
        ['text'] = {
            [1] = 'Played {C:attention}Kings{} Permanently give {X:mult,C:white}x2.5{} Mult',
            [2] = 'when scored, {C:attention}Destroys{} Kings {C:attention}after{} Scoring.',
            [3] = '{C:inactive,s:0.8}(Currently {X:red,C:white,s:0.8}x#1#{} {C:inactive,s:0.8}Mult){}',
            [4] = '{C:inactive,s:0.7}(They are a good friend of mine! Cool VA and Good Artist!){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 8
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
           
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Mult}}
    end,

    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:get_id() == 13 then
                context.other_card.should_destroy = true
                card.ability.extra.Mult = (card.ability.extra.Mult) + 2.5
                return {
                    message = "Poyo!",
                    extra = {
                    message = "Destroyed!",
                    colour = G.C.RED
                }
            }
        end
    end
    if context.cardarea == G.jokers and context.joker_main  then
        return {
            Xmult = card.ability.extra.Mult
        }
    end
end
}