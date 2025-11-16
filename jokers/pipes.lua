SMODS.Joker{ --Pipes
    key = "pipes",
    config = {
        extra = {
            mult = 6,
            chips = 10
        }
    },
    loc_txt = {
        ['name'] = 'Pipes',
        ['text'] = {
            [1] = '{C:red}+6{} Mult and {C:blue}+10{} Chips for each scored card',
            [2] = 'if played hand does not contain a {C:attention}#1#{}, but',
            [3] = 'also contains a {C:attention}#2#{}.',
            [4] = '{C:inactive,s:0.8}(Changes each round){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
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
        
        return {vars = {localize((G.GAME.current_round.NoRank_card or {}).rank or 'Ace', 'ranks'), localize((G.GAME.current_round.YesRank_card or {}).rank or 'Ace', 'ranks')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.NoRank_card = { rank = 'Ace', id = 14 }
        G.GAME.current_round.YesRank_card = { rank = '2', id = 2 }
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local rankFound = true
                for i, c in ipairs(context.scoring_hand) do
                    if c:get_id() == G.GAME.current_round.NoRank_card.id then
                        rankFound = false
                        break
                    end
                end
                
                return rankFound
                end)() and (function()
                    local rankCount = 0
                    for i, c in ipairs(context.scoring_hand) do
                        if c:get_id() == G.GAME.current_round.YesRank_card.id then
                            rankCount = rankCount + 1
                        end
                    end
                    
                    return rankCount >= 1
                    end)()) then
                        return {
                            mult = card.ability.extra.mult,
                            extra = {
                            chips = card.ability.extra.chips,
                            colour = G.C.CHIPS
                        }
                    }
                end
            end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if G.playing_cards then
                local valid_NoRank_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_NoRank_cards[#valid_NoRank_cards + 1] = v
                    end
                end
                if valid_NoRank_cards[1] then
                    local NoRank_card = pseudorandom_element(valid_NoRank_cards, pseudoseed('NoRank' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.NoRank_card.rank = NoRank_card.base.value
                    G.GAME.current_round.NoRank_card.id = NoRank_card.base.id
                end
            end
            if G.playing_cards then
                local valid_YesRank_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_YesRank_cards[#valid_YesRank_cards + 1] = v
                    end
                end
                if valid_YesRank_cards[1] then
                    local YesRank_card = pseudorandom_element(valid_YesRank_cards, pseudoseed('YesRank' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.YesRank_card.rank = YesRank_card.base.value
                    G.GAME.current_round.YesRank_card.id = YesRank_card.base.id
                end
            end
        end
    end
}