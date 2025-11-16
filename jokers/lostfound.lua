SMODS.Joker{ --Lost & Found
    key = "lostfound",
    config = {
        extra = {
            Chips = 0,
            Multio = 0
        }
    },
    loc_txt = {
        ['name'] = 'Lost & Found',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+25{} Chips and {C:red}+5{} Mult',
            [2] = 'if played hand is a single {C:attention}#3#{}',
            [3] = '{C:inactive}(Rank Changes after scoring){}',
            [4] = '{C:inactive,s:0.8}(Currently {C:blue,s:0.8}+#1#{} {C:inactive,s:0.8}Chips and{} {C:red,s:0.8}+#2#{}{C:inactive,s:0.8} Mult){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
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
        
        return {vars = {card.ability.extra.Chips, card.ability.extra.Multio, localize((G.GAME.current_round.RANK_card or {}).rank or 'Ace', 'ranks')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.RANK_card = { rank = 'Ace', id = 14 }
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Chips,
                extra = {
                mult = card.ability.extra.Multio
            }
        }
    end
    if context.individual and context.cardarea == G.play  and not context.blueprint then
        if (context.other_card:get_id() == G.GAME.current_round.RANK_card.id and #context.full_hand == 1) then
            card.ability.extra.Chips = (card.ability.extra.Chips) + 25
            card.ability.extra.Multio = (card.ability.extra.Multio) + 5
            if G.playing_cards then
                local valid_RANK_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_RANK_cards[#valid_RANK_cards + 1] = v
                    end
                end
                if valid_RANK_cards[1] then
                    local RANK_card = pseudorandom_element(valid_RANK_cards, pseudoseed('RANK' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.RANK_card.rank = RANK_card.base.value
                    G.GAME.current_round.RANK_card.id = RANK_card.base.id
                end
            end
        end
    end
end
}