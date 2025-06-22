local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Require module
  s("req", {
    t("local "),
    i(1, "mod"),
    t(' = require("'),
    i(1),
    t('")'),
    i(0),
  }),

  -- Function
  s("fn", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2, "params"),
    t({ ")", "\t" }),
    i(0),
    t({ "", "end" }),
  }),

  -- For loop (indexed)
  s("fori", {
    t("for "),
    i(1, "i"),
    t(" = 1, "),
    i(2, "n"),
    t({ " do", "\t" }),
    i(0),
    t({ "", "end" }),
  }),

  -- For loop (pairs)
  s("forp", {
    t("for "),
    i(1, "k"),
    t(", "),
    i(2, "v"),
    t(" in pairs("),
    i(3, "table"),
    t({ ") do", "\t" }),
    i(0),
    t({ "", "end" }),
  }),
}
