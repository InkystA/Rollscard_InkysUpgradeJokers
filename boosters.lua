SMODS.Booster {
    key = 'learning_pack',
    loc_txt = {
        name = "Learning Pack",
        text = {
            [1] = 'Select {C:attention}1{} of up to {C:attention}3{}',
            [2] = '{C:green}Flashcards{} to use',
            [3] = 'Immediately'
        },
        group_name = "Learning Pack"
    },
    config = { extra = 3, choose = 1 },
    weight = 0.7,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.5,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('inkysupg_learning_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "flashcards",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_learning_pack"
            }
        elseif selected_index == 2 then
            return {
            key = "inkysupg_jforjoker",
            set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_learning_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("5fc69d"))
        ease_background_colour({ new_colour = HEX('5fc69d'), special_colour = HEX("56a786"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'second_learning_pack',
    loc_txt = {
        name = "Second Learning Pack",
        text = {
            [1] = 'Select {C:attention}1{} of up to {C:attention}3{}',
            [2] = '{C:green}Flashcards{} to use',
            [3] = 'Immediately'
        },
        group_name = "Second Learning Pack"
    },
    config = { extra = 3, choose = 1 },
    weight = 0.7,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.5,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('inkysupg_second_learning_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "flashcards",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_second_learning_pack"
            }
        elseif selected_index == 2 then
            return {
            key = "inkysupg_jforjoker",
            set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_second_learning_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("5fc69d"))
        ease_background_colour({ new_colour = HEX('5fc69d'), special_colour = HEX("56a786"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'jumbo_learning_pack',
    loc_txt = {
        name = "Jumbo Learning Pack",
        text = {
            [1] = 'Select {C:attention}1{} of up to {C:attention}5{}',
            [2] = '{C:green}Flashcards{} to use',
            [3] = 'Immediately'
        },
        group_name = "Jumbo Learning Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 6,
    weight = 0.7,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.5,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('inkysupg_jumbo_learning_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "flashcards",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_jumbo_learning_pack"
            }
        elseif selected_index == 2 then
            return {
            key = "inkysupg_jforjoker",
            set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_jumbo_learning_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("5fc69d"))
        ease_background_colour({ new_colour = HEX('5fc69d'), special_colour = HEX("56a786"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'mega_learning_pack',
    loc_txt = {
        name = "Mega Learning Pack",
        text = {
            [1] = 'Select {C:attention}2{} of up to {C:attention}5{}',
            [2] = '{C:green}Flashcards{} to use',
            [3] = 'Immediately'
        },
        group_name = "Mega Learning Pack"
    },
    config = { extra = 5, choose = 2 },
    cost = 8,
    weight = 0.7,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.5,
            0.2
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('inkysupg_mega_learning_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "flashcards",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_mega_learning_pack"
            }
        elseif selected_index == 2 then
            return {
            key = "inkysupg_jforjoker",
            set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_mega_learning_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("5fc69d"))
        ease_background_colour({ new_colour = HEX('5fc69d'), special_colour = HEX("56a786"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'debt_pack',
    loc_txt = {
        name = "Debt Pack",
        text = {
            [1] = 'Select 1 out of 11 credit cards {C:red}debts{}',
            [2] = '(theyre all the same)'
        },
        group_name = "Debt Pack"
    },
    config = { extra = 11, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 4, y = 0 },
    kind = 'Paaaaa',
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        key = "j_credit_card",
        set = "Joker",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "inkysupg_debt_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("eb1212"))
        ease_background_colour({ new_colour = HEX('eb1212'), special_colour = HEX("9d6812"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'mega_debt_pack',
    loc_txt = {
        name = "Mega Debt Pack",
        text = {
            [1] = 'Select {C:attention}3 {}out of {C:attention}30{} debt cards',
            [2] = '{C:inactive,s:0.8}(they\'re all the same){}'
        },
        group_name = "Mega Debt Pack"
    },
    config = { extra = 30, choose = 3 },
    atlas = "CustomBoosters",
    pos = { x = 5, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "Playing Card",
        enhancement = "m_inkysupg_debt",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "inkysupg_mega_debt_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ef1111"))
        ease_background_colour({ new_colour = HEX('ef1111'), special_colour = HEX("906117"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'banana',
    loc_txt = {
        name = "banana",
        text = {
            [1] = '{C:attention}banana{} pack :D'
        },
        group_name = "banana"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 6, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('inkysupg_banana_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            key = "j_gros_michel",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_banana"
            }
        elseif selected_index == 2 then
            return {
            key = "j_cavendish",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_banana"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("417505"))
        ease_background_colour({ new_colour = HEX('417505'), special_colour = HEX("f8e71c"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'deck_pack',
    loc_txt = {
        name = "Deck Pack",
        text = {
            [1] = 'Select one of up to three... decks? what???'
        },
        group_name = "Deck Pack"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 7, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "inkysupg_Decks",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "inkysupg_deck_pack"
        }
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'playonacci_cards',
    loc_txt = {
        name = "Playonacci Cards",
        text = {
            [1] = 'Select 1 of up to 8 {C:attention}Fibonacci{} Cards'
        },
        group_name = "Playonacci Cards"
    },
    config = { extra = 8, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 8, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local selected_index = pseudorandom('inkysupg_playonacci_cards_card', 1, 5)
        if selected_index == 1 then
            return {
            set = "Playing Card",
            rank = "2",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_playonacci_cards"
            }
        elseif selected_index == 2 then
            return {
            set = "Playing Card",
            rank = "3",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_playonacci_cards"
            }
        elseif selected_index == 3 then
            return {
            set = "Playing Card",
            rank = "5",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_playonacci_cards"
            }
        elseif selected_index == 4 then
            return {
            set = "Playing Card",
            rank = "8",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_playonacci_cards"
            }
        elseif selected_index == 5 then
            return {
            set = "Playing Card",
            rank = "A",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "inkysupg_playonacci_cards"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("eb0707"))
        ease_background_colour({ new_colour = HEX('eb0707'), special_colour = HEX("0d1d49"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
