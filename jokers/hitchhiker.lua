SMODS.Joker{ --Hitchhiker
    key = "hitchhiker",
    config = {
        extra = {
            multio = 1,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Hitchhiker',
        ['text'] = {
            [1] = 'Every {C:attention}scored{} card gains {C:red}+#1#{} Mult',
            [2] = 'Increase by {C:attention}+1{} when a {C:attention}#3#{} is discarded',
            [3] = '{C:inactive,s:0.8}(Resets Mult and Changes Rank after blind is defeated){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multio, card.ability.extra.perma_mult, localize((G.GAME.current_round.reank_card or {}).rank or 'Ace', 'ranks')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.reank_card = { rank = 'Jack', id = 11 }
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.multio
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
            }
        end
        if context.discard  then
            if (function()
                local rankFound = false
                for i, c in ipairs(context.full_hand) do
                    if c:get_id() == G.GAME.current_round.reank_card.id then
                        rankFound = true
                        break
                    end
                end
                
                return rankFound
                end)() then
                    return {
                        func = function()
                            card.ability.extra.multio = (card.ability.extra.multio) + 1
                            return true
                            end
                        }
                    end
                end
            if context.end_of_round and context.game_over == false and context.main_eval  then
                if G.playing_cards then
                    local valid_reank_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_rank(v) then
                            valid_reank_cards[#valid_reank_cards + 1] = v
                        end
                    end
                    if valid_reank_cards[1] then
                        local reank_card = pseudorandom_element(valid_reank_cards, pseudoseed('reank' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.reank_card.rank = reank_card.base.value
                        G.GAME.current_round.reank_card.id = reank_card.base.id
                    end
                end
                return {
                    func = function()
                        card.ability.extra.multio = 1
                        return true
                        end
                    }
                end
            end
}