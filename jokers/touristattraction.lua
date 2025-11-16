SMODS.Joker{ --Tourist Attraction
    key = "touristattraction",
    config = {
        extra = {
            multvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tourist Attraction',
        ['text'] = {
            [1] = 'Gains {C:mult}+3{} Mult if played hand contains a {C:orange}Straight{}',
            [2] = 'Loses {C:red}-1{} Mult if played hand does {C:red}NOT{} contain a {C:attention}Straight{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.multvar
            }
        end
        if context.before and context.cardarea == G.jokers  then
            if next(context.poker_hands["Straight"]) then
                return {
                    func = function()
                        card.ability.extra.multvar = (card.ability.extra.multvar) + 3
                        return true
                        end
                    }
                elseif not (next(context.poker_hands["Straight"])) then
                    return {
                        func = function()
                            card.ability.extra.multvar = math.max(0, (card.ability.extra.multvar) - 1)
                            return true
                            end
                        }
                    elseif (card.ability.extra.multvar or 0) < 0 then
                        return {
                            func = function()
                                card.ability.extra.multvar = 0
                                return true
                                end
                            }
                        end
                    end
                end
}