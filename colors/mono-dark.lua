vim.o.background = "dark"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "mono-dark"

local set = function(name, opts)
	vim.api.nvim_set_hl(0, name, opts)
end
local def = function(groups, opts)
	for _, g in ipairs(groups) do
		set(g, opts)
	end
end

-- ---- UI ----
set("Normal", { fg = "#e9dfd2", bg = "#0B0908" })
set("NormalNC", { fg = "#e9dfd2", bg = "#0B0908" })
set("NormalFloat", { fg = "#e9dfd2", bg = "#0B0908" })
set("FloatBorder", { fg = "#70645b", bg = "#0B0908" })
set("SignColumn", { bg = "#0B0908" })
set("EndOfBuffer", { fg = "#0B0908", bg = "#0B0908" })
set("CursorLine", { bg = "#211c18" })
set("CursorLineNr", { fg = "#e9dfd2", bold = true })
set("LineNr", { fg = "#82766c" })
set("Pmenu", { fg = "#e9dfd2", bg = "#1c1815" })
set("PmenuSel", { fg = "#0B0908", bg = "#e9dfd2" })
set("Visual", { bg = "#39312b" })
set("Search", { fg = "#0B0908", bg = "#ded2c3" })
set("IncSearch", { fg = "#0B0908", bg = "#f2e8da", bold = true })
set("MatchParen", { fg = "#f2e8da", bold = true, underline = true })
set("StatusLine", { fg = "#e9dfd2", bg = "#211c18" })
set("StatusLineNC", { fg = "#82766c", bg = "#211c18" })
set("VertSplit", { fg = "#494039", bg = "#0B0908" })
set("WinSeparator", { fg = "#494039", bg = "#0B0908" })
set("Folded", { fg = "#a99a8c", bg = "#1c1815", italic = true })
set("FoldColumn", { fg = "#70645b", bg = "#0B0908" })
set("NonText", { fg = "#494039" })
set("Whitespace", { fg = "#39312b" })
set("SpecialKey", { fg = "#70645b" })
set("Directory", { fg = "#f2e8da", bold = true })
set("ErrorMsg", { fg = "#f2e8da", bold = true, underline = true })
set("WarningMsg", { fg = "#ded2c3", bold = true })
set("MoreMsg", { fg = "#f2e8da", bold = true })
set("Question", { fg = "#f2e8da", bold = true })
set("DiffAdd", { bg = "#1b251b" })
set("DiffChange", { bg = "#292519" })
set("DiffDelete", { bg = "#2b1c1b" })
set("DiffText", { bg = "#393122" })

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
--   comments             green, ITALIC

def({
	"Function",
	"@function",
	"@function.call",
	"@function.method",
	"@function.method.call",
	"@function.builtin",
	"@function.macro",
}, { fg = "#f2e8da", bold = true })

def(
	{ "Type", "Structure", "@type", "@type.builtin", "@type.definition", "@type.qualifier", "@constructor" },
	{ fg = "#f2e8da", italic = true }
)

def({
	"Constant",
	"Number",
	"Float",
	"Boolean",
	"@constant",
	"@constant.builtin",
	"@number",
	"@number.float",
	"@boolean",
}, { fg = "#f2e8da", bold = true, italic = true })

def({ "Identifier", "@variable" }, { fg = "#ded2c3" })
set("@variable.builtin", { fg = "#ded2c3", italic = true })
set("@variable.parameter", { fg = "#c5b7a8" })

def({ "@variable.member", "@property", "@field" }, { fg = "#a99a8c" })

def({
	"Statement",
	"Keyword",
	"Conditional",
	"Repeat",
	"Label",
	"Exception",
	"PreProc",
	"Include",
	"Define",
	"Macro",
	"@keyword",
	"@keyword.function",
	"@keyword.return",
	"@keyword.import",
	"@keyword.operator",
	"@keyword.conditional",
	"@keyword.repeat",
	"@keyword.exception",
	"@keyword.directive",
	"@keyword.storage",
}, { fg = "#b8a99a", bold = true })

def({ "String", "Character", "@string", "@string.escape", "@character" }, { fg = "#cdbfb0", italic = true })

def({ "@module", "@namespace" }, { fg = "#a99a8c", italic = true })

def({ "Operator", "Delimiter", "@operator", "@punctuation.delimiter", "@punctuation.bracket" }, { fg = "#82766c" })

def({ "Comment", "@comment" }, { fg = "#7EAA82", italic = true })

-- ---- extra captures / legacy names ----

def({ "@method", "@method.call" }, { fg = "#f2e8da", bold = true })
def({ "Typedef", "@tag", "@tag.builtin" }, { fg = "#f2e8da", italic = true })
def({ "@constant.macro", "@symbol", "@string.special.symbol" }, { fg = "#f2e8da", bold = true, italic = true })
def({ "@parameter", "@variable.parameter.builtin" }, { fg = "#c5b7a8" })
def({ "@tag.attribute" }, { fg = "#a99a8c" })
def({
	"@include",
	"@conditional",
	"@repeat",
	"@exception",
	"@storageclass",
	"@define",
	"@macro",
	"@preproc",
	"StorageClass",
	"@keyword.modifier",
	"@keyword.type",
	"@keyword.coroutine",
	"@keyword.debug",
	"@keyword.directive.define",
}, { fg = "#b8a99a", bold = true })

def({ "@attribute", "@attribute.builtin" }, { fg = "#b8a99a", italic = true })

set("@label", { fg = "#c5b7a8", italic = true })

def({
	"@string.regexp",
	"@string.special",
	"@string.escape",
	"@string.documentation",
	"SpecialChar",
	"@character.special",
}, { fg = "#cdbfb0", italic = true })
def({ "@string.special.url", "@string.special.path", "@markup.link.url" }, { fg = "#cdbfb0", underline = true })

set("Special", { fg = "#e0d4c5" })
set("Underlined", { fg = "#ded2c3", underline = true })
set("Title", { fg = "#f2e8da", bold = true })

def({ "@punctuation", "@punctuation.special", "@tag.delimiter" }, { fg = "#82766c" })
set("@comment.documentation", { fg = "#7EAA82", italic = true })
def({ "Todo", "@comment.todo", "@comment.note", "@comment.warning", "@comment.error" }, { fg = "#f2e8da", bold = true })

-- markdown / markup
def({
	"@markup.heading",
	"@markup.heading.1",
	"@markup.heading.2",
	"@markup.heading.3",
	"@markup.heading.4",
	"@markup.heading.5",
	"@markup.heading.6",
}, { fg = "#f2e8da", bold = true })
set("@markup.strong", { fg = "#f2e8da", bold = true })
set("@markup.italic", { fg = "#ded2c3", italic = true })
set("@markup.strikethrough", { fg = "#a99a8c", strikethrough = true })
set("@markup.underline", { fg = "#ded2c3", underline = true })
def({ "@markup.link", "@markup.link.label" }, { fg = "#ded2c3", underline = true })
def({ "@markup.raw", "@markup.raw.block" }, { fg = "#c5b7a8" })
set("@markup.list", { fg = "#a99a8c" })
set("@markup.quote", { fg = "#a99a8c", italic = true })

-- LSP semantic tokens
local links = {
	["@lsp.type.function"] = "@function",
	["@lsp.type.method"] = "@function.method",
	["@lsp.type.macro"] = "@constant.macro",
	["@lsp.type.class"] = "@type",
	["@lsp.type.struct"] = "@type",
	["@lsp.type.enum"] = "@type",
	["@lsp.type.interface"] = "@type",
	["@lsp.type.type"] = "@type",
	["@lsp.type.typeParameter"] = "@type",
	["@lsp.type.variable"] = "@variable",
	["@lsp.type.parameter"] = "@variable.parameter",
	["@lsp.type.property"] = "@variable.member",
	["@lsp.type.enumMember"] = "@constant",
	["@lsp.type.namespace"] = "@module",

	["@lsp.type.field"] = "@variable.member",
	["@lsp.type.member"] = "@function.method",
	["@lsp.type.module"] = "@module",
	["@lsp.type.decorator"] = "@attribute",
	["@lsp.type.derive"] = "@attribute",
	["@lsp.type.builtinAttribute"] = "@attribute",
	["@lsp.type.deriveHelper"] = "@attribute",
	["@lsp.type.lifetime"] = "@label",
	["@lsp.type.builtinType"] = "@type.builtin",
	["@lsp.type.selfKeyword"] = "@variable.builtin",
	["@lsp.type.selfTypeKeyword"] = "@type.builtin",
	["@lsp.type.typeAlias"] = "@type",
	["@lsp.type.union"] = "@type",
	["@lsp.type.generic"] = "@type",
	["@lsp.type.delegate"] = "@type",
	["@lsp.type.record"] = "@type",
	["@lsp.type.recordStruct"] = "@type",
	["@lsp.type.event"] = "@type",
	["@lsp.type.concept"] = "@type",
	["@lsp.type.keyword"] = "@keyword",
	["@lsp.type.modifier"] = "@keyword",
	["@lsp.type.boolean"] = "@boolean",
	["@lsp.type.number"] = "@number",
	["@lsp.type.string"] = "@string",
	["@lsp.type.comment"] = "@comment",
	["@lsp.type.operator"] = "@operator",
	["@lsp.type.regexp"] = "@string.regexp",
	["@lsp.type.formatSpecifier"] = "@string.escape",
	["@lsp.type.escapeSequence"] = "@string.escape",
	["@lsp.type.punctuation"] = "@punctuation.delimiter",
	["@lsp.type.bracket"] = "@punctuation.bracket",
	["@lsp.type.unresolvedReference"] = "@variable",
}
for from, to in pairs(links) do
	set(from, { link = to })
end

-- file tree
set("NeoTreeNormal", { bg = "#0B0908" })
set("NeoTreeNormalNC", { bg = "#0B0908" })

-- noice.nvim
set("NoiceCmdlinePopup", { fg = "#e9dfd2", bg = "#0B0908" })
set("NoiceCmdlinePopupBorder", { fg = "#70645b", bg = "#0B0908" })
set("NoiceCmdlinePopupTitle", { fg = "#f2e8da", bg = "#0B0908", bold = true })
set("NoiceCmdlineIcon", { fg = "#ded2c3" })
set("NoiceCmdlineIconSearch", { fg = "#ded2c3" })
set("NoiceCmdlinePrompt", { fg = "#e9dfd2", bold = true })
set("NoiceConfirm", { fg = "#e9dfd2", bg = "#0B0908" })
set("NoiceConfirmBorder", { fg = "#70645b", bg = "#0B0908" })
set("NoicePopup", { fg = "#e9dfd2", bg = "#0B0908" })
set("NoicePopupBorder", { fg = "#70645b", bg = "#0B0908" })
set("NoiceSplit", { fg = "#e9dfd2", bg = "#0B0908" })
set("NoiceSplitBorder", { fg = "#70645b", bg = "#0B0908" })
set("NoiceMini", { fg = "#e9dfd2", bg = "#0B0908" })
set("NoiceVirtualText", { fg = "#a99a8c" })
set("NoiceLspProgressClient", { fg = "#f2e8da", bold = true })
set("NoiceLspProgressSpinner", { fg = "#ded2c3" })
set("NoiceLspProgressTitle", { fg = "#c5b7a8" })
set("NoiceFormatProgressDone", { fg = "#f2e8da", bg = "#0B0908", bold = true })
set("NoiceFormatProgressTodo", { fg = "#82766c", bg = "#0B0908" })
