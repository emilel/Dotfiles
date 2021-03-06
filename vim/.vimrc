call plug#begin()
Plug 'jeetsukumaran/vim-indentwise'
Plug 'kdheepak/JuliaFormatter.vim'
Plug 'williamboman/nvim-lsp-installer'
" Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'justinmk/vim-dirvish'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'ixru/nvim-markdown'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'dahu/vim-fanfingtastic'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mbbill/undotree'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'Yggdroot/indentLine'
Plug 'psf/black'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-repeat'
Plug 'junegunn/goyo.vim'
Plug 'mcchrish/nnn.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tweekmonster/startuptime.vim'
Plug 'tmhedberg/SimpylFold'
if has('nvim')
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
end
call plug#end()


" --- MISC ---

" never conceal
set conceallevel=1

" map leader to Space
let mapleader=" "

" update time
set updatetime=100

" dont search in closed folds
set foldopen-=search

" fold according to treesitter
" if has ('nvim')
"     set foldmethod=expr
"     set foldexpr=nvim_treesitter#foldexpr()
" else
"     set foldmethod=indent
" endif

" default to no folding
set foldlevel=99

" allow folding for markdown
let g:markdown_folding = 1

" no escape delay
set timeoutlen=1000 ttimeoutlen=0

" text width
set textwidth=79

" switch buffer without saving
set hidden

" relative number
set relativenumber

" cursor line
set cursorline

" show extra rows below when scrolling
set scrolloff=8

" horizontal scroll instead of word wrap
set nowrap

" scroll horizontally one character at a time
set sidescroll=5

" no swap files
set noswapfile

" case insensitive search
set ic

" no caps - ignore case. one+ cap - case sensitive search
set smartcase

" search immediately searches
set incsearch

" highlight all search pattern matches
" set hlsearch

" dont highlight all search pattern matches
set nohlsearch

" ignore case when autocompleting filenames and directories
set wildignorecase

" allow mouse usage
set mouse=a

" use global clipboard
set clipboard=unnamedplus

" don't clear clipboard when quitting
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" show row number
set number

" autocomplete
set wildmenu
set wildmode=longest,list,full

" x does not copy letter
nnoremap x "_x

" but do copy on X
nnoremap X x

" line at text width
set colorcolumn=80

" one space after periods
set nojoinspaces

" persistent undo
if has("persistent_undo")
   let target_path = expand('~/.vim/undo')

    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" split directions
set splitright
set splitbelow

" don't know
set path+=**

" ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" dont screw things up
nnoremap <PageUp> :echo 'hoppsan...'<CR>
nnoremap <PageDown> :echo 'hoppsan...'<CR>
inoremap <PageUp> <Esc>:echo 'hoppsan...'<CR>a
inoremap <PageDown> <Esc>:echo 'hoppsan...'<CR>a

" exit insert mode in terminal
tnoremap <esc> <c-\><c-n>


" --- MAPPINGS ---

" add to jumplist
nnoremap ' m'

" perl regex damn it
nnoremap / /\v

" disable arrow keys
nnoremap <Left> :echo "no left for you!"<CR>
vnoremap <Left> :<C-u>echo "no left for you!"<CR>
inoremap <Left> <C-o>:echo "no left for you!"<CR>
nnoremap <Right> :echo "no right for you!"<CR>
nnoremap <Right> :echo "no right for you!"<CR>
vnoremap <Right> :<C-u>echo "no right for you!"<CR>
inoremap <Up> <C-o>:echo "no up for you!"<CR>
vnoremap <Up> :<C-u>echo "no up for you!"<CR>
inoremap <Up> <C-o>:echo "no up for you!"<CR>
nnoremap <Down> :echo "no down for you!"<CR>
vnoremap <Down> :<C-u>echo "no down for you!"<CR>
inoremap <Down> <C-o>:echo "no down for you!"<CR>
nnoremap <PageUp> :echo "no pageup for you!"<CR>
vnoremap <PageUp> :<C-u>echo "no pageup for you!"<CR>
inoremap <PageUp> <C-o>:echo "no pageup for you!"<CR>
nnoremap <PageDown> :echo "no pagedown for you!"<CR>
vnoremap <PageDown> :<C-u>echo "no pagedown for you!"<CR>
inoremap <PageDown> <C-o>:echo "no pagedown for you!"<CR>

" paste line above or below as comment
nmap gcP muPgpgc`u
nmap gcp mupgpgc`u

" remove line below or above
vnoremap <leader>j <esc>j"_ddgv
vnoremap <leader>k <esc>k"_ddgv

vnoremap <c-f> "hy:e <C-R>h

" camel snake to camel
command! Camel :1,$s/_\([a-z]\)/\u\1/gc


" center while typing
inoremap <c-x>z <esc>zza

" clear quickfix list
command! ClearQuickfixList cexpr []
nnoremap <leader>Q <cmd>ClearQuickfixList<cr>

" custom go-to-insert mappings
nnoremap gig `]
nnoremap gii `]i
nnoremap gia `]a
nnoremap giv `[v`]
nnoremap giu `[v`]~

" copy path
command! Path let @+ = fnamemodify(expand("%"), ":~:.")
command! FPath let @+ = expand('%:p')
nmap <silent> <leader>yy :Path<cr>
nmap <silent> <leader>YY :FPath<cr>

" copy git branch
command! Branch let @+ = system("git rev-parse --abbrev-ref HEAD | perl -pe 'chomp if eof'")

" run julia stuff
nmap <silent> <leader>rj :let @+ = 'include("' . expand('%:p') . '")'<cr>

" inline paste normal
nnoremap <leader>p a<cr><esc>P`[v`]:'<,'>.!perl -pe "s/^\s*(.*?)\s*$/\1/"<cr>

" inline paste visual
vnoremap <leader>p p`[v`]:'<,'>.!perl -pe "s/^\s*(.*?)\s*$/\1/"<cr>

" inline paste without copying
vnoremap <leader>P "_di<cr><esc>P`[v`]:'<,'>.!perl -pe "s/^\s*(.*?)\s*$/\1/"<cr>

" escape from visual leads to end
" vnoremap <esc> <esc>`>

" y from visual leads to end
vmap y ygv<Esc>

" select pasted text
nnoremap gp `[v`]

" find word in dictionary
imap <c-n> <plug>(fzf-complete-word)

" complete file
inoremap <expr> <c-a> fzf#vim#complete("fd <Bar> xargs realpath --relative-to " . expand("%:h"))

" complete line
imap <c-l> <plug>(fzf-complete-line)

" " toggle hlsearch
" let hlstate=0
" nnoremap <silent> <leader>/ :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" search for visually selected word in file
vnoremap / "hy/\V<C-R>=escape(@h,'/\')<CR><CR>

" show normal mode mappings
nmap <leader><tab> <plug>(fzf-maps-n)

" substitute visually selected word globally
vnoremap <leader>s "hy:g~<C-r>h~s///gc<left><left><left>

" substitute visually selected word on one line
vnoremap s "hy:.,.g~<C-r>h~s///g<left><left>

" substitute in visual selection
vnoremap <leader>S :s//g<left><left>

" go to last change
nnoremap g. `.

" go to end of line
vnoremap L $h

" go to beginning of line
vnoremap H 0

" toggle fold
nnoremap <silent> <CR> za

" record macro in visual
vnoremap <silent> q <esc>qqgv

" toggle fold all
nnoremap <expr> <Backspace> &foldlevel ? 'zM' :'zR'

" switch file
" nnoremap <C-G> :ls<CR>:b<Space>

" reload .vimrc
noremap <F1> :source ~/.vimrc<CR>

" window movement
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" close window
nnoremap <silent> <leader>c :q<CR>

" find placeholder
nnoremap <leader><leader> /(--)<cr>va)

" close
nnoremap <leader>x :qa<cr>

" new line above or below
nnoremap <silent> <leader>O muO<esc>`u
nnoremap <silent> <leader>o muo<esc>`u

" paste without copying
vnoremap P "_dP

" scroll down
map ö <C-e>

" scroll up
map ä <C-y>

" scroll to the right
map Ö zl

" scroll to the left
map Ä zh

" delete line without coyping
" nnoremap dD "_dd

" start error

" delete without copying
nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap <leader>D "_D

" å is colon
nnoremap å :

" dont yank while pasting to replace
" xnoremap <expr> P '"_d"'.v:register.'P'

" insert latex template
" nnoremap ,latex :read ~/.latex_template.tex<CR>k"_dd17gg

" save file
nnoremap <C-space> :w<CR>
vnoremap <C-space> <esc>:w<CR>

" new tab
nnoremap <leader>T :tabnew<CR>

" navigate quickfix list
nnoremap <silent> <C-j> :cnext<CR>zz
nnoremap <silent> <C-k> :cprev<CR>zz
nnoremap <silent> <leader><C-j> :lnext<CR>zz
nnoremap <silent> <leader><C-k> :lprev<CR>zz

" toggle quickfix list
nnoremap <silent> <C-q> :call ToggleQFList(1)<CR>
nnoremap <silent> <leader>q :call ToggleQFList(0)<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun


" --- REMAPPINGS ---

" make y behave like it should
nnoremap Y y$

" include current character backwards
" nnoremap dF dvF
" nnoremap dT dvT
" nnoremap d0 dv0
" nnoremap d^ dv^
" nnoremap db dvb
" nnoremap dB dvB

" dont jump wildly
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap J mzJ'z

" undo not everything
inoremap <cr> <c-g>u<cr>
" inoremap ( (<c-g>u
" inoremap [ [<c-g>u
" inoremap { {<c-g>u

" move lines
vnoremap <c-j> :m '>+1<CR>gv
vnoremap <c-k> :m '<-2<CR>gv
inoremap <c-j> <esc>:m +1<cr>==i
inoremap <c-k> <esc>:m -2<cr>==i
" nnoremap <leader>j :m .+1<cr>==
" nnoremap <leader>k :m .-2<cr>==

" make line above or below
vnoremap <leader>o <esc>o<esc>gv
vnoremap <leader>O <esc>O<esc>gv

" undo in visual
vnoremap u <esc>ugv
vnoremap <c-r> <esc><c-r>gv

" keep visual selection when indenting
vnoremap < <gv
vnoremap > >gv

vmap <leader>> <esc>i<space><esc>gvlol


" --- VISUAL ---

" use dark theme
set background=dark

" always show gutter
if has ('nvim')
    set signcolumn=yes:1
end

" color thingies
set termguicolors


" --- STATUSLINE ---

" show statusline by default
set laststatus=2

" start with empty statusline
set statusline=

" relative file name
set statusline+=\ %f

" read only flag
set statusline+=%r

" whether the file is modified
set statusline+=%m

" git branch
set statusline+=\ [%{fugitive#head()}]

" switch to right side
set statusline+=%=

" current line number/total lines:column
set statusline+=\ %l/%L:%v

" right padding
set statusline+=\ 


" --- TABS, WHITE SPACE AND INDENTATION ---

" detect filetype, indentation
filetype plugin indent on

" width of existing hard tabs
set tabstop=4

" insert spaces when pressing tab
set expandtab

" how many spaces per shift
set shiftwidth=4

" spaces to insert per tab
set softtabstop=4

" automatically indent code
set autoindent

" show whitespace
set list

" show hard tabs and trailing spaces
set listchars=tab:>-,trail:-

" insert hard tab
" inoremap <S-Tab> <C-V><Tab>


" --- FORMATTING OPTIONS (help fo-table) ---

setl formatoptions=tcrq2jl

" format
nnoremap <leader>, gwap


" --- FILETYPES

augroup fucking_everything_god_damn_it
    autocmd!
    autocmd FileType * set fo-=o
augroup END

augroup zsh_edit_command
    autocmd!
    autocmd FileType zsh setl wrap
    autocmd FileType zsh setl textwidth=0
    autocmd FileType zsh,gitcommit nnoremap <buffer> <CR><CR> :wq<CR>
augroup END

augroup makefiles
    autocmd!
    autocmd FileType makefile setl noexpandtab
augroup END

augroup width
    autocmd!
    autocmd FileType python setl colorcolumn=80
    autocmd FileType julia setl colorcolumn=93
    autocmd FileType julia setl textwidth=92
    autocmd FileType python setl textwidth=79
    autocmd FileType gitcommit setl colorcolumn=73
    autocmd FileType gitcommit setl textwidth=72
    autocmd FileType vim,qf,conf,zsh,tmux setl textwidth=0
    autocmd FileType vim,qf,conf,zsh,tmux setl colorcolumn=0
augroup END

augroup conceal
    autocmd!
    autocmd FileType dockerfile,makefile,markdown,rmd setl conceallevel=0
augroup END

augroup commentstrings
    autocmd!
    autocmd FileType markdown setl commentstring=<!---\ %s\ --->
augroup END

augroup whitespace
    autocmd!
    autocmd InsertLeave * setl list
    autocmd InsertEnter * setl nolist
augroup END

augroup break_undo
    autocmd!
    autocmd FileType text,markdown inoremap <buffer> . .<c-g>u
    autocmd FileType text,markdown inoremap <buffer> , ,<c-g>u
    autocmd FileType text,markdown inoremap <buffer> ! !<c-g>u
    autocmd FileType text,markdown inoremap <buffer> ? ?<c-g>u
augroup END

augroup pythonstuff
    autocmd!
    " print current expression
    autocmd FileType python vnoremap <silent> <buffer> <leader>wp yoprint("<esc>pa: "<esc>A, <esc>pa)<esc>V=V
    " print current expression type
    autocmd FileType python vnoremap <silent> <buffer> <leader>wt yoprint("type(<esc>pa): "<esc>A, type(<esc>pa))<esc>V=V
    " format python file
    autocmd FileType python nnoremap <silent> <buffer> <leader>z :Black<cr>
    " god damn it let it be r
    autocmd FileType python setl formatoptions+=r
augroup end

augroup julia
    autocmd!
    autocmd FileType julia nnoremap <silent> <buffer> <leader>z :JuliaFormatterFormat<cr>
    autocmd FileType julia setl foldmethod=indent
augroup end

augroup textstuff
    autocmd!
    " autocmd FileType text setl formatoptions+=a
augroup end

augroup make_pdf
    autocmd!
    " markdown to pandoc
    autocmd FileType markdown nnoremap <buffer> <leader>b :exec "!pandoc -o $(printf % \| sed 's/.md/.pdf/g') -t pdf %"<cr>
    " commonmark to html
    autocmd FileType markdown nnoremap <buffer> <leader>; :exec "!cat % \| cmark \> $(printf % \| sed 's/.md/.html/g')"<cr>
    " commonmark to pdf
    autocmd FileType markdown nnoremap <buffer> <leader>. :exec "!cat % \| cmark \| pandoc -f html -o $(printf % \| sed 's/.md/.pdf/g')"<cr>
augroup end

augroup make_pdf_damnit
    autocmd!
    autocmd FileType tex nnoremap <buffer> <leader>. :exec "!pdflatex %"<cr>:exec "!bibtex " . expand('%:t:r')<cr>:exec "!pdflatex %"<cr>:exec "!pdflatex %"<cr>
    autocmd FileType tex set conceallevel=0
augroup end


" --- PLUGINS ---

" --- UNDOTREE ---

nnoremap <leader>u :UndotreeToggle<cr>


" --- INDENTLINE ---

"  keep conceallevel
let g:indentLine_setConceal = 0

" indent character
let g:indentLine_char = '▏'

" --- NNN ---

" open file explorer
nnoremap <silent> _ :NnnPicker<CR>

" open file directory in file explorer
nnoremap <silent> - :NnnPicker %:p:h<CR>

" dont use <leader>n as shortcut
let g:nnn#set_default_mappings = 0

" open the picker in a floating window
let g:nnn#layout = { 'window': { 'width': 0.95, 'height': 0.95, 'highlight': 'Debug' } }

" no rollover
let g:nnn#command = 'nnn -R'


" --- FZF ---

" search for files
nnoremap <silent> <leader>a <cmd>Tfiles<cr>

" search for open buffers
nnoremap <silent> <leader>s <cmd>Telescope buffers<cr>

" open diagnostics for project
nnoremap <silent> <leader>dq <cmd>lua vim.diagnostic.setloclist()<cr>

" search for file contents
nnoremap <silent> <leader>/ <cmd>Telescope live_grep<cr>

" search for visually selected word in project
vnoremap <leader>/ "hy:lua require('telescope.builtin').grep_string({ search = <C-r>h })<cr>

" show preview window
let g:fzf_preview_window = 'down:50%'

" completion
" imap <silent> <tab> <Plug>(completion_smart_tab)
" imap <silent> <s-tab> <Plug>(completion_smart_s_tab)

" 'Set completeopt to have a better completion experience'
set completeopt=menu,menuone,noselect
" set completeopt=menuone,noinsert,noselect

" 'Avoid showing message extra message when using completion'
set shortmess+=c


" --- GRUVBOX ---

" contrast when dark
let g:gruvbox_contrast_dark = 'medium'

" contrast when light
let g:gruvbox_contrast_light = 'hard'

" number column
let g:gruvbox_sign_column = 'bg0'

" apply theme
colorscheme gruvbox


" --- SIGNIFY ---

" let g:signify_sign_add = '++'
" let g:signify_sign_delete  = '__'
" let g:signify_sign_delete_first_line = '‾‾'
" let g:signify_sign_change = '~~'
" let g:signify_priority = 1
" let g:signify_disable_by_default = 1
" hi SignifySignDelete guifg=orange

" nnoremap <leader>q :SignifyToggle<CR>


" --- FUGITIVE ---

" status for adding and committing
nnoremap <leader>gs :Ge :<CR>

" push
nnoremap <leader>gp :Git push<CR>

" checkout
nnoremap <leader>gc :Git checkout<space>

nnoremap <leader>ga :Git<space>

" push new branches
command Pushnew !git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
command Tfiles lua require'telescope.builtin'.find_files({ find_command = {'rg', '-S', '--files', '--hidden', '-g', '!.git', '-g', '!__pycache__', '-g', '!*.pyc', '-g', '!*.aux', '-g', '!*.log', '-g', '!*.out', '-g', '!*.pdf', '-g', '!.png'}})

" git giff history
command! DiffHistory call s:view_git_history()

function! s:view_git_history() abort
  Git difftool --name-only ! !^@
  call s:diff_current_quickfix_entry()
  " Bind <CR> for current quickfix window to properly set up diff split layout after selecting an item
  " There's probably a better way to map this without changing the window
  copen
  nnoremap <buffer> <CR> <CR><BAR>:call <sid>diff_current_quickfix_entry()<CR>
  wincmd p
endfunction

function s:diff_current_quickfix_entry() abort
  " Cleanup windows
  for window in getwininfo()
    if window.winnr !=? winnr() && bufname(window.bufnr) =~? '^fugitive:'
      exe 'bdelete' window.bufnr
    endif
  endfor
  cc
  call s:add_mappings()
  let qf = getqflist({'context': 0, 'idx': 0})
  if get(qf, 'idx') && type(get(qf, 'context')) == type({}) && type(get(qf.context, 'items')) == type([])
    let diff = get(qf.context.items[qf.idx - 1], 'diff', [])
    echom string(reverse(range(len(diff))))
    for i in reverse(range(len(diff)))
      exe (i ? 'leftabove' : 'rightbelow') 'vert diffsplit' fnameescape(diff[i].filename)
      call s:add_mappings()
    endfor
  endif
endfunction

function! s:add_mappings() abort
  nnoremap <buffer>]q :cnext <BAR> :call <sid>diff_current_quickfix_entry()<CR>
  nnoremap <buffer>[q :cprevious <BAR> :call <sid>diff_current_quickfix_entry()<CR>

  11copen
  wincmd p
endfunction


" --- GOYO
nnoremap <leader>yo :Goyo<CR>

" --- TREESITTER
if has ('nvim')
lua << EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>v",
      node_incremental = ".",
      scope_incremental = ",",
      node_decremental = "-",
    },
  },
  indent = {
      enable = false
  },
  highlight = {
      enable = true,
              -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
endif


" --- VIMSPECTOR ---

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>f :MaximizerToggle!<CR>
nnoremap <leader>dbu :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nnoremap <leader>dl <Plug>VimspectorStepInto
nnoremap <leader>dj <Plug>VimspectorStepOver
nnoremap <leader>dk <Plug>VimspectorStepOut
nnoremap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nnoremap <leader>drc <Plug>VimspectorRunToCursor
nnoremap <leader>dbp <Plug>VimspectorToggleBreakpoint
nnoremap <leader>dbc <Plug>VimspectorToggleConditionalBreakpoint

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint

fun! GotoWindow()
    call win_gotoid(a:id)
    MaximizerToggle
endfun


" --- LSP ---

nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> gr :lua vim.lsp.buf.references()<cr>
nnoremap <silent> <leader>eh :lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <leader>rn :lua vim.lsp.buf.rename()<cr>
nnoremap <silent> <leader>N :lua vim.diagnostic.goto_prev()<cr>
nnoremap <silent> <leader>n :lua vim.diagnostic.goto_next()<cr>
nnoremap <silent> <leader>el :lua vim.lsp.diagnostic.set_loclist()<cr>
nnoremap <silent> <leader>K :lua vim.diagnostic.open_float()<cr>
nnoremap <silent> <leader>esh :lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> <leader>eca :lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> <leader>ei :lua vim.lsp.buf.implementation()<cr>
vnoremap <leader>ef :lua require('refactoring').refactor('Extract Function')<cr>
vnoremap <leader>eF :lua require('refactoring').refactor('Extract Function To File')<cr>

if has ('nvim')
lua << EOF
-- require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = true }
)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true
    }
)
require('lualine').setup{
    options = {theme = 'gruvbox'},
    icons_enabled = true
}
lualine_c = { require('lsp-status').status }

-- not working. hmm
local refactor = require("refactoring")
refactor.setup()
-- end not working. hmm
-- telescope
local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        layout_strategy = "vertical",
        layout_config = {
          vertical = { width = 0.95 }
        },
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    },
    pickers = {
            live_grep = {
                additional_args = function(opts)
                    return {"--hidden"}
                end
            },
        },
})
require("telescope").load_extension("fzy_native")
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      -- ['<Esc>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      --{ name = 'buffer' },
    }
  })

  -- Setup lspconfig.
  require('lspconfig')['pyright'].setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  require'lspconfig'.julials.setup{}
EOF
endif
