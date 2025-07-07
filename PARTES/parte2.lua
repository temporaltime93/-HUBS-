local baseURL = "https://raw.githubusercontent.com/temporaltime93/-HUBS-/main/%5BGENERAL%5D/SCRIPTS/"

-- * Tabla de hubs por GameId
local hubs = {
    ["ID"] = { "POINT","MARCA", "SCRIPT" },
    ["7018190066"] = { "SI", "DEAD_RIELS", "DEAD_RIELS" }
}

local juegoID = tostring(game.GameId)
local GENERAL = hubs[juegoID]

if GENERAL then
    local POINT = GENERAL[1]
    local MARCA = GENERAL[2]
    local SCRIPT = GENERAL[3]

    local _1_, _2_ = SCRIPT:match("([^_]+)_([^_]+)")
    local NOMBRE = (_1_ and _2_) and (_1_ .. " " .. _2_) or SCRIPT

    -- * Definir globales
    _G.ID = GENERAL
    _G.POINT = POINT
    _G.MARCA_DEL_JUEGO = MARCA
    _G.NOMBRE = NOMBRE
    _G.SCRIPT = SCRIPT

    print("✅ POINT:", _G.POINT)
    print("✅ MARCA:", _G.MARCA)
    print("✅ SCRIPT:", _G.SCRIPT)

    -- * URL completa del script
    local url = baseURL .. SCRIPT .. ".lua"

    -- * Modo de carga
    if POINT == "SI" then
        if _G.PING_PONG == "true" then
            local success, result = pcall(function()
                return loadstring(game:HttpGet(url))()
            end)

            if not success then
                warn("❌ Error al ejecutar el script:", result)
            end
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/temporaltime93/-PROTOTYPE-/main/[CARGAS]/ping.lua"))()
        end
    else
        local success, result = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)

        if not success then
            warn("❌ Error al ejecutar el script:", result)
        end
    end
else
    _G.mensaje = { modo = "error", texto = "❌ NO TENEMOS UN HUB PARA TU JUEGO: " .. juegoID }
    warn(_G.mensaje.texto)
end
