local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Color Scheme
config.color_scheme = "nord"
-- Font
config.font = wezterm.font("Hack Nerd Font Mono")
-- Background Opacity
config.window_background_opacity = 0.90

config.initial_rows = 36
config.initial_cols = 128

local launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    table.insert(launch_menu, {
        label = 'pwsh',
        args = { 'pwsh' },
    })

    table.insert(launch_menu, {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' },
    })

    table.insert(launch_menu, {
        label = 'nushell',
        args = { 'nu' },
    })

    -- Find installed visual studio version(s) and add their compilation
    -- environment command prompts to the menu
    for _, vsvers in
    ipairs(
        wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')
    )
    do
        local year = vsvers:gsub('Microsoft Visual Studio/', '')
        table.insert(launch_menu, {
            label = 'x64 Native Tools VS ' .. year,
            args = {
                'cmd.exe',
                '/k',
                'C:/Program Files (x86)/'
                .. vsvers
                .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat',
            },
        })
    end

    config.default_prog = { 'pwsh' }
end

config.launch_menu = launch_menu

return config
