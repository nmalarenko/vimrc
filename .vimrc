  syntax on
  au FileType puppet setlocal tabstop=8 expandtab shiftwidth=2 softtabstop=2
  au FileType puppet setlocal isk+=:
  set tags=./tags,tags;$HOME
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set t_RV=
call vundle#rc()
"set hlsearch

"set clipboard=unnamedplus
noremap  y "*y
noremap  Y "*Y
noremap  p "*p
noremap  P "*P
vnoremap y "*y
vnoremap Y "*Y
vnoremap p "*p
vnoremap P "*P


let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'matze/vim-move'
Bundle 'scrooloose/syntastic'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'

" nerdtree
 let NERDTreeAutoDeleteBuffer = 1
" let NERDTreeMapOpenInTab='\r'
" autocmd BufEnter * lcd %:p:h
 set nocompatible
" filetype indent plugin on
 set tabstop=4
 set shiftwidth=4
 set smarttab
 set expandtab
 set smarttab
" set smartindent
 set autoindent
 set number
runtime macros/matchit.vim
map <C-n> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufWinEnter * NERDTreeMirror
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
" map <alt+n> to navigate through tabs
for c in range(1, 9)
    exec "set <A-".c.">=\e".c
    exec "map \e".c." <A-".c.">"

    let n = c - '0'
    exec "map <M-". n ."> ". n ."gt"
endfor
set pastetoggle=<F9>
set cursorline 
let g:move_key_modifier = 'C'

" airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" orange in insert mode, red in command mode
" if you want to use rgb color formatting:
"   konsoleprofile CustomCursorColor=#255255255
autocmd VimEnter * silent !konsoleprofile UseCustomCursorColor=1
let &t_SI = "\<Esc>]50;CustomCursorColor=orange;BlinkingCursorEnabled=1\x7"
let &t_EI = "\<Esc>]50;CustomCursorColor=red;BlinkingCursorEnabled=0\x7"
silent !konsoleprofile CustomCursorColor=red
autocmd VimLeave * silent !konsoleprofile CustomCursorColor=gray;BlinkingCursorEnabled=0

:hi CursorLine  cterm=NONE ctermbg=black guibg=#222222 guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
"fast scrolling
set ttyfast
set lazyredraw

"syntatic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { 'regex': 'arrow_on_right_operand_line\|80chars\|autoloader_layout\|possibly useless use of a variable in void context\|\.erb' }
let g:syntastic_python_checkers = ['pylint']

au FileType gitcommit set tw=70
nmap <Leader>t :GFiles<CR>
nmap <Leader>r :Tags<CR>

syntax enable
set background=dark
colorscheme solarized
"let g:solarized_termcolors=256
" This is the default. %s is replaced with fzf command
"let g:fzf_launcher = 'xterm -e bash -ic %s'
let g:fzf_launcher='gnome-terminal --disable-factory -x bash -ic %s'
" Use urxvt instead
"let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
autocmd BufEnter * silent! lcd %:p:h
