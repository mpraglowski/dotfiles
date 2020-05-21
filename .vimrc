set runtimepath+=~/.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle plugins
" Keep Plugin commands between vundle#begin/end.
"Plugin 'gorkunov/smartgf.vim'

" search in files
Plugin 'mileszs/ack.vim'
" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ack silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ack<SPACE>
" bind K to grep word under cursor
nnoremap K :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>
" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" => Vim grep
let Grep_Skip_Dirs = 'RCS CVS SCCS .git .svn generated app/assets'
set grepprg=ack\ -nH\ --nocolor\ --nogroup

" search in open files
Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map N  <Plug>(incsearch-nohl-N)
map n  <Plug>(incsearch-nohl-n)

"Plugin 'sheerun/vim-polyglot'

Plugin 'dag/vim-fish'
" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-rake'
"Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-eunuch'
"Plugin 'tpope/vim-vinegar'
"Plugin 'tpope/vim-abolish'

Plugin 'tonchis/vim-to-github'
"Plugin 'benmills/vimux'
"Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-scripts/mru.vim'

" tmux integration
Plugin 'zaiste/tmux.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'roxma/vim-tmux-clipboard'

" autocompletion
"Plugin 'valloric/youcompleteme'
" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" tmux-complete
"let g:tmuxcomplete#trigger = ''

Plugin 'scrooloose/nerdtree'

Plugin 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap ; :Buffers<CR>
nmap <C-t> :Tags<CR>
nmap <C-p> :Files<CR>
nmap <C-a> :Ag<CR>

Plugin 'qpkorr/vim-bufkill'
map <C-w> :BD<cr>
"Plugin 'junegunn/vim-easy-align'
"au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

"Plugin 'Raimondi/delimitMate'
"Plugin 'andrewradev/simple_bookmarks.vim'

Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'Base2Tone_MeadowDark',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'percent' ],
      \              [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component_function': {
      \   'mode':     'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! LightLineMode()
  let fname = expand('%:t')
  return  fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 40 ? lightline#mode() : ''
endfunction

function! LightLineModified()
  if &filetype == 'help'
    return ''
  elseif &modified
    return '±'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! LightLineReadonly()
  if &filetype == 'help'
    return ''
  elseif &readonly
    return ''
  else
    return ''
  endif
endfunction

function! LightLineFugitive()
  if exists('*fugitive#head')
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:.') ? expand('%:.') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

Plugin 'w0rp/ale'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '*'
augroup AutoLinter
  autocmd!
  autocmd BufWritePost * call s:linter()
augroup END
function! s:linter()
  ALELint
  call lightline#update()
endfunction

" ale + lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d *', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d !', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction


Plugin 'vim-scripts/mayansmoke'
"Plugin 'tpope/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

"Plugin 'terryma/vim-multiple-cursors'

" Erlang setup
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
let g:erlang_tags_outfile = './.tags'
Plugin 'vim-erlang/vim-erlang-skeletons'
" vim-erlang-skeletons
let g:erl_author="Mirosław Pragłowski"
let g:erl_company="Solutions Factory"
let g:erl_replace_buffer=1
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-dialyzer'
Plugin 'edkolev/erlang-motions.vim'

autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.yaws,*.xrl set expandtab
au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl setf Erlang

" Some other languages
Plugin 'idris-hackers/idris-vim'
Plugin 'dleonard0/pony-vim-syntax'

Plugin 'airblade/vim-gitgutter'
" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

"Plugin 'albfan/vim-timelapse'

" colorschemes
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'edkolev/tmuxline.vim'

"Plugin 'ruanyl/vim-eslint'

Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Don't wrap lines
set nowrap

" Show line numbers
set number

" Highlight current line
set cursorline

" Save to system clipboard by default
set clipboard=unnamed,unnamedplus

" Choose no compatibility with legacy vi
set nocompatible

" Trailing whitespaces (show & remove on save)
set list
set listchars=tab:▸\ ,trail:·
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
if !has('nvim')
  set term=xterm-256color
endif
set t_Co=256
set t_ut=

" Set colorscheme
set termguicolors
set background=dark
colorscheme Base2Tone_MeadowDark

function! SetBackgroundMode()
  let s:mode = systemlist("defaults read -g AppleInterfaceStyle")[0]
  if s:mode ==? "dark"
    set background=dark
  else
    set background=light
  endif
endfunction

" call SetBackgroundMode()


" 80 columns limit
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80"

" Force the cursor onto a new line after 80 characters
set textwidth=80
" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the 81st (or 73rd) column so that we don’t type over our limit
"set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" Vim ColorToggle
"map <Leader>b :ToggleBg<CR>

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,mac,dos

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>
augroup reload_vimrc
  autocmd!
  autocmd! bufwritepost ~/.vimrc nested source ~/.vimrc
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File type specific settings
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType css setl ofu=csscomplete#CompleteCSS
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

" markdown
augroup markdown
    au! BufRead,BufNewFile *.mkd   setfiletype mkd
    au! BufRead,BufNewFile *.markdown   setfiletype mkd
augroup END

" haml
autocmd BufNewFile,BufRead *.haml setf haml
autocmd BufNewFile,BufRead *.sass setf sass
autocmd BufNewFile,BufRead *.scss setf scss

" => MRU plugin
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

" => ZenCoding
" Enable all functions in all modes
let g:user_zen_mode='a'

" => snipMate (beside <TAB> support <CTRL-j>)
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

" => Nerd Tree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" => vim-multiple-cursors
let g:multi_cursor_next_key="\<C-s>"

" => Vimroom
let g:goyo_width=120
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>, :Goyo<cr>

" => vim-to-github
let g:to_github_clip_command = 'pbcopy'
let g:to_github_clipboard = 1
map <Leader>gh :ToGithub<CR>

" Run RSpec in tmux
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Activate snipmate
"ActivateAddons vim-snippets snipmate

" linters
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" javascript
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

" Debugging helpers
autocmd BufEnter *.rb iabbr pry require 'pry';binding.pry
autocmd BufEnter *.rb iabbr bye require 'byebug';debugger
