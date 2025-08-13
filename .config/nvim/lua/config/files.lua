local telescope = require("telescope")

telescope.setup({
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
            find_command = {
                "fd",
                "--type",
                "f",
                "--no-ignore-vcs",
                "--color=never",
                "--hidden",
                "--follow",
            },
        },
    },
})
