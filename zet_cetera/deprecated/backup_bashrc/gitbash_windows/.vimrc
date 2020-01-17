"==================== SETTGINS ==============================
set nocompatible
set autoindent
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set foldmethod=indent
set nofoldenable
set foldlevel=2
set foldnestmax=10

" VIEW 
"set relativenumber
set visualbell
set number
set ruler
set wrap
set title
set cursorline
set linebreak
set showmatch
set background=dark
set guifont=Noto_Mono_for_Powerline:h11:cANSI
set guifontwide=dotumche:h11:cDEFAULT

" SEARCH 
set nowrapscan
set hlsearch
set ignorecase
set incsearch

" EDIT 
set backspace=eol,start,indent
set history=1000
set enc=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,cp949,latin1
set nobomb
set nobackup
set noswapfile
set whichwrap+=h,l,<,>,[,]   " 키보드 < > 키로 줄을 넘나들을 수 있다
set laststatus=2 " turn on bottom bar
set t_Co=256     " for vim-airline



" 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1



" COLOR SCHEME 
 syntax on
 syntax enable
"" 칼라 테마를 solarized로 설정합니다
"" solarized.vim 파일을 C:\Program Files (x86)\Vim\vimfiles\colors 폴더에 넣습니다
" colorscheme 
let g:solarized_termcolors=256
let g:solarized_termtrans=1





" ========================= PLUGIN SETTINGS =======================
" NerdTree
" NERD Tree창이 왼쪽에서 만들어진다
let NERDTreeWinPos = "left"
" 일부 파일들 목록에서 제외
" let NERDTreeIgnore=['\.vim$', '\~$', '.*\.class$', 'CVS', 'classes','.*\.jar$'] 


" 파일 열고나서 자동으로 NERDTree 창을 닫음
" let NERDTreeQuitOnOpen=1 

" miniBufexp
let g:miniBufExplMapWindowNavVim = 1  " Ctrl+[hjkl] 로 윈도우간 이동 가능
let g:miniBufExplMapWindowNavArrows = 1 " Ctrl+화살표로 윈도우간 이동 가능
let g:miniBufExplMapCTabSwitchBufs = 1 " Ctrl-Tab, Ctrl-Shift-Tab으로 버퍼간 스위칭... !! 짱이예욤!!
let g:miniBufExplModSelTarget = 1 





" findstr <C-e> 기본 옵션을 설정합니다 (라인표시, 대소문자무시, 하위폴더)
let Findstr_Default_Options = '/n /i /s' 



" Taglist
filetype on
" Tag list가 사용하는 ctags의 경로 설정 (보통은 주석처리해도 정상적으로 작동한다)
" let Tlist_Ctags_Cmd = "%home%\\.vim\\bundle\\ctags.exe"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
" Tag list 창을 오른쪽으로 생성
let Tlist_Use_Right_Window = 1


" SrcExplToggle
let g:SrcExpl_winHeight = 6


" ctrlP 
let g:ctrlp_map = '<c-p>'  " C-p 키로 해당 디렉토리에서 파일을 검색합니다
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" snipMate의 경로를 설정합니다
let g:snippets_dir='C:\\Program Files (x86)\\Vim\\.vim\\bundle\\snipMate\\snippets\'





" YouCompleteMe
" .ycm_extra_conf.py가 있는 경로를 입력해야 합니다
" let g:ycm_global_ycm_extra_conf = 'C:\\Program Files (x86)\\Vim\\.vim\\bundle\\youcompleteme\\third_party\\ycmd\\cpp\\ycm\\.ycm_extra_conf.py' 
" let g:ycm_confirm_extra_conf = 0 
" let g:ycm_key_list_select_completion = ['', ''] 
" let g:ycm_key_list_previous_completion = ['', ''] 
" let g:ycm_autoclose_preview_window_after_completion = 1 
" " let g:ycm_warning_symbol = '>*'
" nnoremap <leader>g :YcmCompleter GoTo<CR>
" " nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>
" nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>t :YcmCompleter GetType<CR>
" nnoremap <leader>p :YcmCompleter GetParent<CR>
" " YCM의 Syntax Checking 기능을 끕니다
" let g:ycm_show_diagnostics_ui = 0
"


" neocomplcache를 실행합니다 (YouCompleteMe 설치 이후로는 사용하지 않습니다)
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3




" jedi-vim (YouCompleteMe 설치 이후로 사용하지 않습니다)
" let g:jedi#force_py_version = 2    " 파이썬 버전을 2버전으로 설정합니다
" 파이썬 버전을 2버전으로 설정합니다
" let g:jedi#use_tabs_not_buffers = 1
" autocmd FileType python setlocal completeopt-=preview
" " <leader>n 키로 설정되있는 jedi#usage_command를 해제합니다 (mark 플러그인과 겹치므로)
" let g:jedi#usages_command = ""

"" pydiction 경로 설정
""filetype plugin on
""let g:pydiction_location = "\"C:\\Program Files (x86)\\Vim\\.vim\\bundle\\Pydiction\\complete-dict\""

" python 경로를 설정합니다 (jedi-vim 설치 후 이걸 안해주면 강제로 튕깁니다)
" let $PYTHONHOME = "C:\\Users\\edward\\Anaconda3\\envs\\py27_32"
" let $PYTHONPATH = "C:\\Users\\edward\\Anaconda3\\envs\\py27_32\\Lib"
" ;C:\\Users\\edward\\Anaconda3\\envs\\py27_32\\DLLs;
" ;C:\\Users\\edward\\Anaconda3\\envs\\py27_32\\Lib\\lib-tk
" let python_version_2 = 1     " python 2의 문법을 따릅니다
" let python_highlight_all = 1 " 모든 색상을 강조합니다







" ============== C++ SETTINGS ==============
" Highlighting of class scope is disabled by default. To enable set
let g:cpp_class_scope_highlight = 1
" Highlighting of member variables is disabled by default. To enable set
let g:cpp_member_variable_highlight = 1
" There are two ways to hightlight template functions. Either
let g:cpp_experimental_simple_template_highlight = 1
" which works in most cases, but can be a little slow on large files. Alternatively set
let g:cpp_experimental_template_highlight = 1



" =========== VUNDLE SETTINGS ==================
filetype off

set rtp+=~/.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
Plugin 'gmarik/Vundle.vim'

Plugin 'The-NERD-tree'
Plugin 'minibufexpl.vim'
Plugin 'EasyMotion'          " 단어 간 이동을 쉽게 해주는 패키지 (단축키 : \\w, \\b)
Plugin 'justinmk/vim-sneak'  " 단어 간 이동을 쉽게 해주는 패키지 (단축키 : f)
Plugin 'matchparenpp'
Plugin 'AutoClose'
Plugin 'ctags.vim'
Plugin 'ctags.exe'
Plugin 'taglist-plus'
Plugin 'Mark'			" 단어를 하이라이팅(마킹)해주는 패키지입니다. \m : 하이라이팅, \n : 제거
Plugin 'tComment'      " 비주얼모드에서 C-_,C-_ 키로  주석입히기
Plugin 'snipMate'      " 원하는 함수나 구문 편하게 만들기 
					   " ex) main 입력 후 tab을 누르면 알아서 main 함수가 만들어집니다
Plugin 'surround.vim'   " 단어를 감싸주는 패키지입니다
						" 아무 단어위에서 yss( 나 yss" 를 입력해보세요 다른 명령어도 많습니다				   
Plugin 'ctrlp.vim'		" 현재 디렉토리에서 파일을 쉽게 검색할 수 있는 패키지 (C-p 키로 사용합니다)
Plugin 'srcexpl'        " Ctag와 함께 연동하는 패키지로 커서가 올라간 함수나 변수의 정의를 쉽게 확인할 수 있습니다
Plugin 'findstr.vim'    " 여러 파일들 안에서 특정단어를 검색합니다

Plugin 'Arduino-syntax-file'  " 아두이노 구문 하이라이팅 패키지입니다
Plugin 'sudar/vim-arduino-snippets' " 아두이노 구문 자동완성 패키지입니다

Plugin 'Processing-Syntax'  " 프로세싱 구문 하이라이팅과 자동완성 패키지입니다
Plugin 'processing-snipmate'

Plugin 'pangloss/vim-javascript'  " Javascript 구문 하이라이트 플러그인입니다

Plugin 'octol/vim-cpp-enhanced-highlight' " C++ 구문 하이라이팅을 해주는 플러그인입니다

Plugin 'vim-airline/vim-airline'  " vim 화면을 좀 더 예쁘게 구성해주는 플러그인
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'valloric/youcompleteme'  " C++, Python 등 언어의 자동완성 플러그인



" Plugin 'cjrh/vim-conda'    
" Plugin 'neocomplcache'
" Plugin 'davidhalter/jedi-vim'  " python 자동완성 기능을 하는 패키지
" (Anaconda 를 설치한 이후로 python2,3을 번갈아가며 사용하고 x64, x86 호환성이
" 안맞아서 jedi-vim이 정상적으로 작동하지 않는다)
call vundle#end()
filetype plugin indent on





" READ FILE FORMAT
" 아두이노 파일을 읽습니다
au BufRead,BufNewFile *.pde set filetype=pde
au BufRead,BufNewFile *.ino set filetype=arduino
" .xaml 파일을 xml 포멧으로 읽습니다
au BufRead,BufNewFile *.xaml set filetype=xml
" .launch 파일을 xml 포멧으로 읽습니다
au BufRead,BufNewFile *.launch set filetype=xml
" .nse 파일을 lua 포멧으로 읽습니다
au BufRead,BufNewFile *.nse set filetype=lua


" MAPPING
"" 함수나 변수를를 이동하는 단축키를 Alt + ., 로 변경합니다 
map <M-.> <C-]>
map <M-,> <C-o>
"" C-q 키를 누르면 현재 창을 제외한 나머지 창을 제거합니다
map <c-q> :on <CR>
" Findstring을 C-e 단축키로 실행합니다
map <C-e> :Findstring<CR> 
" C-x키로 Findstring을 통해 생성된 창을 지웁니다 
map <C-x> :cclose<CR>

" F4키는 모든 마킹을 지우고 F5키는 해당 단어를 하이라이팅합니다
map <F4> <Plug>MarkClear
map <F5> <Plug>MarkSet

" SrcExplToggle 버튼을 단축키 F6으로 합니다
nmap <F6> :SrcExplToggle<CR>
" [F7] 단축키로 실행
map <F7> :NERDTreeToggle<CR>
" [F8] 단축키로 taglist 를 실행합니다
nmap <F8> :TlistToggle<CR>
" 파이썬스크립트 실행 단축키를 Ctrl + r로 합니다
nnoremap <C-r> :exec '!python' shellescape(@%, 1)<cr>

" vim-sneak
" 기본 단축키였던 s에서 f로 단축키를 변경합니다
map f <Plug>Sneak_s
map F <Plug>Sneak_S




" KEY BINDING ==========================
" C+- + C+-    : tComment 패키지, 주석입히기
" \\w, \\b     : EasyMotion 패키지, 단어 이동 편리하게 해주는 키
" f ..         ; vim-sneak 패키지, 단어 이동 편리하게 해주는 키
" F4, F5       : Mark 패키지, 동일한 단어들 마킹해주는 키
" z+.          : 현재 커서 있는 부분이 화면 중앙으로 오게 해준다
"
"
"
" ======================================






"" ================== 윈도우 환경은 설정할게 조금 있습니다
"" 1. 환경변수를 HOME ==> c:\Program Files (x86)\vim\ 으로 합니다
"" 2. git을 설치합니다 (Windows Prompt 모드로 설치)
"" 3. curl.cmd 파일을 해당 c:\Program Files\git\cmd\ 폴더 안에 넣어줍니다
"" 4. cmd> mkdir "C:\Program Files (x86)\Vim\.vim\bundle\Vundle.vim" 입력합니다
"" 5. cmd> git clone https://github.com/VundleVim/Vundle.vim.git "C:\Program Files (x86)\Vim\.vim\bundle\Vundle.vim" 



"" ================== NERD TREE for windows 설정법 
"" 1. gvim을 실행하시고 :e $HOME\_vimrc 를 입력해 지금 이 파일을 엽니다
"" 2. :bundleinstall 을 눌러 패키지를 설치합니다
"" 3. C:\Program Files (x86)\Vim\.vim\bundle\The-NERD-tree\plugin\NERD_tree.vim
"" 4. 파일에서 69,70행에 있는 ,"? ? 를 , 1 로 고쳐줍니다




"" ================== CTAGS for windows 설정법
"" 1. c:\Program Files (x86)\Vim\.vim\bundle\ctags.exe\ctags.exe 파일을 복사해서 c:\Program Files (x86)\Vim\vim74\ 폴더에 붙여넣습니다
"" 2. vim을 켠 상태에서 :!ctags -R 로 태그를 생성할 수 있습니다
"" 3. 단축키는 ctrl + ](또는 Alt + .)(함수 정의로 이동) , ctrl + o (또는 Alt + ,)(되돌아가기) 입니다




"" ============== ctrlP.vim 사용법 =====================
"" Once CtrlP is open:
"" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"" Press <c-f> and <c-b> to cycle between modes.
"" Press <c-d> to switch to filename only search instead of full path.
"" Press <c-r> to switch to regexp mode.
"" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"" Use <c-y> to create a new file and its parent directories.
"" Use <c-z> to mark/unmark multiple files and <c-o> to open them.




"" ============== Surround.vim 사용법 =====================
"" Normal mode
"" -----------
"" ds  - delete a surrounding
"" cs  - change a surrounding
"" ys  - add a surrounding
"" yS  - add a surrounding and place the surrounded text on a new line + indent it
"" yss - add a surrounding to the whole line
"" ySs - add a surrounding to the whole line, place it on a new line + indent it

"" Visual mode
"" -----------
"" S   - in visual mode, add a surrounding but place text on new line + indent it

"" Insert mode
"" -----------
"" <C-s> - in insert mode, add a surrounding
"" <C-s><C-s> - in insert mode, add a new line + surrounding + indent


