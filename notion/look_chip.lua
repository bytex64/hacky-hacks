-- look_clean.lua drawing engine configuration file for Ion.

if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
    shadow_colour = "#00B000",
    highlight_colour = "#00FF00",
    background_colour = "black",
    foreground_colour = "#00FF00",
    padding_pixels = 1,
    highlight_pixels = 1,
    shadow_pixels = 1,
    border_style = "elevated",
    font = "fixed",
    text_align = "left",
})

de.defstyle("frame", {
    based_on = "*",
    padding_colour = "black",
    background_colour = "black",
    de.substyle("active", {
        shadow_colour = "grey",
        highlight_colour = "grey",
        padding_colour = "black",
        background_colour = "black",
    }),
})

de.defstyle("frame-tiled", {
    based_on = "frame",
    padding_pixels = 1,
    highlight_pixels = 0,
    shadow_pixels = 0,
    spacing = 1,
})


de.defstyle("tab", {
    based_on = "*",
    font = "fixed",
    de.substyle("active-selected", {
        shadow_colour = "#00FF00",
        highlight_colour = "#00FF00",
        background_colour = "black",
        foreground_colour = "#00FF00",
    }),
    de.substyle("active-unselected", {
        shadow_colour = "#404040",
        highlight_colour = "#404040",
        background_colour = "black",
        foreground_colour = "#00a000",
    }),
    de.substyle("inactive-selected", {
        shadow_colour = "#008800",
        highlight_colour = "#008800",
        background_colour = "black",
        foreground_colour = "#707070",
    }),
    de.substyle("inactive-unselected", {
        shadow_colour = "#404040",
        highlight_colour = "#404040",
        background_colour = "black",
        foreground_colour = "#707070",
    }),
    text_align = "left",
})

de.defstyle("tab-frame", {
    based_on = "tab",
    de.substyle("*-*-*-*-activity", {
        shadow_colour = "grey",
        highlight_colour = "grey",
        background_colour = "#990000",
        foreground_colour = "#eeeeee",
    }),
})

de.defstyle("tab-frame-tiled", {
    based_on = "tab-frame",
    spacing = 1,
})

de.defstyle("tab-menuentry", {
    based_on = "tab",
    text_align = "left",
    de.substyle("inactive-selected", {
        shadow_colour = "grey",
        highlight_colour = "grey",
        background_colour = "#8a999e",
        foreground_colour = "grey",
    }),
})

de.defstyle("tab-menuentry-big", {
    based_on = "tab-menuentry",
--    font = "-*-fixed-medium-r-normal-*-17-*-*-*-*-*-*-*",
    padding_pixels = 7,
})

de.defstyle("input", {
    based_on = "*",
    shadow_colour = "#00FF00",
    highlight_colour = "#00FF00",
    background_colour = "black",
    foreground_colour = "#00FF00",
    padding_pixels = 1,
    highlight_pixels = 1,
    shadow_pixels = 1,
    border_style = "elevated",
    de.substyle("*-cursor", {
        background_colour = "#00FF00",
        foreground_colour = "black",
    }),
    de.substyle("*-selection", {
        background_colour = "#aaaaaa",
        foreground_colour = "black",
    }),
    font = "fixed",
})

de.defstyle("stdisp", {
    based_on = "*",
    shadow_pixels = 0,
    highlight_pixels = 0,
    background_colour = "#000000",
    foreground_colour = "grey",
    text_align = "left",
})

dopath("lookcommon_clean")

gr.refresh()

