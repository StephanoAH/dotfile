"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Redraw
set lazyredraw

" Higlight matching brackets
set showmatch

" Mapleader
let mapleader="\,"

" True colors in Vim and Tmux
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set incsearch
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" Encoding
set encoding=UTF-8


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Ale disable LSP
let g:ale_disable_lsp = 1
"----------------------------------------------------------
" Plugins
"
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" NERDTree with git plugin and Dev icons
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

" Dracula Theme
"Plug 'dracula/vim', { 'as': 'dracula' }

" Aurora theme
Plug 'rafalbromirski/vim-aurora'

" Startify
Plug 'mhinz/vim-startify'

" Git
Plug 'airblade/vim-gitgutter'

" Nerd Commenter
Plug 'preservim/nerdcommenter'

" Search Ack
Plug 'mileszs/ack.vim'

" Carbon now (Screencapture)
Plug 'kristijanhusak/vim-carbon-now-sh'

"---------------------------
" Syntax
"
" JavaScript support
Plug 'pangloss/vim-javascript'

" TypeScript syntax
Plug 'leafgarland/typescript-vim'

" JS and JSX syntax
Plug 'maxmellon/vim-jsx-pretty'

"-------------------------
" Intelisense
"
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

" Extensions
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-css', 'coc-cssmodules', 'coc-emmet', 'coc-html', 'coc-jedi', 'coc-json', 'coc-phpls', 'coc-sql']

"------------------------
" Linting
"
" Ale
Plug 'dense-analysis/ale'

"-----------------------
" Fixers
"
" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Initialize plugin system
call plug#end()

"----------------------------------------------------------
"Color Scheme
"
"let g:dracula_italic = 0
"colorscheme dracula
set background=dark
colorscheme aurora
"----------------------------------------------------------
" Plugin Config
"----------------------------------------------------------
"
" Startify
"
"----------------------------------------------------------
"
" Center
let g:startify_custom_header =
          \ 'startify#center(startify#fortune#cowsay())'
"----------------------------------------------------------
"
" Prettier
"
"----------------------------------------------------------
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"----------------------------------------------------------
"
" NERDTree
"
"----------------------------------------------------------
" Close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" Cursor line
let NERDTreeHighlightCursorline=0
" GitStatus with nerdFonts icons
let g:NERDTreeGitStatusUseNerdFonts = 1

"----------------------------------------------------------
"
" CoC
"
"----------------------------------------------------------
"
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
  endif

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> cp <Plug>(coc-diagnostic-prev)
nmap <silent> cn <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gtd <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
      autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
         " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

" Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"---------------------------------------------------------
"
" Ale
"
"---------------------------------------------------------

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier', 'eslint'],
\  'typescript': ['prettier', 'eslint'],
\  'jsx': ['prettier', 'eslint'],
\  'python': ['autopep8', 'yapf'],
\  'c++': ['cppcheck', 'clangcheck', 'clangtidy', 'cquery']
\}

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'jsx': ['eslint'],
\  'typescript': ['eslint'],
\  'python': ['flake8', 'pylint']
\}

let b:ale_fix_on_save = 1

"---------------------------------------------------------
"
" Ack
"
"---------------------------------------------------------

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

"---------------------------------------------------------
"
" Carbon now
"
"---------------------------------------------------------
vnoremap <F5> :CarbonNowSh<CR>

let g:carbon_now_sh_options =
\ { 'ln': 'true',
  \ 'fm': 'Source Code Pro' }
"---------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Map <C-b> to open NERDTree
map <C-b> :NERDTreeToggle<CR>

" get rid of [  ] around icons in NerdTree
syntax enable
if exists("g:loaded_webdevicons")
        call webdevicons#refresh()
    endif

"------------------------------------------------------
" External Config
"
" Autoclose
source ~/.vim/config/autoclose.vim
