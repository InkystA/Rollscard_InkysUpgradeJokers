SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {73,40,29,60,15,22,93,86,78,68,1,2,3,7,9,74,11,12,13,18,58,16,28,30,31,32,63,33,19,34,35,36,39,41,42,43,50,53,54,55,56,57,59,61,62,65,66,69,71,75,76,6,84,4,87,88,89,90,91,92,8,25,48,83,85,17,64,72,24,52,82,77,81,79,80,44,5,10,20,26,37,27,45,46,47,51,67,23,21,70,38,14,49}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {25,1,2,3,4,6,5,7,8,9,10,11,12,13,14,15,18,16,19,20,21,22,23,24,17}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local enhancementIndexList = {8,1,2,4,5,6,7,3}

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #enhancementIndexList do
        local file_name = files[enhancementIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end


local sealIndexList = {4,1,2,3}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local editionIndexList = {4,1,2,3}

local function load_editions_folder()
    local mod_path = SMODS.current_mod.path
    local editions_path = mod_path .. "/editions"
    local files = NFS.getDirectoryItemsInfo(editions_path)
    for i = 1, #editionIndexList do
        local file_name = files[editionIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("editions/" .. file_name))()
        end
    end
end


local voucherIndexList = {5,4,1,6,2,3}

local function load_vouchers_folder()
    local mod_path = SMODS.current_mod.path
    local vouchers_path = mod_path .. "/vouchers"
    local files = NFS.getDirectoryItemsInfo(vouchers_path)
    for i = 1, #voucherIndexList do
        local file_name = files[voucherIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("vouchers/" .. file_name))()
        end
    end
end


local deckIndexList = {3,6,8,10,2,9,5,7,1,4}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
load_editions_folder()
load_vouchers_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "inkysupg_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "inkysupg_Decks",
    cards = {
        ["j_inkysupg_abandoneddeck"] = true,
        ["j_inkysupg_anaglyphicdeck"] = true,
        ["j_inkysupg_blackdeck"] = true,
        ["j_inkysupg_bluedeck"] = true,
        ["j_inkysupg_checkereddeck"] = true,
        ["j_inkysupg_erraticdeck"] = true,
        ["j_inkysupg_ghostdeck"] = true,
        ["j_inkysupg_greendeck"] = true,
        ["j_inkysupg_magicdeck"] = true,
        ["j_inkysupg_nebuladeck"] = true,
        ["j_inkysupg_painteddeck"] = true,
        ["j_inkysupg_plasmadeck"] = true,
        ["j_inkysupg_reddeck"] = true,
        ["j_inkysupg_yellowdeck"] = true,
        ["j_inkysupg_zodiacdeck"] = true
    },
})

SMODS.ObjectType({
    key = "inkysupg_inkysupg_jokers",
    cards = {
        ["j_inkysupg_blackmail"] = true,
        ["j_inkysupg_call"] = true,
        ["j_inkysupg_cameraroll"] = true,
        ["j_inkysupg_championofjokes"] = true,
        ["j_inkysupg_deadmanshand"] = true,
        ["j_inkysupg_flashchip"] = true,
        ["j_inkysupg_kejor"] = true,
        ["j_inkysupg_missingposter"] = true,
        ["j_inkysupg_nametag"] = true,
        ["j_inkysupg_nearingasteroid"] = true,
        ["j_inkysupg_punchcard"] = true,
        ["j_inkysupg_Roughnyx Bloodstone"] = true,
        ["j_inkysupg_sideroad"] = true,
        ["j_inkysupg_spreadsheet"] = true,
        ["j_inkysupg_theentiretyofju"] = true,
        ["j_inkysupg_theflee"] = true,
        ["j_inkysupg_theoutliar"] = true,
        ["j_inkysupg_thepot"] = true,
        ["j_inkysupg_theratio"] = true,
        ["j_inkysupg_thespared"] = true,
        ["j_inkysupg_transition"] = true,
        ["j_inkysupg_waa"] = true
    },
})