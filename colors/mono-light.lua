vim.o.background = "light"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "mono-light"

local set = function(name, opts)
	vim.api.nvim_set_hl(0, name, opts)
end
local def = function(groups, opts)
	for _, g in ipairs(groups) do
		set(g, opts)
	end
end

-- ---- UI ----
set("Normal", { fg = "#29231e", bg = "#eee8dd" })
set("NormalNC", { fg = "#29231e", bg = "#eee8dd" })
set("NormalFloat", { fg = "#29231e", bg = "#eee8dd" })
set("FloatBorder", { fg = "#9c9082", bg = "#eee8dd" })
set("SignColumn", { bg = "#eee8dd" })
set("EndOfBuffer", { fg = "#eee8dd", bg = "#eee8dd" })
set("CursorLine", { bg = "#e3dbcf" })
set("CursorLineNr", { fg = "#29231e", bold = true })
set("LineNr", { fg = "#8b7f72" })
set("Pmenu", { fg = "#29231e", bg = "#e7dfd2" })
set("PmenuSel", { fg = "#eee8dd", bg = "#29231e" })
set("Visual", { bg = "#d4c9b9" })
set("Search", { fg = "#eee8dd", bg = "#51463d" })
set("IncSearch", { fg = "#eee8dd", bg = "#211c18", bold = true })
set("MatchParen", { fg = "#211c18", bold = true, underline = true })
set("StatusLine", { fg = "#29231e", bg = "#e3dbcf" })
set("StatusLineNC", { fg = "#8b7f72", bg = "#e3dbcf" })
set("VertSplit", { fg = "#bcb1a2", bg = "#eee8dd" })
set("WinSeparator", { fg = "#bcb1a2", bg = "#eee8dd" })
set("Folded", { fg = "#6c6055", bg = "#e7dfd2", italic = true })
set("FoldColumn", { fg = "#9c9082", bg = "#eee8dd" })
set("NonText", { fg = "#bcb1a2" })
set("Whitespace", { fg = "#d4c9b9" })
set("SpecialKey", { fg = "#9c9082" })
set("Directory", { fg = "#211c18", bold = true })
set("ErrorMsg", { fg = "#211c18", bold = true, underline = true })
set("WarningMsg", { fg = "#342d27", bold = true })
set("MoreMsg", { fg = "#211c18", bold = true })
set("Question", { fg = "#211c18", bold = true })
set("DiffAdd", { bg = "#dfe8d9" })
set("DiffChange", { bg = "#e9e5d1" })
set("DiffDelete", { bg = "#eadbd6" })
set("DiffText", { bg = "#ddd8bd" })

-- ---- syntax: monochrome hierarchy (inverted) ----

def({
	"Function",
	"@function",
	"@function.call",
	"@function.method",
	"@function.method.call",
	"@function.builtin",
	"@function.macro",
}, { fg = "#211c18", bold = true })

def(
	{ "Type", "Structure", "@type", "@type.builtin", "@type.definition", "@type.qualifier", "@constructor" },
	{ fg = "#211c18", italic = true }
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
}, { fg = "#211c18", bold = true, italic = true })

def({ "Identifier", "@variable" }, { fg = "#342d27" })
set("@variable.builtin", { fg = "#342d27", italic = true })
set("@variable.parameter", { fg = "#51483f" })

def({ "@variable.member", "@property", "@field" }, { fg = "#6c6055" })

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
}, { fg = "#62574d", bold = true })

def({ "String", "Character", "@string", "@string.escape", "@character" }, { fg = "#51463d", italic = true })

def({ "@module", "@namespace" }, { fg = "#6c6055", italic = true })

def({ "Operator", "Delimiter", "@operator", "@punctuation.delimiter", "@punctuation.bracket" }, { fg = "#807468" })

def({ "Comment", "@comment" }, { fg = "#477750", italic = true })

-- ---- extra captures / legacy names ----

def({ "@method", "@method.call" }, { fg = "#211c18", bold = true })
def({ "Typedef", "@tag", "@tag.builtin" }, { fg = "#211c18", italic = true })
def({ "@constant.macro", "@symbol", "@string.special.symbol" }, { fg = "#211c18", bold = true, italic = true })
def({ "@parameter", "@variable.parameter.builtin" }, { fg = "#51483f" })
def({ "@tag.attribute" }, { fg = "#6c6055" })
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
}, { fg = "#62574d", bold = true })

def({ "@attribute", "@attribute.builtin" }, { fg = "#62574d", italic = true })

set("@label", { fg = "#51483f", italic = true })

def({
	"@string.regexp",
	"@string.special",
	"@string.escape",
	"@string.documentation",
	"SpecialChar",
	"@character.special",
}, { fg = "#51463d", italic = true })
def({ "@string.special.url", "@string.special.path", "@markup.link.url" }, { fg = "#51463d", underline = true })

set("Special", { fg = "#40372f" })
set("Underlined", { fg = "#342d27", underline = true })
set("Title", { fg = "#211c18", bold = true })

def({ "@punctuation", "@punctuation.special", "@tag.delimiter" }, { fg = "#807468" })
set("@comment.documentation", { fg = "#477750", italic = true })
def({ "Todo", "@comment.todo", "@comment.note", "@comment.warning", "@comment.error" }, { fg = "#211c18", bold = true })

-- markdown / markup
def({
	"@markup.heading",
	"@markup.heading.1",
	"@markup.heading.2",
	"@markup.heading.3",
	"@markup.heading.4",
	"@markup.heading.5",
	"@markup.heading.6",
}, { fg = "#211c18", bold = true })
set("@markup.strong", { fg = "#211c18", bold = true })
set("@markup.italic", { fg = "#342d27", italic = true })
set("@markup.strikethrough", { fg = "#6c6055", strikethrough = true })
set("@markup.underline", { fg = "#342d27", underline = true })
def({ "@markup.link", "@markup.link.label" }, { fg = "#342d27", underline = true })
def({ "@markup.raw", "@markup.raw.block" }, { fg = "#51483f" })
set("@markup.list", { fg = "#6c6055" })
set("@markup.quote", { fg = "#6c6055", italic = true })

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
set("NeoTreeNormal", { bg = "#eee8dd" })
set("NeoTreeNormalNC", { bg = "#eee8dd" })

-- noice.nvim
set("NoiceCmdlinePopup", { fg = "#29231e", bg = "#eee8dd" })
set("NoiceCmdlinePopupBorder", { fg = "#9c9082", bg = "#eee8dd" })
set("NoiceCmdlinePopupTitle", { fg = "#211c18", bg = "#eee8dd", bold = true })
set("NoiceCmdlineIcon", { fg = "#342d27" })
set("NoiceCmdlineIconSearch", { fg = "#342d27" })
set("NoiceCmdlinePrompt", { fg = "#29231e", bold = true })
set("NoiceConfirm", { fg = "#29231e", bg = "#eee8dd" })
set("NoiceConfirmBorder", { fg = "#9c9082", bg = "#eee8dd" })
set("NoicePopup", { fg = "#29231e", bg = "#eee8dd" })
set("NoicePopupBorder", { fg = "#9c9082", bg = "#eee8dd" })
set("NoiceSplit", { fg = "#29231e", bg = "#eee8dd" })
set("NoiceSplitBorder", { fg = "#9c9082", bg = "#eee8dd" })
set("NoiceMini", { fg = "#29231e", bg = "#eee8dd" })
set("NoiceVirtualText", { fg = "#6c6055" })
set("NoiceLspProgressClient", { fg = "#211c18", bold = true })
set("NoiceLspProgressSpinner", { fg = "#342d27" })
set("NoiceLspProgressTitle", { fg = "#51483f" })
set("NoiceFormatProgressDone", { fg = "#211c18", bg = "#eee8dd", bold = true })
set("NoiceFormatProgressTodo", { fg = "#8b7f72", bg = "#eee8dd" })
