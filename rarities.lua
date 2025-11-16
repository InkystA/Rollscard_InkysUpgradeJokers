SMODS.Rarity {
    key = "ascended",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('cac222'),
    loc_txt = {
        name = "Ascended"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "workinprogress",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('0a1d32'),
    loc_txt = {
        name = "WORKINPROGRESS"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "unusual",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.4,
    badge_colour = HEX('11a07f'),
    loc_txt = {
        name = "Unusual"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "infrequent",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.1,
    badge_colour = HEX('af5c0e'),
    loc_txt = {
        name = "Infrequent"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}