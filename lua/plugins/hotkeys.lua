local content = [=[
# HOTKEYS   (leader = <Space>)    q / Esc = close    / = search

## YOUR CUSTOM KEYMAPS

### Files / navigation
  <C-p>            Telescope: find files
  <leader>/        Telescope: live grep
  <leader><leader> Telescope: recent files
  <C-z>        Neo-tree: open sidebar, reveal file
  <leader>E        Neo-tree: buffer list (float)
  <leader>-        Oil: file manager float
  <leader>o        Outline: toggle / focus symbols
  <leader>?        This cheat sheet

### Buffers (barbar)
  <A-1> ... <A-9>  Go to buffer 1-9
  <A-,>            Previous buffer
  <A-.>            Next buffer

### Harpoon
  <leader>ha       Mark current file
  <leader>hh       Open marks menu
  <leader>hn       Next mark
  <leader>hp       Previous mark

### Terminal
  <A-t>            Toggle floating terminal

### Theme
  <leader>tt       Cycle colorscheme (gruvbox / mfd-paper / quiet)

### CMake (cmake-tools)
  <leader>g        CMake generate
  <leader>b        CMake build
  <leader>d        CMake debug
  <leader>l        Select launch target
  <leader>r        Run launch target (floating terminal)

### Debugging (nvim-dap)
  <F5>             Continue / start
  <F9>             Toggle breakpoint
  <F10>            Step over
  <F11>            Step into
  <F12>            Step out
  <leader>B        Conditional breakpoint
  <leader>u        Toggle debug UI
  <leader>x        Stop debugging

### Completion (nvim-cmp, while menu is open)
  <C-n> / <C-p>    Next / previous item
  <C-d> / <C-u>    Scroll docs down / up
  <CR>             Confirm selection

### Dashboard (alpha) -- press on the start screen
  e New file   f Find file   s Restore session   g Find word
  r Recent     c Plugins     m Mason   l Lazy   u Update plugins   q Quit

## PLUGIN DEFAULTS

### flash.nvim (enabled for / search and f F t T)
  /text            Search, then press the label letter to jump
  f F t T          Char motions with jump labels
  ;  ,             Repeat char motion forward / back

### nvim-surround
  ys{motion}{c}    Add surround         (ysiw" = surround word with ")
  yss{c}           Surround whole line
  ds{c}            Delete surround      (ds")
  cs{old}{new}     Change surround      (cs"')
  S{c}  (visual)   Surround selection

### numb.nvim
  :42              Peeks at line 42 while typing, Enter to go, Esc to cancel

### Telescope (inside the picker)
  <C-n> <C-p>      Move down / up           <Down> <Up> also work
  <CR>             Open                     <C-x> split  <C-v> vsplit  <C-t> tab
  <C-u> <C-d>      Scroll preview
  <Esc> <C-c>      Close  (<Esc> in insert mode goes to normal mode)
  <C-q>            Send results to quickfix

### Neo-tree (inside the tree)
  <CR>             Open / toggle folder
  a                New file / folder (end name with /)
  d                Delete                   r  Rename
  c                Copy                     m  Move       x  Cut    p  Paste
  H                Toggle hidden files      R  Refresh
  P                Preview                  S  Open in split   s  vsplit
  <BS>             Go up a directory
  ?                Show all Neo-tree keys   q  Close

### Oil (inside the buffer)
  <CR>             Open entry               -   Parent directory
  _                Open cwd                 g.  Toggle hidden
  g?               Show help                `   cd to dir
  Edit text to rename / delete / create entries, then :w to apply

### Outline (inside the window)
  <CR>             Go to symbol             o   Peek symbol
  K                Hover info               q   Close
  ?                Show help

### Harpoon menu
  <CR>             Open file                dd  Remove entry
  q / <Esc>        Close menu               (reorder lines with dd + p)

### nvim-dap-ui (inside a UI window)
  <CR> / o         Expand / edit            d   Remove watch / breakpoint
  e                Eval expression          r   Open REPL

### Gitsigns (no keymaps set; use commands)
  :Gitsigns preview_hunk    :Gitsigns blame_line    :Gitsigns reset_hunk
  :Gitsigns next_hunk       :Gitsigns prev_hunk     :Gitsigns stage_hunk

### Commands worth knowing
  :Lazy  :Mason  :Neotree  :Outline  :Telescope  :Noice  :Hotkeys
  :CMakeGenerate  :CMakeBuild  :CMakeDebug  :CMakeSelectBuildTarget
  :RustLsp runnables  :RustLsp debuggables  :RustLsp expandMacro

## NEOVIM LSP DEFAULTS (0.11+)
  K                Hover docs
  grn              Rename symbol
  gra              Code action              (normal / visual)
  grr              References               gri  Implementation
  grt              Type definition          gO   Document symbols
  <C-]>            Go to definition         <C-t>  Jump back (tag stack)
  <C-s>  (insert)  Signature help
  [d  ]d           Previous / next diagnostic
  <C-w>d           Show diagnostic in float
  [q  ]q           Quickfix previous / next

## NATIVE NEOVIM

### Modes
  i a I A          Insert before / after cursor / line start / line end
  o O              New line below / above
  v V <C-v>        Visual char / line / block
  R                Replace mode
  <Esc>  <C-[>     Back to normal mode
  :                Command line            q:  Command history window

### Movement
  h j k l          Left / down / up / right
  w W              Next word / WORD         b B  Previous word    e E  End of word
  ge               End of previous word
  0  ^  $          Line start / first char / end
  gg  G  {n}G      File start / end / line n
  {  }             Previous / next paragraph
  ( )              Previous / next sentence
  %                Jump to matching bracket
  H M L            Top / middle / bottom of screen
  <C-u> <C-d>      Half page up / down
  <C-b> <C-f>      Page up / down
  zt zz zb         Cursor line to top / center / bottom
  <C-e> <C-y>      Scroll one line down / up
  f{c} F{c}        Jump to char on line     t{c} T{c}  Until char
  ; ,              Repeat / reverse f t F T
  gj gk            Move by screen line (wrapped lines)
  gd  gD           Go to local / global definition (text based)
  gf               Open file under cursor
  gx               Open URL under cursor
  <C-o> <C-i>      Jump back / forward in jumplist
  g;  g,           Previous / next change position
  ``  ''           Jump to last position / its line
  *  #             Search word under cursor forward / backward
  gv               Reselect last visual selection

### Editing
  x  X             Delete char under / before cursor
  dd  D            Delete line / to end of line
  d{motion}        Delete        (dw, d$, di", dap, dt;)
  c{motion}        Change        (cw, ci(, cc, C)
  y{motion}  yy    Yank (copy)   (yiw, y$, yap)
  p  P             Paste after / before
  ]p [p            Paste with indent adjusted
  u  <C-r>         Undo / redo              U  Undo line
  .                Repeat last change
  r{c}  s  S       Replace char / substitute char / substitute line
  ~  g~  gU  gu    Toggle case / toggle / uppercase / lowercase (gUiw)
  J  gJ            Join lines (with / without space)
  >>  <<           Indent / dedent line     ==  Auto indent line
  >  <  =  (visual) Indent / dedent / auto indent selection
  <C-a> <C-x>      Increment / decrement number
  gcc  gc{motion}  Toggle comment (0.10+)   gc (visual) comment selection
  g?{motion}       ROT13

### Text objects (use after d c y v)
  iw aw            Word                     iW aW  WORD
  is as            Sentence                 ip ap  Paragraph
  i" a"  i' a'  i` a`   Quotes
  i( a(  i[ a[  i{ a{  i< a<   Brackets (also ib, iB)
  it at            HTML / XML tag

### Search & replace
  /pat  ?pat       Search forward / backward
  n  N             Next / previous match
  :noh             Clear search highlight
  :%s/old/new/g    Replace in whole file    (add c to confirm: /gc)
  :s/old/new/g     Replace in current line
  :'<,'>s/old/new/g  Replace in visual selection
  :g/pat/d         Delete lines matching pat    :v/pat/d  Delete non-matching
  :g/pat/normal @q Run macro on matching lines

### Registers, macros, marks
  "{r}y  "{r}p     Yank / paste using register r    ("ay, "ap)
  "+y  "+p         System clipboard (clipboard=unnamedplus is already set)
  "0p              Paste last yank (unaffected by deletes)
  "_d              Delete without overwriting a register
  :reg             Show registers
  qa ... q         Record macro into register a
  @a  @@           Run macro / repeat last macro   (5@a = 5 times)
  ma  `a  'a       Set mark a / jump to it / jump to its line
  mA               Global mark (works across files)
  :marks           Show marks

### Windows
  <C-w>s  <C-w>v   Split horizontal / vertical      (:sp  :vsp)
  <C-w>h j k l     Move to window left / down / up / right
  <C-w>w  <C-w>p   Next window / previous window
  <C-w>c  <C-w>q   Close window / quit window       <C-w>o  Only this window
  <C-w>=           Equalize sizes                   <C-w>_  <C-w>|  Maximize h / v
  <C-w>+ - < >     Resize                           <C-w>r  Rotate windows
  <C-w>H J K L     Move window to far left / bottom / top / right
  <C-w>T           Move window to a new tab

### Buffers
  :ls              List buffers             :b {n/name}  Go to buffer
  :bn  :bp         Next / previous buffer   :bd  Delete (close) buffer
  <C-^>            Toggle with previous (alternate) buffer
  :e {file}        Edit file                :e!  Reload, discard changes
  :w  :q  :wq  :q!  :wa  :qa   Write / quit / both / force / write all / quit all
  ZZ  ZQ           Save & quit / quit without saving

### Tabs
  :tabnew  :tabc   New tab / close tab
  gt  gT           Next / previous tab      {n}gt  Go to tab n

### Folds
  za zA            Toggle fold (zA recursive)
  zo zc            Open / close fold        zO zC  recursive
  zR zM            Open / close all folds
  zf{motion}       Create fold              zd  Delete fold

### Quickfix & location list
  :copen  :cclose  Open / close quickfix
  :cn  :cp         Next / previous item     :cfirst  :clast
  :lopen  :lnext   Same for location list

### Help
  :help {topic}    Open help                :help index  All default keys
  :Telescope help_tags   Fuzzy search help
  :map             List all mappings        :verbose map {key}  Who set it
  :checkhealth     Diagnose setup
  K (on word)      Open help for word under cursor in vim files

## NOTES
  No custom key overrides a native normal-mode key, and no <leader> key is
  the prefix of another, so there is no pause after any leader key.
  Free native keys kept intact: <C-o> <C-x> <C-c> and -
]=]

local function open_hotkeys()
  local lines = vim.split(content, "\n", { plain = true })

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype = "markdown"

  local width = math.floor(vim.o.columns * 0.85)
  local height = math.floor(vim.o.lines * 0.85)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = "minimal",
    border = "rounded",
    title = " Hotkeys ",
    title_pos = "center",
  })
  vim.wo[win].wrap = false
  vim.wo[win].cursorline = true

  for _, key in ipairs({ "q", "<Esc>" }) do
    vim.keymap.set("n", key, function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end, { buffer = buf, nowait = true, desc = "Close hotkeys" })
  end
end

return {
  dir = vim.fn.stdpath("config"),
  name = "hotkeys-cheatsheet",
  lazy = false,
  config = function()
    vim.api.nvim_create_user_command("Hotkeys", open_hotkeys, {})
    vim.keymap.set("n", "<leader>?", open_hotkeys, { desc = "Show hotkeys cheat sheet" })
  end,
}
