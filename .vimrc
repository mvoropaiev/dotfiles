set clipboard=unnamed
set nocompatible
syntax on
set re=1
set mouse=a
set hidden

set directory^=$HOME/.vim/tmp//

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1

let g:rainbow_active = 1

" deoplete
let g:deoplete#enable_at_startup = 1
set runtimepath+=~/.vim/pack/bundle/start/deoplete.nvim/
call deoplete#custom#option({
\ 'auto_complete_delay': 200,
\ 'smart_case': v:true,
\ 'max_list': 50,
\ })

set completeopt=longest,menuone
"set completeopt=preview
"set completeopt=menu,menuone,preview,noselect,noinsert
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['ruby'] = 'ruby,rails'
" lenght marker
set colorcolumn=80
" TODO: fix?
set cursorline
" set norelativenumber
" set foldlevel=0
" set foldmethod=manual

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" vim-gitgutter
set updatetime=100

" airline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#default#section_truncate_width = {
"      \ 'b': 79,
"      \ 'x': 60,
"      \ 'y': 88,
"      \ 'z': 45,
"      \ 'warning': 80,
"      \ 'error': 80,
"      \ }

" ale
let g:ale_linters = {
\   'ruby': ['rubocop', 'reek'],
\}
let g:ale_completion_enabled = 0
let g:ale_ruby_solargraph_executable='bin/solargraph'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:LanguageClient_serverCommands = {
        \ 'ruby': ['bundle', 'exec', 'solargraph', 'stdio'],
        \ 'python': ['pyls']
        \ }

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
" history
" set undofile
" iset undodir=~/.vim/undo/

" fix backspace
" set backspace=indent,eol,start
set backspace=2
set number
set numberwidth=5
set signcolumn=yes

" color schema
colors gruvbox 

" nerdtree
let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen=1

" powerline
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set laststatus=2
"set t_Co=256

" make Esc happen without waiting for timeoutlen
" fixes Powerline delay
if ! has('gui_running')
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
endif

" ctrl-p
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg --files --no-ignore-vcs --hidden %s'
  "let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --glob ""'
  "let g:ctrlp_use_caching = 0
endif

" font for gui
if has("gui_running")
  set guifont=Inconsolata\ for\ Powerline:h14
  "set guifontwide=Hiragino\ Sans\ GB
  "set linespace=2
endif

" speed
"set noballooneval
"let g:netrw_nobeval = 1

" ruby
let g:ale_fixers = {'ruby': ['rubocop'], 'sh': ['shfmt'], 'terraform': ['terraform'], 'python': ['isort', 'yapf']}

" key bindings
let mapleader = ","

noremap <Leader>w :update<CR>

nmap <leader>n :enew<CR>
nmap <leader>q :bd<CR>
nmap <Leader>. <Esc>:bnext<CR>
nmap <Leader>, <Esc>:bprevious<CR>

set hlsearch
noremap <leader>h :let @/ = ""<CR>
"noremap <leader>h :set hlsearch! hlsearch?<CR>

" git
noremap <leader>gs :G<CR>
noremap <leader>gc :Git checkout<space>
noremap <leader>gm :Gmerge --no-ff<space>
noremap <leader>gd :Git d<space>
noremap <leader>gC :Gcommit<CR>
noremap <expr> <leader>gp ":Gpush -u origin " . fugitive#head()
nnoremap « :NERDTreeFind<CR>

let g:ctrlp_map = '<F12>'
nmap <C-p> :FZF<CR>
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <F3> :Rg<Space>
nnoremap <F2> :call LanguageClient#textDocument_definition()<CR>
"nnoremap <F2> :ALEGoToDefinition<CR>
nnoremap <leader>f :ALEFix<CR>
" autocmd FileType eruby nnoremap <leader>f :!htmlbeautifier "%" "%"<CR>
nnoremap <F7> :!screen -S d4m -p 0 -X stuff "touch \"/var/lib/docker/volumes/ftrails_app_nfs/_data/@%\""<CR><CR>

vnoremap <F5> :sort<CR>
" help
packloadall
silent! helptags ALL

let g:fzf_nvim_statusline = 1
