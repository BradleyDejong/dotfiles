local ls = require "luasnip"
local extras = require "luasnip.extras"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

vim.keymap.set({"i", "s" }, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    print "No expansions"
  end
end, {silent = true})

vim.keymap.set({"i", "s" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    print "No prev jump"
  end
end, {silent = true})
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  else
    print "No choices"
  end
end, {silent = true})

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/partiallypractical/snippets.lua<CR>")

print "Reloaded snippets"

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local rep = extras.rep

ls.add_snippets("all", {
	s("ternary", {
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})

ls.add_snippets("javascript", {
	s("f", {
    t("() => "), i(1,"")
	}),
	s("fun", {
    t("("), i(1, "x"), t(") => "), i(2,"")
	}),
	s("func", {
    t({"() => {", "  "}), i(1,""), t({"", "}"})
	}),
  s("req", {
    t("const "), i(1, "module"), t(" = require('"), rep(1), t("');")
  }),
  s("desc", {
    t("describe(\""), i(1, "test group description"), t({"\", () => {", "  "}), i(2), t({"", "});"})
  }),
  s("test", {
    t("test(\""), i(1, "test description"), t({"\", () => {", "  "}), i(2), t({"", "});"})
  }),
  s("trace", {
    t("(console.log(\""), i(1, "prefix"), t("\", "), i(2, "x"), t("), "), rep(2), t(")")
  }),
  s("jest", {
    t({"import { assert } from \"chai\"", "",""}),
    t({"/*eslint-env jest*/", ""}),
    t("describe(\""), i(1, "test group description"), t({"\", () => {", "  "}), i(2), t({"", "});"})
  })
})
