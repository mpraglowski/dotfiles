set runtimepath+=~/.vim
set rtp+=~/.vim/bundle/vim-colors-solarized

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
Plugin 'gorkunov/smartgf.vim'
Plugin 'rking/ag.vim'
Plugin 'sjl/splice.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'skammer/vim-css-color'
Plugin 'chriseppstein/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tonchis/vim-to-github'
Plugin 'benmills/vimux'
Plugin 'endel/vim-github-colorscheme'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-scripts/mru.vim'

" autocompletion
Plugin 'valloric/youcompleteme'

Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

Plugin 'junegunn/vim-easy-align'
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/snipmate-snippets'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'

Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component_function': {
      \   'mode':     'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
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

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

Plugin 'vim-scripts/mayansmoke'
Plugin 'tpope/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

Plugin 'jaxbot/syntastic-react'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_exec = 'eslint_d'

Plugin 'LnL7/vim-nix'
Plugin 'mxw/vim-jsx'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-skeletons'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'jgdavey/tslime.vim'
Plugin 'zaiste/tmux.vim'
Plugin 'saghul/vim-colortoggle'
Plugin 'airblade/vim-gitgutter'
Plugin 'albfan/vim-timelapse'
Plugin 'tpope/vim-dispatch'
Plugin 'wellle/tmux-complete.vim'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'dleonard0/pony-vim-syntax'

" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'edkolev/tmuxline.vim'

Plugin 'ruanyl/vim-eslint'

Plugin 'wikitopian/hardmode'
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

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
let g:colors_name="solarized"
set background=dark
colorscheme solarized

" Vim ColorToggle
map <Leader>. :ToggleBg<CR>

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

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

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

" => Vim grep
let Grep_Skip_Dirs = 'RCS CVS SCCS .git .svn generated'
set grepprg=/bin/grep\ -nH

" => Nerd Tree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" => vim-multiple-cursors
let g:multi_cursor_next_key="\<C-s>"

" => Vimroom
let g:goyo_width=80
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>` :Goyo<cr>

" => vim-ag aka The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" => vim-to-github
let g:to_github_clip_command = 'pbcopy'
let g:to_github_clipboard = 1
map <Leader>gh :ToGithub<CR>

" NeoComplete.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" tmux-complete
let g:tmuxcomplete#trigger = ''

" Run RSpec in tmux
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Activate snipmate
"ActivateAddons vim-snippets snipmate

" vim-erlang-skeletons
let g:erl_author="Mirosław Pragłowski"
let g:erl_company="Solutions Factory"
let g:erl_replace_buffer=1

" linters
" javascript
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
