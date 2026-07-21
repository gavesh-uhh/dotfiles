hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1,
    vrr = 1
})


-- Applications

local terminal = "kitty"
local menu = "sh -c 'pkill wofi; wofi --show drun'"


-- Screenshotting

local screenshot = "grim -g \"$(slurp)\" - | satty --filename -"
local screenshot_copy = "grim -g \"$(slurp)\" - | wl-copy"
local screenshot_full = "grim - | wl-copy"


mainMod = "SUPER"


-- Startup

hl.on("hyprland.start", function()

    hl.exec_cmd(terminal)

    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dunst")

    hl.exec_cmd("sleep 2 && hypridle")

    hl.exec_cmd("nm-applet --indicator")

    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

    hl.exec_cmd("wl-paste --watch cliphist store")

    hl.exec_cmd("sleep 5 && /home/gav/.local/bin/media-inhibit")

    hl.exec_cmd("spotify")

    hl.exec_cmd("sleep 3 && hyprctl dispatch workspace 1")

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
                    "rgba(cba6f7ee)",
                    "rgba(89b4faee)",
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
    enabled = true,
    range = 4,
    render_power = 3,
},

blur = {
    enabled = true,
    size = 3,
    passes = 1,
},
    },


    animations = {

        enabled = true,

        bezier = {
            "snap, 0.05, 0.9, 0.1, 1.0",
            "smooth, 0.25, 1.0, 0.5, 1.0",
            "overshoot, 0.34, 1.35, 0.6, 1.0",
        },


        animation = {
            "windows, 1, 2.5, overshoot, popin 90%",
            "windowsOut, 1, 2, smooth, popin 90%",
            "border, 1, 3, smooth",
            "fade, 1, 2, smooth",
            "workspaces, 1, 2.5, snap, slide",
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

-- Move floating windows with mouse

hl.bind(mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

-- Resize floating windows with mouse

hl.bind(mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

hl.bind(mainMod .. " + V",
    hl.dsp.window.float({
        action = "toggle"
    })
)

-- Exit Hyprland

hl.bind(mainMod .. " + SHIFT + E",
    hl.dsp.exit()
)


-- Logout menu

hl.bind(mainMod .. " + X", function()
    hl.exec_cmd("wlogout --protocol layer-shell")
end)


-- Lock screen

hl.bind(mainMod .. " + L",
    hl.dsp.exec_cmd("hyprlock")
)


-- Focus movement

hl.bind(mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)


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


-- Workspace switching

for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


-- Screenshots

hl.bind("PRINT",
    hl.dsp.exec_cmd(screenshot)
)

hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd(screenshot_copy)
)

hl.bind(mainMod .. " + SHIFT + P",
    hl.dsp.exec_cmd(screenshot_full)
)


-- Brightness

hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set 5%+"),
    { repeating = true, locked = true }
)

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-"),
    { repeating = true, locked = true }
)


-- Audio

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true, locked = true }
)

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true, locked = true }
)

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true }
)


-- Media controls

hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause")
)

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next")
)

hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous")
)
