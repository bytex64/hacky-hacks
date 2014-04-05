--
-- Options to get some programs work more nicely (or at all)
--


defwinprop{
    class = "AcroRead",
    instance = "documentShell",
    acrobatic = true
}


defwinprop{
    class = "Xpdf",
    instance = "openDialog_popup",
    ignore_cfgrq = true,
}

-- Better would be to apply these settings automatically whenever a window
-- has type _NET_WM_WINDOW_TYPE_NOTIFICATION
defwinprop{
        class = "Xfce4-notifyd",

        float = true,
        userpos = true,
        switchto = false,
}

-- Put all dockapps in the statusbar's systray, also adding the missing
-- size hints necessary for this to work.
defwinprop{
    is_dockapp = true,
    statusbar = "systray",
    --max_size = { w = 64, h = 64},
    --min_size = { w = 64, h = 64},
}

-- Make an exception for Docker, which sets correct size hints.
defwinprop{
    is_dockapp = true,
    class = "Docker",
    statusbar = "systray",
}

-- https://sourceforge.net/tracker/?func=detail&aid=3471910&group_id=314802&atid=1324528
defwinprop{ 
    class = "Gimp", 
    acrobatic = true,
}

-- You might want to enable these if you really must use XMMS. 
--[[
defwinprop{
    class = "xmms",
    instance = "XMMS_Playlist",
    transient_mode = "off"
}

defwinprop{
    class = "xmms",
    instance = "XMMS_Player",
    transient_mode = "off"
}
--]]

-- GIMP
defwinprop{
    role = "gimp-toolbox",
    new_group = "gimp",
    target = "gimp_tools",
    jumpto = true,
}

defwinprop{
    role = "gimp-dock",
    new_group = "gimp",
    target = "gimp_tools",
}

defwinprop{
    role = "gimp-image-window",
    new_group = "gimp",
    target = "gimp_image",
}

defwinprop{
    class = "Gimp",
    role = "gimp-rotate-tool",
    target = "gimp_tools",
}

defwinprop{
    class = "Gimp",
    role = "gimp-scale-tool",
    target = "gimp_tools",
}

defwinprop{
    class = "Gimp",
    role = "gimp-shear-tool",
    target = "gimp_tools",
}

defwinprop{
    class = "Gimp",
    role = "gimp-perspective-tool",
    target = "gimp_tools",
}

-- Pidgin
defwinprop{
    class = "Pidgin",
    role = "buddy_list",
    target = "pidgin",
}

-- Firefox
defwinprop{
    role = "browser",
    target = "browser",
}

-- Define some additional title shortening rules to use when the full
-- title doesn't fit in the available space. The first-defined matching 
-- rule that succeeds in making the title short enough is used.
ioncore.defshortening("(.*) - Mozilla(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("(.*) - Mozilla", "$1$|$1$<...")
ioncore.defshortening("XMMS - (.*)", "$1$|...$>$1")
ioncore.defshortening("[^:]+: (.*)(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("[^:]+: (.*)", "$1$|$1$<...")
ioncore.defshortening("(.*)(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("(.*)", "$1$|$1$<...")
