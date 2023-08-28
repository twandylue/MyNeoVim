local status, ls = pcall(require, "luasnip")
if not status then
  print("luasnip is not installed")
  return
end

M = {}

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local helpers = require("LuaSnip.luasnip-helper-funcs")
local get_visual = helpers.get_visual

local tex_utils = require("LuaSnip.tex.tex_utils")

M = {
  s(
    { trig = "eq", dscr = "Expands 'eq' into an equation environment" },
    fmta(
      [[
       \begin{equation}
           <>
       \end{equation}
     ]],
      { i(1) }
    )
  ),
  s(
    { trig = "mm", dscr = "Add $ $" },
    fmta("$<>$", {
      d(1, get_visual),
    })
  ),
  s(
    { name = "Fraction", trig = "ff", snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      d(1, get_visual),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
}

return M
