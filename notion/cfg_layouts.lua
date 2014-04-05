--
-- Layouts for Notion
--

--
-- Helper routines and structures
--

-- Tiled frame template for the layouts below
local a_frame = {
    type="WSplitRegion",
    regparams = {
        type = "WFrame", 
        frame_style = "frame-tiled"
    }
}

-- Creates a frame with a name
local function named_frame(name)
    return {
        type = "WSplitRegion",
        regparams = {
            name = name,
            type = "WFrame",
            frame_style = "frame-tiled"
        }
    }
end

-- Helper function for generating splits for layouts
local function mksplit(dir, tl, br, float)
    return {
        type = (float and "WSplitFloat" or "WSplitSplit"),
        dir = dir,
        tls = 1,
        brs = 1,
        tl = tl,
        br = br,
    }
end

local function mktiling(split_tree)
    return {
        managed = {
            {
                type = "WTiling",
                bottom = true, -- Make it the bottom of the group
                split_tree = split_tree,
            }
        }
    }
end

--
-- The layouts
--

-- Tiling with single 1:1 horizontal split
local tmp=mktiling(mksplit("horizontal", a_frame, a_frame))
ioncore.deflayout("hsplit", tmp)
ioncore.deflayout("default", tmp)

-- Tiling with single 1:1 vertical split
ioncore.deflayout("vsplit",
    mktiling(mksplit("vertical", a_frame, a_frame))
)

-- Tiling with single 1:1 floating horizontal split
ioncore.deflayout("hfloat", 
    mktiling(mksplit("horizontal", a_frame, a_frame, true))
)

-- Tiling with single 1:1 floating vertical split
ioncore.deflayout("vfloat", 
    mktiling(mksplit("vertical", a_frame, a_frame, true))
)

-- Tiling with horizontal and then vertical splits
ioncore.deflayout("2x2",
    mktiling(mksplit("horizontal", 
                     mksplit("vertical", a_frame, a_frame),
                     mksplit("vertical", a_frame, a_frame))
    )
)

-- Three-pane GIMP layout
ioncore.deflayout("gimp",
    mktiling({
        type = "WSplitSplit",
        dir = "horizontal",
        tls = 734,
        tl = named_frame("gimp_image"),
        brs = 290,
        br = named_frame("gimp_tools"),
    })
)

-- Tiling with single full screen frame
ioncore.deflayout("full", mktiling(a_frame))

-- Layout for cluster SSH sessions
ioncore.deflayout("cluster", mktiling(a_frame))
