local juego = tostring(game.GameId)


-- todo: Agrega más IDs aquí cuando haya más hubs
local hubs = {
    ["7018190066"] = {"SI", "AUTO_BONOS", "DEAD_RIELS"},
}

local GENERAL = hubs[juego]

if GENERAL then
    local POINT = GENERAL[1]
    local MARCA = GENERAL[2]
    local SCRIPT = GENERAL[3]

    -- ? Separar nombre si contiene "_"
    local _1_, _2_ = SCRIPT:match("([^_]+)_([^_]+)")
    local NOMBRE = (_1_ and _2_) and (_1_ .. " " .. _2_) or SCRIPT

    -- * Definir en _G
    _G.ID = GENERAL
    _G.POINT = POINT
    _G.MARCA_DEL_JUEGO = MARCA
    _G.NOMBRE = NOMBRE
    _G.SCRIPT = SCRIPT

    print("✅ POINT:", _G.POINT)
    print("✅ MARCA:", _G.MARCA_DEL_JUEGO)
    print("✅ SCRIPT:", _G.SCRIPT)

    local URL_BASE = "https://raw.githubusercontent.com/temporaltime93/-HUBS-/main/" .. MARCA .. "/SCRIPTS/"
    --local URL_SCRIPT = URL_BASE .. SCRIPT
    local URL_SCRIPT = URL_BASE .. SCRIPT
    if POINT == "SI" then
        if _G.PING_PONG == "true" then
            return loadstring(game:HttpGet(URL_SCRIPT))()
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/temporaltime93/-PROTOTYPE-/main/[CARGAS]/ping.lua"))()
        end
    else
        return loadstring(game:HttpGet(URL_SCRIPT))()
    end
else
    _G.mensaje = { modo = "error", texto = "❌ NO TENEMOS UN HUB PARA TU JUEGO: " .. juego }
    warn(_G.mensaje.texto)
end
