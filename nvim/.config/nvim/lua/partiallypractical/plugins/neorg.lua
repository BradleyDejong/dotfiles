return {
  {
    "nvim-neorg/neorg",
    -- build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.summary"] = {},
        ["core.journal"] = {},
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode"
          }
        },
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
            folds = true
          }
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              work = "~/Nextcloud/notes/neorg/work",
              home = "~/Nextcloud/notes/neorg/home",
              learning = "~/Nextcloud/notes/neorg/learning"
            },
            default_workspace = "work"
          }
        },
        ["core.export"] = {},
        ["core.export.markdown"] = {}
      }
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "folke/zen-mode.nvim" },
  },
}
