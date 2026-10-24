vim.o.background = "light"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "mono-light"

local set = function(name, opts) vim.api.nvim_set_hl(0, name, opts) end
local def = function(groups, opts)
  for _, g in ipairs(groups) do
    set(g, opts)
  end
end

-- ---- UI ----
set("Normal",       { fg = "#1a1a1a", bg = "#ffffff" })
set("NormalNC",     { fg = "#1a1a1a", bg = "#ffffff" })
set("NormalFloat",  { fg = "#1a1a1a", bg = "#ffffff" })
set("FloatBorder",  { fg = "#a0a0a0", bg = "#ffffff" })
set("SignColumn",   { bg = "#ffffff" })
set("EndOfBuffer",  { fg = "#ffffff", bg = "#ffffff" })
set("CursorLine",   { bg = "#ededed" })
set("CursorLineNr", { fg = "#1a1a1a", bold = true })
set("LineNr",       { fg = "#909090" })
set("Pmenu",        { fg = "#1a1a1a", bg = "#f2f2f2" })
set("PmenuSel",     { fg = "#ffffff", bg = "#1a1a1a" })
set("Visual",       { bg = "#d8d8d8" })
set("Search",       { fg = "#ffffff", bg = "#4a4a4a" })
set("IncSearch",    { fg = "#ffffff", bg = "#000000", bold = true })
set("MatchParen",   { fg = "#000000", bold = true, underline = true })
set("StatusLine",   { fg = "#1a1a1a", bg = "#ededed" })
set("StatusLineNC", { fg = "#909090", bg = "#ededed" })
set("VertSplit",    { fg = "#c0c0c0", bg = "#ffffff" })
set("WinSeparator", { fg = "#c0c0c0", bg = "#ffffff" })
set("Folded",       { fg = "#6b6b6b", bg = "#f2f2f2", italic = true })
set("FoldColumn",   { fg = "#a0a0a0", bg = "#ffffff" })
set("NonText",      { fg = "#c0c0c0" })
set("Whitespace",   { fg = "#d8d8d8" })
set("SpecialKey",   { fg = "#a0a0a0" })
set("Directory",    { fg = "#000000", bold = true })
set("ErrorMsg",     { fg = "#000000", bold = true, underline = true })
set("WarningMsg",   { fg = "#2b2b2b", bold = true })
set("MoreMsg",      { fg = "#000000", bold = true })
set("Question",     { fg = "#000000", bold = true })
set("DiffAdd",      { bg = "#e8f4e8" })
set("DiffChange",   { bg = "#f4f4e0" })
set("DiffDelete",   { bg = "#f4e0e0" })
set("DiffText",     { bg = "#e0e0c0" })

-- ---- syntax: monochrome hierarchy (inverted) ----

def({ "Function", "@function", "@function.call", "@function.method",
      "@function.method.call", "@function.builtin", "@function.macro" },
    { fg = "#000000", bold = true })

def({ "Type", "Structure", "@type", "@type.builtin", "@type.definition",
      "@type.qualifier", "@constructor" },
    { fg = "#000000", italic = true })

def({ "Constant", "Number", "Float", "Boolean", "@constant", "@constant.builtin",
      "@number", "@number.float", "@boolean" },
    { fg = "#000000", bold = true, italic = true })

def({ "Identifier", "@variable" },
    { fg = "#2b2b2b" })
set("@variable.builtin",   { fg = "#2b2b2b", italic = true })
set("@variable.parameter", { fg = "#4f4f4f" })

def({ "@variable.member", "@property", "@field" },
    { fg = "#6b6b6b" })

def({ "Statement", "Keyword", "Conditional", "Repeat", "Label", "Exception",
      "PreProc", "Include", "Define", "Macro", "@keyword", "@keyword.function",
      "@keyword.return", "@keyword.import", "@keyword.operator",
      "@keyword.conditional", "@keyword.repeat", "@keyword.exception",
      "@keyword.directive", "@keyword.storage" },
    { fg = "#5a5a5a", bold = true })

def({ "String", "Character", "@string", "@string.escape", "@character" },
    { fg = "#4a4a4a", italic = true })

def({ "@module", "@namespace" },
    { fg = "#6b6b6b", italic = true })

def({ "Operator", "Delimiter", "@operator", "@punctuation.delimiter",
      "@punctuation.bracket" },
    { fg = "#7a7a7a" })

def({ "Comment", "@comment" },
    { fg = "#808080", italic = true })

-- ---- extra captures / legacy names ----

def({ "@method", "@method.call" },
    { fg = "#000000", bold = true })
def({ "Typedef", "@tag", "@tag.builtin" },
    { fg = "#000000", italic = true })
def({ "@constant.macro", "@symbol", "@string.special.symbol" },
    { fg = "#000000", bold = true, italic = true })
def({ "@parameter", "@variable.parameter.builtin" },
    { fg = "#4f4f4f" })
def({ "@tag.attribute" },
    { fg = "#6b6b6b" })
def({ "@include", "@conditional", "@repeat", "@exception", "@storageclass",
      "@define", "@macro", "@preproc", "StorageClass", "@keyword.modifier",
      "@keyword.type", "@keyword.coroutine", "@keyword.debug",
      "@keyword.directive.define" },
    { fg = "#5a5a5a", bold = true })

def({ "@attribute", "@attribute.builtin" },
    { fg = "#5a5a5a", italic = true })

set("@label", { fg = "#4f4f4f", italic = true })

def({ "@string.regexp", "@string.special", "@string.escape", "@string.documentation",
      "SpecialChar", "@character.special" },
    { fg = "#4a4a4a", italic = true })
def({ "@string.special.url", "@string.special.path", "@markup.link.url" },
    { fg = "#4a4a4a", underline = true })

set("Special",    { fg = "#3a3a3a" })
set("Underlined", { fg = "#2b2b2b", underline = true })
set("Title",      { fg = "#000000", bold = true })

def({ "@punctuation", "@punctuation.special", "@tag.delimiter" },
    { fg = "#7a7a7a" })
set("@comment.documentation", { fg = "#757575", italic = true })
def({ "Todo", "@comment.todo", "@comment.note", "@comment.warning", "@comment.error" },
    { fg = "#000000", bold = true })

-- markdown / markup
def({ "@markup.heading", "@markup.heading.1", "@markup.heading.2",
      "@markup.heading.3", "@markup.heading.4", "@markup.heading.5",
      "@markup.heading.6" },
    { fg = "#000000", bold = true })
set("@markup.strong",        { fg = "#000000", bold = true })
set("@markup.italic",        { fg = "#2b2b2b", italic = true })
set("@markup.strikethrough", { fg = "#6b6b6b", strikethrough = true })
set("@markup.underline",     { fg = "#2b2b2b", underline = true })
def({ "@markup.link", "@markup.link.label" },
    { fg = "#2b2b2b", underline = true })
def({ "@markup.raw", "@markup.raw.block" },
    { fg = "#4f4f4f" })
set("@markup.list",          { fg = "#6b6b6b" })
set("@markup.quote",         { fg = "#6b6b6b", italic = true })

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
set("NeoTreeNormal",   { bg = "#ffffff" })
set("NeoTreeNormalNC", { bg = "#ffffff" })

-- noice.nvim
set("NoiceCmdlinePopup",            { fg = "#1a1a1a", bg = "#ffffff" })
set("NoiceCmdlinePopupBorder",      { fg = "#a0a0a0", bg = "#ffffff" })
set("NoiceCmdlinePopupTitle",       { fg = "#000000", bg = "#ffffff", bold = true })
set("NoiceCmdlineIcon",             { fg = "#2b2b2b" })
set("NoiceCmdlineIconSearch",       { fg = "#2b2b2b" })
set("NoiceCmdlinePrompt",           { fg = "#1a1a1a", bold = true })
set("NoiceConfirm",                 { fg = "#1a1a1a", bg = "#ffffff" })
set("NoiceConfirmBorder",           { fg = "#a0a0a0", bg = "#ffffff" })
set("NoicePopup",                   { fg = "#1a1a1a", bg = "#ffffff" })
set("NoicePopupBorder",             { fg = "#a0a0a0", bg = "#ffffff" })
set("NoiceSplit",                   { fg = "#1a1a1a", bg = "#ffffff" })
set("NoiceSplitBorder",             { fg = "#a0a0a0", bg = "#ffffff" })
set("NoiceMini",                    { fg = "#1a1a1a", bg = "#ffffff" })
set("NoiceVirtualText",             { fg = "#6b6b6b" })
set("NoiceLspProgressClient",       { fg = "#000000", bold = true })
set("NoiceLspProgressSpinner",      { fg = "#2b2b2b" })
set("NoiceLspProgressTitle",        { fg = "#4f4f4f" })
set("NoiceFormatProgressDone",      { fg = "#000000", bg = "#ffffff", bold = true })
set("NoiceFormatProgressTodo",      { fg = "#909090", bg = "#ffffff" })
