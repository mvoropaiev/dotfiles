syntax on
set encoding=utf-8
set nocompatible
" set clipboard=unnamed
set re=1
set mouse=a
set ttymouse=xterm2
set hidden
set noshowmode
set synmaxcol=256
set shortmess-=S
set undodir=~/.vim/undodir
set undofile
set splitbelow
set splitright
set autoindent
set smarttab
set complete-=i
set nrformats-=octal
set laststatus=2
set wildmenu
let g:python_highlight_all = 1
if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

set autoread

if &history < 1000
  set history=1000
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

set sessionoptions-=options

let g:neosnippet#snippets_directory='~/.vim/pack/bundle/start/vim-snippets/snippets'
set directory^=$HOME/.vim/tmp//

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
imap <C-k> <Plug>(coc-snippets-expand)
vmap <C-k> <Plug>(coc-snippets-select)
imap <C-k> <Plug>(coc-snippets-expand-jump)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1
autocmd BufRead,BufNewFile *.conf setfiletype nginx

let g:rainbow_active = 1

" deoplete
" let g:deoplete#enable_at_startup = 1
" set runtimepath+=~/.vim/pack/bundle/start/deoplete.nvim/
" call deoplete#custom#option({
"       \ 'auto_complete_delay': 200,
"       \ 'smart_case': v:true,
"       \ 'max_list': 50,
"       \ })

set completeopt=menuone,noselect,noinsert
" set completeopt=longest,menuone
"set completeopt=preview
"set completeopt=menu,menuone,preview,noselect,noinsert
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['ruby'] = 'ruby,rails'
" lenght marker
set colorcolumn=100
" TODO: fix?
set cursorline
set norelativenumber
" set foldlevel=0
" set foldmethod=manual

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" vim-gitgutter
set updatetime=250
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg

" airline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline#extensions#default#section_truncate_width = {}
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
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
\   'ruby': ['rubocop'],
\   'python': ['pyls'],
\}
let g:ale_ruby_rubocop_executable='/usr/local/lib/ruby/gems/2.7.0/bin/rubocop'
" let g:ale_completion_enabled = 0
let g:ale_c_uncrustify_options = '-c ~/.uncrustify'
" let g:ale_ruby_solargraph_executable='/usr/local/lib/ruby/gems/2.7.0/bin/solargraph'
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_lint_on_insert_leave = 1
" let g:LanguageClient_serverCommands = {
"         \ 'python': ['pyls'],
"         \ 'ruby': ['bundle', 'exec', 'solargraph', 'stdio'],
"         \ }

" let g:ale_sign_error = '>'
" let g:ale_sign_warning = '-'
let g:ale_fixers = {
  \ 'json': ['prettier'],
  \ 'objc': ['uncrustify'],
  \ 'objcpp': ['uncrustify'],
  \ 'python': ['isort', 'yapf'],
  \ 'ruby': ['rubocop'],
  \ 'sh': ['shfmt'],
  \ 'terraform': ['terraform'],
  \ 'scss': ['prettier'],
  \ 'javascript': ['prettier'],
  \ 'eruby': ['prettier'],
  \ 'yaml': ['prettier'],
  \ }

" history
" set undofile
" iset undodir=~/.vim/undo/

" fix backspace
" set backspace=indent,eol,start
set backspace=2 " allow backspace over ident, eol, start
set number " display line number
set numberwidth=5 " line column minimum width
set signcolumn=yes " display signs

colors gruvbox " color scheme

" cd to specified directory if provided at startup
" autocmd VimEnter * lcs %:p:h
augroup cdpwd
    if argc() >= 1 && isdirectory(argv()[0])
      autocmd!
      autocmd VimEnter * exe 'cd' argv()[0]
    endif
augroup END

" NERDTree
let g:NERDTreeWinPos="right"
let NERDTreeQuitOnOpen=1

" autocmd BufEnter * :NERDTreeFind<cr>
" powerline
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set laststatus=2
"set t_Co=256

" fixes Powerline delay

" gui specific
if ! has('gui_running')
  set ttimeoutlen=10
  set guifont=Inconsolata\ for\ Powerline:h14
  "set guifontwide=Hiragino\ Sans\ GB
  "set linespace=2
  augroup FastEscape " make esc happen without waiting for timeoutlen
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
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " let g:ctrlp_user_command = 'rg %s --column --line-number --no-heading --color=always --smart-case --glob ""'
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  "let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --glob ""'
  let g:ctrlp_use_caching = 0
endif

" speed
"set noballooneval
"let g:netrw_nobeval = 1

" key bindings
let mapleader = ","
"command! -nargs=+ -complete=file A call fzf#vim#rg_raw(<q-args>)
" command! -nargs=* -complete=file Rg
"       \ call fzf#vim#grep(
"       \   'rg --column --line-number --no-heading --color=always --smart-case '. <q-args>, 1,
"       \   fzf#vim#with_preview('right:50%:hidden', '?'))
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" command! -bang -nargs=+ -complete=file Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1)
noremap <Leader>w :update<CR>
nnoremap <C-e> <ESC>:b#<cr>
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'
nnoremap <Leader>; : 
nmap <leader>n :enew<CR>
nmap <leader>e :e<CR>
nmap <leader>q :bd<CR>
nmap <leader>Q :q<CR>
nmap <Leader>. <Esc>:bnext<CR>
map ,* *<C-O>:%s///gn<CR>
nnoremap <leader><Tab> <Esc>:b#<CR>
nmap <Leader>, <Esc>:bprevious<CR>

nnoremap <Leader>s <kDivide><C-r><C-w><CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" search
set hlsearch
set incsearch
noremap <leader>h :let @/ = ""<CR>
"noremap <leader>h :set hlsearch! hlsearch?<CR>
" map <leader>s :setlocal spell! spelllang=en_us<CR>

" mappings - git
" noremap <leader>gs :G<CR>
noremap <leader>gs :Silent tig status<cr>
noremap <leader>gw :Gw<CR>
noremap <leader>gc :Git checkout<space>
noremap <leader>gm :Gmerge --no-ff<space>
noremap <leader>gd :Git db<space>
noremap <leader>gC :Gcommit<CR>
noremap <expr> <leader>gp ":Gpush -u origin " . fugitive#head()
nnoremap <leader>m :NERDTreeFind<CR>
nnoremap <leader>o :call append(line("."), "")<CR>

let g:ctrlp_map = '<F10>'
nmap <C-p> :FZF<CR>
nmap <C-f> :Rg<space>
nnoremap <C-w> :Buffers<CR>
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <F3> :Rg<Space>
nnoremap <F2> :call LanguageClient#textDocument_definition()<CR>
" nnoremap <F2> :ALEGoToDefinition<CR>
nnoremap <leader>f :ALEFix<CR>
nnoremap <leader>d :ALEDetail<CR>
" autocmd FileType eruby nnoremap <leader>f :!htmlbeautifier "%" "%"<CR>
nnoremap <F8> :!htmlbeautifier "%:p" "%:p"<CR>l<CR>

" mapping copy/paster/sort
vnoremap <leader>s :sort<CR>
vnoremap <leader>y "*y
vnoremap <leader>p "*p
nnoremap <leader>p "*p

" help
packloadall
silent! helptags ALL

" fzf
let g:fzf_nvim_statusline = 1
let g:fzf_preview_window = ['up:40%', 'ctrl-/']
let g:fzf_layout = { 'down': '~40%' }

" save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction
let g:vim_markdown_folding_disabled = 1

" when switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
