SMODS.Joker{ --Prescription Label
    key = "prescriptionlabel",
    config = {
        extra = {
            Chip = 0
        }
    },
    loc_txt = {
        ['name'] = 'Prescription Label',
        ['text'] = {
            [1] = 'This joker {C:attention}gains{} {C:blue}+20{} Chips if played hand has {C:attention}3{} or {C:attention}4{} cards',
            [2] = '{C:red}Resets{} if conditions {C:attention}aren\'t{} met.',
            [3] = '{C:inactive,s:0.9}(Currently {C:blue,s:0.9}+#1#{} {C:inactive,s:0.9}Chips){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "inkysupg_unusual",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Chip}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (#context.scoring_hand < 5 and #context.scoring_hand > 2) then
                return {
                    chips = card.ability.extra.Chip
                }
            elseif (#context.scoring_hand >= 5 or #context.scoring_hand <= 2) then
                card.ability.extra.Chip = 0
            end
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if (#context.scoring_hand < 5 and #context.scoring_hand > 2) then
                return {
                    func = function()
                        card.ability.extra.Chip = (card.ability.extra.Chip) + 20
                        return true
                        end
                    }
                end
            end
        end
}