set nocompatible
set clipboard=unnamed
syntax on
set re=1
set mouse=a
set hidden
set incsearch
set noshowmode
set synmaxcol=256

set undodir=~/.vim/undodir
set undofile

set autoindent
set smarttab
set complete-=i
set nrformats-=octal
set laststatus=2
set wildmenu
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
  set formatoptions+=j " Delete comment character when joining commented lines
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
autocmd BufRead,BufNewFile *.conf setfiletype nginx

let g:rainbow_active = 1

" deoplete
let g:deoplete#enable_at_startup = 1
set runtimepath+=~/.vim/pack/bundle/start/deoplete.nvim/
call deoplete#custom#option({
      \ 'auto_complete_delay': 200,
      \ 'smart_case': v:true,
      \ 'max_list': 50,
      \ })

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
" set norelativenumber
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
\   'ruby': ['rubocop', 'reek'],
\   'python': ['pyls'],
\}
let g:ale_ruby_rubocop_executable='bin/rubocop'
let g:ale_completion_enabled = 0
let g:ale_ruby_solargraph_executable='bin/solargraph'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:LanguageClient_serverCommands = {
        \ 'python': ['pyls'],
        \ 'ruby': ['bundle', 'exec', 'solargraph', 'stdio'],
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
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " let g:ctrlp_user_command = 'rg %s --column --line-number --no-heading --color=always --smart-case --glob ""'
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  "let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --glob ""'
  let g:ctrlp_use_caching = 0
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
  \ }

" key bindings
let mapleader = ","
"command! -nargs=+ -complete=file A call fzf#vim#rg_raw(<q-args>)
command! -nargs=* -complete=file Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '. <q-args>, 1,
      \   fzf#vim#with_preview('right:50%:hidden', '?'))
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
nmap <leader>q :bd<CR>
nmap <leader>Q :q<CR>
nmap <Leader>. <Esc>:bnext<CR>
nnoremap <leader><Tab> <Esc>:b#<CR>
nmap <Leader>, <Esc>:bprevious<CR>

nnoremap <Leader>s <kDivide><C-r><C-w><CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

set hlsearch
noremap <leader>h :let @/ = ""<CR>
map <leader>s :setlocal spell! spelllang=en_us<CR>
"noremap <leader>h :set hlsearch! hlsearch?<CR>

noremap <leader>t :terminal<CR>
" git
" noremap <leader>gs :G<CR>
noremap <leader>gs :Silent tig status<cr>
noremap <leader>gw :Gw<CR>
noremap <leader>gc :Git checkout<space>
noremap <leader>gm :Gmerge --no-ff<space>
noremap <leader>gd :Git db<space>
noremap <leader>gC :Gcommit<CR>
noremap <expr> <leader>gp ":Gpush -u origin " . fugitive#head()
nnoremap « :NERDTreeFind<CR>
nnoremap <leader>o :call append(line("."), "")<CR>

let g:ctrlp_map = '<F12>'
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
nnoremap <F7> :!screen -S d4m -p 0 -X stuff "touch \"/var/lib/docker/volumes/ftrails_app_nfs/_data/@%\""<CR><CR>
nnoremap <F8> :!htmlbeautifier "%:p" "%:p"<CR>l<CR>

vnoremap <F5> :sort<CR>
" help
packloadall
silent! helptags ALL

let g:fzf_nvim_statusline = 1

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

" when switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
