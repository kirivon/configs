" Misc {{{
set nocompatible    " Disable VI Compatability Mode
let mapleader=","   " Remap leader to ,
" Move vertically by visual line
nnoremap j gj
nnoremap k gk
" }}}

" UI Config {{{
set number          " Show line numbers
set showcmd         " Show last command in bottom bar
" }}}

" Colors {{{
" ===Color Related Settings===
syntax on           " Enable Syntax Highlighting
set background=dark
colorscheme solarized
" colorscheme xoria256
" Disable Background Color Erase 
" set t_ut=
" }}}

" Tabs {{{
" ===Tab Related Settings===
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
"  }}}

" Folding {{{
set foldenable          " Enable folding
set foldmethod=indent   " Fold based on indent level
set foldnestmax=10      " Set max nested folds to 10 
set foldlevelstart=10   " Open most folds by default
" Map open/closing folds to space
nnoremap <space> za
" }}}

" Search {{{
set incsearch           " Search as characters are entered
set hlsearch            " Highlight search matches
" Clear search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Plugins {{{
filetype off                            " Required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim       " Add vundle directory to runtime path
call vundle#begin() 
    Plugin 'VundleVim/Vundle.vim'       " let Vundle manage Vundle, required
    Plugin 'Shougo/neocomplete'         " Cached keyword completion system
    Plugin 'Shougo/neosnippet'          " Add snippet support
    Plugin 'Shougo/neosnippet-snippets' " Default snippets files
    Plugin 'faith/vim-go'               " Go support for Vim 
    Plugin 'majutsushi/tagbar'          " Browse tags of a current file
    " Plugin 'godlygeek/csapprox'       " Support Gvim colorschemes in terminal
call vundle#end()
" Map F8 to toggle Tagbar
nmap <F8> :TagbarToggle<CR>
filetype plugin indent on               " Required by Vundle
" }}}

" Neocomplete {{{ 
" ===Neocomplete Mappings===

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Go related mappings
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def-tab)

" }}}

" vim:foldmethod=marker:foldlevel=0
