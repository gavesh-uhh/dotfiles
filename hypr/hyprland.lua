
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1,
    vrr = 1
})

-- Screenshotting
local screenshot = "grim -g \"$(slurp)\" - | satty --filename -"
local screenshot_copy = "grim -g \"$(slurp)\" - | wl-copy"
local screenshot_full = "grim - | wl-copy"

local terminal = "kitty"
local menu = "sh -c 'pkill wofi; wofi --show drun'"

mainMod = "SUPER"

hl.on("hyprland.start", function()
    hl.exec_cmd(terminal)
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
end)

hl.config({
    
    cursor = {
        no_hardware_cursors = true,
    },

    general = {
        gaps_in = 3,
        gaps_out = 10,
        border_size = 1,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
                    "rgba(00ff99ee)",
                },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = true,
        layout = "dwindle",
    },

    decoration = {
        rounding = 5,
        rounding_power = 1,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = false,
        },
    },

    animations = {
        enabled = false,
    	bezier = {
            "fast, 0.05, 0.9, 0.1, 1.05",
        },

        animation = {
            "windows, 1, 3, fast",
            "windowsOut, 1, 3, default, popin 80%",
            "border, 1, 4, default",
            "fade, 1, 3, default",
            "workspaces, 1, 3, fast",
        },
    },
})

-- Applications

hl.bind(mainMod .. " + RETURN",
    hl.dsp.exec_cmd(terminal)
)

hl.bind(mainMod .. " + SPACE",
    hl.dsp.exec_cmd(menu)
)

hl.bind(mainMod .. " + E",
    hl.dsp.exec_cmd("thunar")
)

-- Window controls

hl.bind(mainMod .. " + Q",
    hl.dsp.window.close()
)

hl.bind(mainMod .. " + F",
    hl.dsp.window.fullscreen({
        mode = "fullscreen",
        action = "toggle",
    })
)

-- Exit Hyprland

hl.bind(mainMod .. " + SHIFT + E",
    hl.dsp.exit()
)

hl.bind(mainMod .. "+ X", function()
    hl.exec_cmd("wlogout --protocol layer-shell")
end)

-- Lock screen

hl.bind(mainMod .. " + L",
    hl.dsp.exec_cmd("hyprlock")
)

-- Focus movement

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + left",
    hl.dsp.window.move({ direction = "left" })
)

hl.bind(mainMod .. " + SHIFT + right",
    hl.dsp.window.move({ direction = "right" })
)

hl.bind(mainMod .. " + SHIFT + up",
    hl.dsp.window.move({ direction = "up" })
)

hl.bind(mainMod .. " + SHIFT + down",
    hl.dsp.window.move({ direction = "down" })
)

for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


-- Screenshotting
hl.bind("PRINT",
    hl.dsp.exec_cmd(screenshot)
)

hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd(screenshot_copy)
)

hl.bind(mainMod .. " + SHIFT + P",
    hl.dsp.exec_cmd(screenshot_full)
)

