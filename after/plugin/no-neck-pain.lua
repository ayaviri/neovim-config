require('no-neck-pain').setup({
    -- The colors don't do anything lol
    buffers = {
        scratchPad = {
            enabled=true, -- autosave
            location=nil -- current working directory
        },
        bo = {
            filetype="md"
        },
        left = {
            colors = {
                background = "rose-pine"
            }
        },
        right = {
            colors = {
                background = "tokyonight-moon"
            }
        }
    }
})
