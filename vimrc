au GUIEnter * simalt ~x
call pathogen#infect('bundle/{}')
let python_highlight_all=1
syntax enable
filetype plugin indent on
set nobackup
set backupcopy=yes
set encoding=utf-8
set fileencoding=utf-8
set ts=2 sts=2 sw=2 expandtab
set nowrap
set nu!
set colorcolumn=80
set foldmethod=indent
set foldlevel=0
set foldenable

set background=dark
let g:rehash256 = 1

let g:ctrlp_max_files=0

" global mappings
let mapleader = ","
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>
imap jk <Esc>
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <space> za

" python
au BufNewFile,BufRead *.py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=79 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

" haskell
nnoremap <Leader>ht :GhcModType<CR>
nnoremap <Leader>hu :GhcModTypeClear<CR>
nnoremap <Leader>hc :GhcModCheck<CR>

" markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" rust
au BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

let g:ale_linters = {'rust': ['rls']}
let g:ale_fixers = {
            \'rust': ['rustfmt'],
            \'javascript': ['prettier'],
            \'*': ['trim_whitespace'],
            \}
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 1
let g_ale_javascript_prettier_options = '--single-quote'
let g:ale_rust_rls_config = {'rust': {'clippy_preference': 'on'}}

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> <leader>l :ALEFix<CR>
nnoremap <silent> <leader>r :ALEStopAllLSPs<CR>:ALELint<CR>
