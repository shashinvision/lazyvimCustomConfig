local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Console log
  s("cl", {
    t("console.log("),
    i(1),
    t(");"),
    i(0),
  }),

  -- Import module
  s("imp", {
    t("import "),
    i(1, "module"),
    t(" from '"),
    i(2, "package"),
    t("';"),
    i(0),
  }),

  -- Export default
  s("exp", {
    t("export default "),
    i(1),
    t(";"),
    i(0),
  }),

  -- Function declaration
  s("fn", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2, "params"),
    t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Arrow function
  s("afn", {
    t("const "),
    i(1, "name"),
    t(" = ("),
    i(2, "params"),
    t({ ") => {", "\t" }),
    i(0),
    t({ "", "};" }),
  }),
}
