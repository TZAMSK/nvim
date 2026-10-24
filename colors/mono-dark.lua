vim.o.background = "dark"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "mono-dark"

local set = function(name, opts) vim.api.nvim_set_hl(0, name, opts) end
local def = function(groups, opts)
  for _, g in ipairs(groups) do
    set(g, opts)
  end
end

-- ---- UI ----
set("Normal",       { fg = "#f0f0f0", bg = "#000000" })
set("NormalNC",     { fg = "#f0f0f0", bg = "#000000" })
set("NormalFloat",  { fg = "#f0f0f0", bg = "#000000" })
set("FloatBorder",  { fg = "#5a5a5a", bg = "#000000" })
set("SignColumn",   { bg = "#000000" })
set("EndOfBuffer",  { fg = "#000000", bg = "#000000" })
set("CursorLine",   { bg = "#121212" })
set("CursorLineNr", { fg = "#f0f0f0", bold = true })
set("LineNr",       { fg = "#6a6a6a" })
set("Pmenu",        { fg = "#f0f0f0", bg = "#0c0c0c" })
set("PmenuSel",     { fg = "#000000", bg = "#f0f0f0" })
set("Visual",       { bg = "#2a2a2a" })
set("Search",       { fg = "#000000", bg = "#d4d4d4" })
set("IncSearch",    { fg = "#000000", bg = "#ffffff", bold = true })
set("MatchParen",   { fg = "#ffffff", bold = true, underline = true })
set("StatusLine",   { fg = "#f0f0f0", bg = "#121212" })
set("StatusLineNC", { fg = "#6a6a6a", bg = "#121212" })
set("VertSplit",    { fg = "#3a3a3a", bg = "#000000" })
set("WinSeparator", { fg = "#3a3a3a", bg = "#000000" })
set("Folded",       { fg = "#8c8c8c", bg = "#0c0c0c", italic = true })
set("FoldColumn",   { fg = "#5a5a5a", bg = "#000000" })
set("NonText",      { fg = "#3a3a3a" })
set("Whitespace",   { fg = "#2a2a2a" })
set("SpecialKey",   { fg = "#5a5a5a" })
set("Directory",    { fg = "#ffffff", bold = true })
set("ErrorMsg",     { fg = "#ffffff", bold = true, underline = true })
set("WarningMsg",   { fg = "#d4d4d4", bold = true })
set("MoreMsg",      { fg = "#ffffff", bold = true })
set("Question",     { fg = "#ffffff", bold = true })
set("DiffAdd",      { bg = "#0f1f0f" })
set("DiffChange",   { bg = "#1f1f0f" })
set("DiffDelete",   { bg = "#1f0f0f" })
set("DiffText",     { bg = "#2f2f1f" })

-- ---- syntax: monochrome hierarchy ----
--
--   functions, methods   white, BOLD
--   types, classes       white, ITALIC
--   constants, numbers   white, BOLD + ITALIC
--   variables            light grey
--   parameters           medium grey
--   fields, properties   darker grey
--   keywords, #include   dim grey, BOLD
--   strings              soft grey, ITALIC
--   namespaces           darker grey, ITALIC
--   operators, brackets  dark grey
--   comments             dark grey, ITALIC

def({ "Function", "@function", "@function.call", "@function.method",
      "@function.method.call", "@function.builtin", "@function.macro" },
    { fg = "#ffffff", bold = true })

def({ "Type", "Structure", "@type", "@type.builtin", "@type.definition",
      "@type.qualifier", "@constructor" },
    { fg = "#ffffff", italic = true })

def({ "Constant", "Number", "Float", "Boolean", "@constant", "@constant.builtin",
      "@number", "@number.float", "@boolean" },
    { fg = "#ffffff", bold = true, italic = true })

def({ "Identifier", "@variable" },
    { fg = "#d4d4d4" })
set("@variable.builtin",   { fg = "#d4d4d4", italic = true })
set("@variable.parameter", { fg = "#b0b0b0" })

def({ "@variable.member", "@property", "@field" },
    { fg = "#8c8c8c" })

def({ "Statement", "Keyword", "Conditional", "Repeat", "Label", "Exception",
      "PreProc", "Include", "Define", "Macro", "@keyword", "@keyword.function",
      "@keyword.return", "@keyword.import", "@keyword.operator",
      "@keyword.conditional", "@keyword.repeat", "@keyword.exception",
      "@keyword.directive", "@keyword.storage" },
    { fg = "#9a9a9a", bold = true })

def({ "String", "Character", "@string", "@string.escape", "@character" },
    { fg = "#b8b8b8", italic = true })

def({ "@module", "@namespace" },
    { fg = "#8c8c8c", italic = true })

def({ "Operator", "Delimiter", "@operator", "@punctuation.delimiter",
      "@punctuation.bracket" },
    { fg = "#6e6e6e" })

def({ "Comment", "@comment" },
    { fg = "#707070", italic = true })

-- ---- extra captures / legacy names ----

def({ "@method", "@method.call" },
    { fg = "#ffffff", bold = true })
def({ "Typedef", "@tag", "@tag.builtin" },
    { fg = "#ffffff", italic = true })
def({ "@constant.macro", "@symbol", "@string.special.symbol" },
    { fg = "#ffffff", bold = true, italic = true })
def({ "@parameter", "@variable.parameter.builtin" },
    { fg = "#b0b0b0" })
def({ "@tag.attribute" },
    { fg = "#8c8c8c" })
def({ "@include", "@conditional", "@repeat", "@exception", "@storageclass",
      "@define", "@macro", "@preproc", "StorageClass", "@keyword.modifier",
      "@keyword.type", "@keyword.coroutine", "@keyword.debug",
      "@keyword.directive.define" },
    { fg = "#9a9a9a", bold = true })

def({ "@attribute", "@attribute.builtin" },
    { fg = "#9a9a9a", italic = true })

set("@label", { fg = "#b0b0b0", italic = true })

def({ "@string.regexp", "@string.special", "@string.escape", "@string.documentation",
      "SpecialChar", "@character.special" },
    { fg = "#b8b8b8", italic = true })
def({ "@string.special.url", "@string.special.path", "@markup.link.url" },
    { fg = "#b8b8b8", underline = true })

set("Special",    { fg = "#cfcfcf" })
set("Underlined", { fg = "#d4d4d4", underline = true })
set("Title",      { fg = "#ffffff", bold = true })

def({ "@punctuation", "@punctuation.special", "@tag.delimiter" },
    { fg = "#6e6e6e" })
set("@comment.documentation", { fg = "#7a7a7a", italic = true })
def({ "Todo", "@comment.todo", "@comment.note", "@comment.warning", "@comment.error" },
    { fg = "#ffffff", bold = true })

-- markdown / markup
def({ "@markup.heading", "@markup.heading.1", "@markup.heading.2",
      "@markup.heading.3", "@markup.heading.4", "@markup.heading.5",
      "@markup.heading.6" },
    { fg = "#ffffff", bold = true })
set("@markup.strong",        { fg = "#ffffff", bold = true })
set("@markup.italic",        { fg = "#d4d4d4", italic = true })
set("@markup.strikethrough", { fg = "#8c8c8c", strikethrough = true })
set("@markup.underline",     { fg = "#d4d4d4", underline = true })
def({ "@markup.link", "@markup.link.label" },
    { fg = "#d4d4d4", underline = true })
def({ "@markup.raw", "@markup.raw.block" },
    { fg = "#b0b0b0" })
set("@markup.list",          { fg = "#8c8c8c" })
set("@markup.quote",         { fg = "#8c8c8c", italic = true })

-- LSP semantic tokens
local links = {
  ["@lsp.type.function"]      = "@function",
  ["@lsp.type.method"]        = "@function.method",
  ["@lsp.type.macro"]         = "@constant.macro",
  ["@lsp.type.class"]         = "@type",
  ["@lsp.type.struct"]        = "@type",
  ["@lsp.type.enum"]          = "@type",
  ["@lsp.type.interface"]     = "@type",
  ["@lsp.type.type"]          = "@type",
  ["@lsp.type.typeParameter"] = "@type",
  ["@lsp.type.variable"]      = "@variable",
  ["@lsp.type.parameter"]     = "@variable.parameter",
  ["@lsp.type.property"]      = "@variable.member",
  ["@lsp.type.enumMember"]    = "@constant",
  ["@lsp.type.namespace"]     = "@module",

  ["@lsp.type.field"]              = "@variable.member",
  ["@lsp.type.member"]             = "@function.method",
  ["@lsp.type.module"]             = "@module",
  ["@lsp.type.decorator"]          = "@attribute",
  ["@lsp.type.derive"]             = "@attribute",
  ["@lsp.type.builtinAttribute"]   = "@attribute",
  ["@lsp.type.deriveHelper"]       = "@attribute",
  ["@lsp.type.lifetime"]           = "@label",
  ["@lsp.type.builtinType"]        = "@type.builtin",
  ["@lsp.type.selfKeyword"]        = "@variable.builtin",
  ["@lsp.type.selfTypeKeyword"]    = "@type.builtin",
  ["@lsp.type.typeAlias"]          = "@type",
  ["@lsp.type.union"]              = "@type",
  ["@lsp.type.generic"]            = "@type",
  ["@lsp.type.delegate"]           = "@type",
  ["@lsp.type.record"]             = "@type",
  ["@lsp.type.recordStruct"]       = "@type",
  ["@lsp.type.event"]              = "@type",
  ["@lsp.type.concept"]            = "@type",
  ["@lsp.type.keyword"]            = "@keyword",
  ["@lsp.type.modifier"]           = "@keyword",
  ["@lsp.type.boolean"]            = "@boolean",
  ["@lsp.type.number"]             = "@number",
  ["@lsp.type.string"]             = "@string",
  ["@lsp.type.comment"]            = "@comment",
  ["@lsp.type.operator"]           = "@operator",
  ["@lsp.type.regexp"]             = "@string.regexp",
  ["@lsp.type.formatSpecifier"]    = "@string.escape",
  ["@lsp.type.escapeSequence"]     = "@string.escape",
  ["@lsp.type.punctuation"]        = "@punctuation.delimiter",
  ["@lsp.type.bracket"]            = "@punctuation.bracket",
  ["@lsp.type.unresolvedReference"] = "@variable",
}
for from, to in pairs(links) do
  set(from, { link = to })
end

-- file tree
set("NeoTreeNormal",   { bg = "#000000" })
set("NeoTreeNormalNC", { bg = "#000000" })

-- noice.nvim
set("NoiceCmdlinePopup",            { fg = "#f0f0f0", bg = "#000000" })
set("NoiceCmdlinePopupBorder",      { fg = "#5a5a5a", bg = "#000000" })
set("NoiceCmdlinePopupTitle",       { fg = "#ffffff", bg = "#000000", bold = true })
set("NoiceCmdlineIcon",             { fg = "#d4d4d4" })
set("NoiceCmdlineIconSearch",       { fg = "#d4d4d4" })
set("NoiceCmdlinePrompt",           { fg = "#f0f0f0", bold = true })
set("NoiceConfirm",                 { fg = "#f0f0f0", bg = "#000000" })
set("NoiceConfirmBorder",           { fg = "#5a5a5a", bg = "#000000" })
set("NoicePopup",                   { fg = "#f0f0f0", bg = "#000000" })
set("NoicePopupBorder",             { fg = "#5a5a5a", bg = "#000000" })
set("NoiceSplit",                   { fg = "#f0f0f0", bg = "#000000" })
set("NoiceSplitBorder",             { fg = "#5a5a5a", bg = "#000000" })
set("NoiceMini",                    { fg = "#f0f0f0", bg = "#000000" })
set("NoiceVirtualText",             { fg = "#8c8c8c" })
set("NoiceLspProgressClient",       { fg = "#ffffff", bold = true })
set("NoiceLspProgressSpinner",      { fg = "#d4d4d4" })
set("NoiceLspProgressTitle",        { fg = "#b0b0b0" })
set("NoiceFormatProgressDone",      { fg = "#ffffff", bg = "#000000", bold = true })
set("NoiceFormatProgressTodo",      { fg = "#6a6a6a", bg = "#000000" })
