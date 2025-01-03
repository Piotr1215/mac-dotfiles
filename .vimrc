set nocompatible
syntax enable
syntax on
filetype on
filetype plugin on

set ignorecase
set smartcase
set hidden
set noerrorbells
set scrolloff=8
set signcolumn=yes
set hlsearch

" custom setting
set mouse=v
set number
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set guioptions=

" indent for global
set expandtab
set shiftwidth=5
set softtabstop=4
set autoindent
set relativenumber
set incsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" *** REMAPS ***
" LEADER REMAPS
" Space is leader
nnoremap <SPACE> <Nop>
map <Space> <Leader>

" Show all files 
nnoremap <Leader>; :Files<CR>

nnoremap <Leader>q @q

map ` <Nop>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>ne :NERDTree<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nfi :NERDTreeFind<CR>

" Move line of text up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Add line below without entering insert mode!
nnoremap <silent> <leader><Up>   :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> <leader><Down> :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" Enclose highlighted parts in brackets etc
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

" Edit current file in different ways
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Removes whitespace
nnoremap <Leader>rspace :%s/\s\+$//e
" Removes empty lines if there are more than 2
nnoremap <Leader>rlines :%s/\n\{3,}/\r\r/e

" Copy/Cut diagrams
nnoremap <Leader>ply <Cmd>call search('```plantuml', 'Wbc') \| .,/```/y<CR>
nnoremap <Leader>pld <Cmd>call search('```plantuml', 'Wbc') \| .,/```/d<CR>

map asd <Plug>Markdown_MoveToParentHeader

" Set spellcheck on/off
nnoremap <Leader>son :setlocal spell spelllang=en_us<CR>
nnoremap <Leader>sof :set nospell<CR>

" Used for learning for certs
nnoremap <Leader>ok A :+1: <esc><CR>
nnoremap <Leader>bad A :-1: <esc><CR>
nnoremap <Leader>r A :hand: <esc><CR>
nnoremap <Leader>clean :g/<details>/,/<\/details>/d _<CR>

" delete word forward in insert mode
inoremap <C-e> <C-o>dw<Left> 
nmap <Leader>cx <Plug>(Exchange)

nnoremap <Leader>i i<space><esc>

" Copy line from above and inser under cursor and enter inser mode from the
nnoremap <Leader>c 1ky$jp0i
nnoremap <Leader>gl }
nnoremap <leader>sv :source ~/.vimrc<CR>

function! s:MarkdowCodeBlock(outside)
    call search('```', 'cb')
    if a:outside
        normal! Vo
    else
        normal! j0Vo
    endif
    call search('```')
    if ! a:outside
        normal! k
    endif
endfunction

onoremap <silent>am <cmd>call <sid>MarkdowCodeBlock(1)<cr>
xnoremap <silent>am <cmd>call <sid>MarkdowCodeBlock(1)<cr>

onoremap <silent>im <cmd>call <sid>MarkdowCodeBlock(0)<cr>
xnoremap <silent>im <cmd>call <sid>MarkdowCodeBlock(0)<cr>

"toggles whether or not the current window is automatically zoomed
function! ToggleMaxWins()
if exists('g:windowMax')
  au! maxCurrWin
  wincmd =
  unlet g:windowMax
else
  augroup maxCurrWin
      " au BufEnter * wincmd _ | wincmd |
      "
      " only max it vertically
      au! WinEnter * wincmd _
  augroup END
  do maxCurrWin WinEnter
  let g:windowMax=1
endif
endfunction
nnoremap <Leader>max :call ToggleMaxWins()<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>nh :.,/^#/-1<CR> 
nnoremap <Leader>ph <Plug>Markdown_MoveToPreviousHeader

" SHORTCUTS REMAPS
" Stop search highlight
nnoremap ,<space> :nohlsearch<CR>

" jj in insert mode instead of ESC
inoremap jj <Esc> 
inoremap jk <Esc> 

" Copies till the end of a line. Fits with Shift + D, C etc
nnoremap Y y_

" Replace multiple words simultaniously
nnoremap cn *``cgn
nnoremap cN *``cgN

" COMMAND REMAPS
command GitDiff execute  "w !git diff --no-index -- % -"
nmap <F8> :TagbarToggle<CR>

" cut content to next header #
nmap cO :.,/^#/-1d<CR>

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" all plugin
Plugin 'mhinz/vim-startify'

if has('vim')
    Plugin 'Valloric/YouCompleteMe'
endif


Plugin 'wellle/targets.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'

Plugin 'preservim/nerdtree'
Plugin 'majutsushi/tagbar'

Plugin 'Yggdroot/indentLine'

Plugin 'hashivim/vim-terraform'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'

Plugin 'dense-analysis/ale'

Plugin 'sheerun/vim-polyglot'


Plugin 'ryanoasis/vim-devicons'

Plugin 'christoomey/vim-system-copy'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/webapi-vim'

Plugin 'iamcco/markdown-preview.nvim' 

Plugin 'sakshamgupta05/vim-todo-highlight'

Plugin 'tpope/vim-fugitive'

Plugin 'junegunn/vim-emoji'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'dhruvasagar/vim-table-mode'

Plugin 'tommcdo/vim-exchange'

" Color Schemes
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'srcery-colors/srcery-vim'
" All of your Plugins must be added before the following line
call vundle#end()            

" *** COLOR_SCHEMES ***
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set t_Co=256
" set background=dark
let g:lightline = {
      \ 'colorscheme': 'srcery',
      \ }
let g:onedark_termcolors=24
" let g:dracula_termcolors=16
" colorscheme onedark
" colorscheme industry
" colorscheme srcery
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

filetype plugin indent on   

" indent for special file
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" setup custom emmet snippets
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

" setup for markdown snippet
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_folding_level = 3
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_follow_anchor = 1


" setup for ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
  \ 'c' : ['re!\w{2}'],
  \ 'cpp' : ['re!\w{2}'],
  \ 'python' : ['re!\w{2}'],
  \ }
 
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" setup for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

" setup for terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" autoformat
augroup autoformat_settings
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer yapf
augroup END

" open NERDTree automatically when vim starts up on opening a directory
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" setup for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" setup for indent line
let g:indentLine_char = '│'
set tags=./tags,tags;$HOME
"source ~/cscope_maps.vim

let g:go_fmt_command = "goimports"

" Surround custom mapping
" " put ** around the text, when used with ysso, or v<highlight>So
" These two lines do the same thing
autocmd Filetype md let g:surround_111 = "**\r**"
