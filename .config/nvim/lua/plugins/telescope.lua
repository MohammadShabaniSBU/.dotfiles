-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
    pickers = {
        find_files = {
        },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {},
                ["n"] = {},
            },
        },
        recent_files = {
            only_cwd = true,
        },
    },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")
require("telescope").load_extension("recent_files")
