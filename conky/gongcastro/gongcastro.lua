-----------------------------------------------------------------------------
--                               conkyrc_seamod
-- Date    : 04/23/2016
-- Author  : SeaJey and Maxiwell
-- Conky   : >= 1.10
-- License : Distributed under the terms of GNU GPL version 2 or later
-----------------------------------------------------------------------------

conky.config = {

    background = true,
    update_interval = 1,

    cpu_avg_samples = 2,
    net_avg_samples = 2,
    temperature_unit = 'celsius',

    double_buffer = true,
    no_buffers = true,
    text_buffer_size = 2048,

    gap_x = 20,
    gap_y = 0,
    minimum_width = 300,
    minimum_height = 900,
    maximum_width = 350,

    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = true,
    own_window_argb_visual = true,
    own_window_class = 'Conky',
    own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

    border_inner_margin = 0,
    border_outer_margin = 0,
    alignment = 'top_right',


    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    draw_graph_borders = false,

    override_utf8_locale = true,
    use_xft = true,
    font = 'caviar dreams:size=11',
    xftalpha = 0.5,
    uppercase = false,

    -- Defining colors
    default_color = '#FFFFFF',
    -- Shades of Gray
    color1 = '#EEEEEE',
    color2 = '#DDDDDD',
    color3 = '#AAAAAA',
    -- Orange
    color4 = '#EF5A29',
    -- Green
    color5 = '#77DD55',
    -- Loading lua script for drawning rings
    lua_load = '~/.conky/mine/seamod_rings.lua',
    lua_draw_hook_pre = 'main',

};

--${offset 15}${font Ubuntu:size=11:style=normal}${color1}${pre_exec lsb_release -d | cut -f 2} - $sysname $kernel
conky.text = [[
${font Ubuntu:size=11:style=bold}${color4}$kernel${hr 2}
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Uptime: ${color3}$uptime
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Battery: ${color3}${battery_bar 20,120 BAT1}

# Showing CPU Graph
${voffset 30}
${offset 50}${font Ubuntu:size=11:style=bold}${color1}${acpitemp}°C
${voffset -25}
${offset 90}${font Ubuntu:size=11:style=bold}${color5}CPU:${font Ubuntu:size=11:style=bold}${color1} Intel Core i7-8750H @ $freq_g GHz
# Showing TOP 5 CPU-consumers
${offset 105}${font Ubuntu:size=11:style=normal}${color4}${top name 1}${alignr}${top cpu 1}%
${offset 105}${font Ubuntu:size=11:style=normal}${color1}${top name 2}${alignr}${top cpu 2}%
${offset 105}${font Ubuntu:size=11:style=normal}${color2}${top name 3}${alignr}${top cpu 3}%
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top name 4}${alignr}${top cpu 4}%
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top name 5}${alignr}${top cpu 5}%

#Showing GPU
${voffset 30}
${offset 50}${font Ubuntu:size=11:style=bold}${color1}${nvidia temp}°C
${voffset -30}
${offset 90}${font Ubuntu:size=11:style=bold}${color5}GPU:${font Ubuntu:size=11:style=bold}${color1} ${nvidia modelname}
${offset 105}${font Ubuntu:size=11:style=bold}${color4}Memory: ${color1}${nvidia memused}MiB / ${nvidia memavail}MiB

#Showing memory part with TOP 5
${voffset 65}
${offset 90}${font Ubuntu:size=11:style=bold}${color5}MEM:${font Ubuntu:size=11:style=bold}${color1} ${memeasyfree} / 32GiB
${offset 105}${font Ubuntu:size=11:style=normal}${color4}${top_mem name 1}${alignr}${top_mem mem_res 1}
${offset 105}${font Ubuntu:size=11:style=normal}${color1}${top_mem name 2}${alignr}${top_mem mem_res 2}
${offset 105}${font Ubuntu:size=11:style=normal}${color2}${top_mem name 3}${alignr}${top_mem mem_res 3}
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top_mem name 4}${alignr}${top_mem mem_res 4}
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top_mem name 4}${alignr}${top_mem mem_res 5}

# Network data (my desktop have only LAN). ETHERNET ring is mostly useless but looks pretty, main info is in the graphs
${voffset 25}
${offset 170}${font Ubuntu:size=10:style=bold}${color4}Lan IP: ${alignr}$color1${addr wlo1}
${offset 170}${font Ubuntu:size=10:style=bold}${color4}Ext IP: ${alignr}$color1${execi 600 wget -q -O /dev/stdout http://checkip.dyndns.org/ -o /dev/null | cut -d : -f 2- | cut -d \< -f -1}
${offset 180}${font Ubuntu:size=10:style=bold}${alignr}$color2${execi 600 wget -q -O /dev/stdout https://www.dnsleaktest.com/ -o /dev/null | grep from | grep -o '<p>.*<img' | grep -o '>.*<' | grep -oEi '[a-zA-Z0-9 ,]+'}

${voffset -100}
${offset 100}${font Ubuntu:size=11:style=bold}${color5}WiFi
${voffset 45}
${offset 15}${color1}${font ubuntu:size=10:style=bold}Up: ${alignr}${font Ubuntu:size=10:style=normal}$color2${upspeed wlo1} / ${totalup wlo1}
${offset 15}${upspeedgraph wlo1 40,320 4B1B0C FF5C2B 1280KiB -l}
${offset 15}${color1}${font Ubuntu:size=10:style=bold}Down: ${alignr}${font Ubuntu:size=10:style=normal}$color2${downspeed wlo1} / ${totaldown wlo1}
${offset 15}${downspeedgraph wlo1 40,320 324D23 77B753 1280KiB -l}


]];
