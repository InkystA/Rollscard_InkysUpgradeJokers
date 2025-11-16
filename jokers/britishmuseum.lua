SMODS.Joker{ --British Museum
    key = "britishmuseum",
    config = {
        extra = {
            Xmult = 2,
            Xmult2 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'British Museum',
        ['text'] = {
            [1] = 'Each scoring #1# or #2# suits give',
            [2] = '{X:red,C:white}X2{} Mult, Other suits give {X:red,C:white}x0.5{} Mult',
            [3] = '{C:inactive}(Cry about it, mate){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.suitvar_card or {}).suit or 'Spades', 'suits_singular'), localize((G.GAME.current_round.suitvar2_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.suitvar_card or {}).suit or 'Spades'], G.C.SUITS[(G.GAME.current_round.suitvar2_card or {}).suit or 'Spades']}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.suitvar_card = { suit = 'Spades' }
        G.GAME.current_round.suitvar2_card = { suit = 'Diamonds' }
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit(G.GAME.current_round.suitvar_card.suit) or context.other_card:is_suit(G.GAME.current_round.suitvar2_card.suit)) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif (not (context.other_card:is_suit(G.GAME.current_round.suitvar_card.suit)) or not (context.other_card:is_suit(G.GAME.current_round.suitvar2_card.suit))) then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            end
        end
    if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
        if G.playing_cards then
            local valid_suitvar_cards = {}
            for _, v in ipairs(G.playing_cards) do
                if not SMODS.has_no_suit(v) then
                    valid_suitvar_cards[#valid_suitvar_cards + 1] = v
                end
            end
            if valid_suitvar_cards[1] then
                local suitvar_card = pseudorandom_element(valid_suitvar_cards, pseudoseed('suitvar' .. G.GAME.round_resets.ante))
                G.GAME.current_round.suitvar_card.suit = suitvar_card.base.suit
            end
        end
        if G.playing_cards then
            local valid_suitvar2_cards = {}
            for _, v in ipairs(G.playing_cards) do
                if not SMODS.has_no_suit(v) then
                    valid_suitvar2_cards[#valid_suitvar2_cards + 1] = v
                end
            end
            if valid_suitvar2_cards[1] then
                local suitvar2_card = pseudorandom_element(valid_suitvar2_cards, pseudoseed('suitvar2' .. G.GAME.round_resets.ante))
                G.GAME.current_round.suitvar2_card.suit = suitvar2_card.base.suit
            end
        end
    end
end
}