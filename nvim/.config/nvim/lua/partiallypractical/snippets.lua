require("luasnip.session.snippet_collection").clear_snippets "javascript"
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
local fmt = require("luasnip.extras.fmt").fmt

-- ls.add_snippets("all", {
	-- s("ternary", {
		-- i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	-- })
-- })
--
local customElementSnippet = fmt([[
const styles = () => html`
<style>
  .main {{
  }}
</style>
`;

export class {} extends HTMLElement {{
  static observedAttributes = [];

  /** @type ShadowRoot */
  shadowRoot;
  /** @type ElementInternals*/
  _internals;

  constructor() {{
    super();
    this._internals = this.attachInternals();
    this.shadowRoot = this.attachShadow({{ mode: "closed" }});

    this.shadowRoot.appendChild(html`<div class="main"></div>`);
    this.shadowRoot.appendChild(styles());
  }}

  connectedCallback() {{
    console.log("{} connected");
  }}

  rerender() {{
    morph(
      this.shadowRoot.querySelector("div.main"),
      html`<div class="main">

      </div>`,
    );
  }}

  attributeChangedCallback(name, old, newVal) {{

  }}
}}

customElements.define("{}", {});

]], {
  i(1, "ClassName"),
  rep(1, "ClassName"),
  i(2, "tag-name"),
  rep(1, "ClassName")
})

ls.add_snippets("javascript", {
	--s("f", {
    --t("() => "), i(1,"")
	--}),
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
  s("it", {
    t("it(\""), i(1, "test description"), t({"\", () => {", "  "}), i(2), t({"", "});"})
  }),
  s("trace", {
    t("(console.log(\""), i(1, "prefix"), t("\", "), i(2, "x"), t("), "), rep(2), t(")")
  }),
  s("jest", {
    t({"import { assert } from \"chai\"", "",""}),
    t({"/*eslint-env jest*/", ""}),
    t("describe(\""), i(1, "test group description"), t({"\", () => {", "  "}), i(2), t({"", "});"})
  }),

  s("aroute",
  fmt(
  [[
    /** @type import("astro").APIRoute */
    export async function {}(context) {{
      {}
    }}
  ]],
  {
    c(1, { t "GET", t "POST", t "PUT", t "DELETE", t "PATCH" }),
    i(2, "/*route body fmt*/"),
  }
  )
  ),

  s({ trig = "im", name = "import (nodejs)"},
  fmt([[import {{{}}} from "{}";]], {
    i(2, ""),
    i(1, "")
  })
  ),
  s("@type",
  fmt(
  [[
  /** @type {} */
  ]],
  {
    c(1, {
      t "import(\"astro\").MiddlewareResponseHandler",
      t "import(\"astro\").APIRoute",
      t "import(\"redis\").RedisClientType",
      t "import(\"@google-cloud/firestore\").Firestore",
      t "import(\"@google-cloud/storage\").Bucket",
    })
  }
  )),

  s({ trig = "dts", name="daggy taggedSum"},
  fmt([[const {} = daggy.taggedSum("{}", {{
    {}: [{}],
    {}: [{}],
  }});
  ]],
  {
    i(1, "ADTName"),
    rep(1, "ADTName"),
    i(2, "Name1"),
    i(3, ""),
    i(4, "Name2"),
    i(5, ""),
  }
  )),
  s("As",
  fmt([[Async((rej,res) => {{
  {}
}})
  ]], {
    i(1,"")
  })),
  s("customelement", customElementSnippet)

})
