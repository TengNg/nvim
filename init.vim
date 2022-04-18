set mouse=a
set tabstop=4 				
set shiftwidth=4 			
set laststatus=3
set number	
set relativenumber
set smartindent
set smartcase
set formatoptions-=cro
set nohlsearch
set nowrap
set scrolloff=8
set signcolumn=yes
set cursorline
set cursorlineopt=number
set clipboard=unnamedplus
set encoding=utf-8
set termguicolors

syntax on

">> Plugins <<
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lualine/lualine.nvim'

Plug 'preservim/nerdTree' 					
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neovim/nvim-lspconfig' 
Plug 'hrsh7th/nvim-compe'

Plug 'jiangmiao/auto-pairs'	
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
call plug#end()

lua <<EOF
require("lsp")
require("completion")
require("statusline")
EOF

"======================================================

" nvim-cmpe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Terminal split
map <Leader>tr :botright vert split<bar> term<CR>
map <Leader>tb :botright split<bar> term<CR>

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m ,+1<CR>==
inoremap <C-k> <esc>:m ,-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Adjusting split sizes
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Fuzzy Finder
nnoremap <silent> <C-f> :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Emmet
let g:user_emmet_mode='n' 		"enable all function in all mode
let g:user_emmet_leader_key=',' "use <,,> to trigger emmet

"======================================================= 

"Set theme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_sign_column='bg0'
let g:gruvbox_bold=1
colorscheme gruvbox
