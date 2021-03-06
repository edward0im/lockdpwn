;; MELPA와 MARMALADE 저장소를 package list에 추가합니다
(require 'package)

(add-to-list 'package-archives'("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives'("melpa" . "http://melpa.org/packages/") t)

(package-initialize) ;; You might already have this line
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)
(defconst demo-packages
  '(
    anzu                   ;; 단어를 찾은 다음 교체하는 패키지 (단축키: M-%)
    duplicate-thing        ;; M-c 키로 현재 행을 그대로 복사하는 패키지
    helm                   ;; 파일목록이나 최근사용하 파일들, 버퍼를 쉽게 볼 수 있게 해주는 패키지
    helm-gtags
    helm-projectile
    helm-swoop
    clean-aindent-mode
    ws-butler              ;; whitespace를 알아서 제거해주는 패키지
    projectile
    undo-tree              ;; Alt + z 키를 통해 undo한 목록들을 볼 수 있는 패키지
    smartparens            ;; {}, [] 등 자동으로 괄호를 닫아주는 패키지
    auto-complete          ;; 단어 자동완성 패키지
    ecb                    ;; Emacs Code Browser의 약자로 코드를 상세하게 분석할 수 있게 해주는 패키지
    dtrt-indent            ;; 여러 파일들이 하나는 탭, 하나는 스페이스로 공백이 되어있을 경우 emacs가 알아서 처리하게 해주는 패키지
    google-c-style         ;; 들여쓰기 형식을 google style (구글 엔지니어들 스타일인듯)로 해주는 패키지
    etags                  ;; 함수나 여러 변수들의 선언을 찾아볼 수 있게 해주는 패키지
    key-chord              ;; 여러 쉬운 단축키들을 등록해주 수 있는 패키지 ( '..'키를 등록했습니다 )( 클래스 자동완성으로 등록 )
    rainbow-delimiters     ;; 괄호를 색색깔있게 바꿔줍니다
    jedi                   ;; 파이썬용 jedi 패키지 (terminal 창에서 $ pip install jedi epc pylint virtualenv 를 쳐줘야 정상작동하는듯 하다)
    highlight-indentation  ;; 파이썬용 들여쓰기 라인을 보여주는 패키지 (Alt + l로 설정했다)
    gtags                  ;; 함수나 여러 변수들의 선언을 찾아볼 수 있게 해주는 패키지
    highlight-symbol       ;; 같은 단어들 하이라이팅 해주는 패키지 (보기 좋게 글자를 색상을 칠해준다)
    yasnippet              ;; 여러가지 자주 사용하는 구문들을 쉽게 사용할 수 있게 템플릿 형식으로 제공해주는 패키지
    ;; ~/.emacs.d/elpa/yasnippet-.../snippets 에 있는 파일들을 ~/.emacs.d/snippets 에 넣어야 정상적으로 동작합니다
    hide-comnt             ;; 주석을 감췄다 보여줬다 하는 패키지 (F9 단축키)
    php-mode               ;; php 모드를 활성화합니다 (~/.emacs.d/elpa/php-mode.../php-mode.elc 파일이 잘못된 듯 합니다 이걸 삭제해주면 정상적으로 실행됩니다)
    flycheck               ;; 코드의 오류를 검사해주는 패키지
    
    robe                   ;; Ruby 관련된 패키지들 : 변수, 함수로 이동할 수 있는 패키지 : robe start를 입력해줘야 합니다
    inf-ruby               ;; Ruby 관련된 패키지들 : ruby shell (irb)를 사용할 수 있는 패키지
    rvm                    ;; Ruby 관련된 패키지들 : ruby version 관리해주는 패키지

    yaml-mode              ;; .yaml 구문을 하이라이팅해주는 패키지
    nxml                   ;; xml 구문들을 folding하기 위한 패키지
    lua-mode               ;; lua 언어를 하이라이팅해주는 패키지
    protobuf-mode          ;; .proto (google protocol buffer) 하이라이팅해주는 패키지
    csharp-mode            ;; C# 구문을 하이라이팅해주는 패키지
    multi-term             ;; 여러 터미널을 emacs에서 실행하 수 있게 해주는 패키지
    which-key              ;; 단축키들의 목록을 보여주는 패키지
    magit                  ;; emacs용 git 패키지 (Alt + \ 단축키)
    iedit                  ;; 단어들의 일괄편집을 해주는 패키지 (Alt + [ 단축키)
    wgrep                  ;; 프로젝트 내 grep 후 한개의 버퍼에서 모든 파일 수정하는 패키지 (grep창에서 C-c C-p 단축키)
    avy                    ;; 편집중 버퍼상의 빠른 이동   (Ctrl + = 단축키)
    swiper                 ;; 편집중 버퍼상의 빠른 이동2  (Ctrl + - 단축키)
    eyebrowse              ;; 워크 스페이스 관리 패키지 (다중 윈도우)
    elpy                   ;; jedi 모드 같이 python code navigation을 해주는 패키지
    markdown-mode          ;; markdown 구문을 하이라이팅해주는 패키지
    org-bullets            ;; org-mode에서 마크 모양을 bullet 모양으로 해주는 패키지
    org-gcal               ;; org-mode와 google Calendar를 연동해주는 패키지
    git-gutter             ;; 수정된 파일의 변경된 라인을 하이라이팅해주는 패키지
    mic-paren              ;; 괄호로 닫혀진 구문이 너무 길어서 한쪽 끝이 안보일 경우 line, number를 알려주는 패키지
    company                ;; auto-complte와 유사한 코드 자동완성 패키지
    irony                  ;; c++ 코드 자동완성 패키지 (M-x irony-install-server로 설치한다)
    company-irony          ;; c++ 코드 자동완성 패키지
    image+                 ;; .jpg, .png 같은 이미지들의 크기를 조정할 수 있는 패키지
    evil                   ;; Extensible Vim Layout Emacs에서 vim과 같은 레이아웃을 사용할 수 있도록 해주는 패키지
    pomodoro               ;; 일정관리를 위한 Podomoro Timer 패키지
    solarized-theme        ;; solarized 테마
    smart-mode-line                  ;; emacs의 mode-line (하단상태바)를 커스터마이징해주는 패키지
    smart-mode-line-powerline-theme  ;; mode-line을 커스터마이징해주는 패키지
    easy-jekyll            ;; emacs for jekyll mode
    wrap-region            ;; region 단위로 *,+ 를 입력할 수 있게 해주는 패키지
                           ;; org 모드에서 +{...}+ 을 사용하기 위해 설치한 패키지
    per-buffer-theme       ;; buffer 별로 다른 theme을 적용할 수 있도록 해주는 패키지
    ox-twbs                ;; org-mode twitter bootstrap .html 파일로 export 해주는 패키지
    ov                     ;; org-mode에서 글자에 색상을 변경하기 위한 overlab 패키지
    minimap                ;; navigation view sidebar을 생성해주는 패키지
    matlab-mode            ;; matlab의 .m 파일을 하이라이팅해주는 패키지
    latex-preview-pane     ;; .tex 파일에서 해당 파일을 pdf로 변환한 모습을 preview해주는 패키지
    tabbar                 ;; emacs에서 tab을 사용할 수 있게해주는 패키지

    rtags                  ;; code navigation package
    cmake-ide              ;; cmake-ide for rtags
    cmake-mode             ;; cmake package syntax highlighting
    eldoc                  ;; 변수의 타입정보를 modeline에 보여주는 패키지

    use-package                ;; package를 관리해주는 패키지

    spacemacs-theme        ;; spacemacs theme
    gruvbox-theme          ;; gruvbox theme
    zenburn-theme         ;; zenburn theme

    calfw                  ;; calendar framework for org-mode
    calfw-org              ;; calfw-org

    htmlize                ;; org-preview-html을 실행하기 위한 의존성 패키지

    docker-tramp           ;; docker container에 있는 파일을 emacs에서 접근할 수 있도록 하는 패키지 (/docker:{container id}: 로 접근 가능)

    neotree                ;; emacs verision of nerd-tree

    ;; ess                    ;; R 언어 전용 패키지입니다
    ;; ein                    ;; emacs에서 Ipython Notebook를 사용하게 해주는 패키지
    ;; nlinum                 ;; linum-mode 대체하는 패키지, linum-mode가 속도가 매우 느려서 바꿨다 (26.1 업그레이드하면서 필요없어짐)
    ;; ycmd
    ;; company-ycmd
    ;; flymd                  ;; markdown 구문을 preview 해주는 패키지
    ;; ample-theme            ;; ample 테마
    ;; org2jekyll             ;; .org 파일을 github page(jekyll)에서 볼 수 있도록 변환해주는 패키지 (NOT USED)
    ;; arjen-grey-theme       ;; grey 테마를 설정할 수 있는 패키지
    ;; org-preview-html       ;; org-mode의 편집을 실시간으로 html로 나타내주는 패키지 (not used)
    ;; powerline              ;; emacs 상태창을 예쁘게 꾸며주는 패키지
    ;; anaconda-mode ;; jedi 모드 같이 python code navigation을 해주는 패키지2
    ;; helm-ros  ;; ROS용 emacs 패키지 (not used)
    ;; autopair
    ;; function-args
    ;; arduino-mode           ;; 만약 아두이노를 사용한다면 추가해줍니다
    ;; comment-dwim-2
    ;; volatile-highlights
    ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
;; (setq helm-gtags-prefix-key "\C-cg")

;;===========================================================================
;;===========================================================================

;; 1. helm에 관한 코드들

(require 'helm-config)
(require 'helm-grep)
;;(require 'setup-helm)
;;(require 'setup-helm-gtags)
;;(require 'setup-cedet)
;;(require 'setup-editing)



;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)            ; rebihnd tab to do persistent action
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)            ; rebihnd tab to do persistent action
;; M-j,k로 helm에서 위아래로 커서를 움직이는 명령어를 실행합니다.
(define-key helm-map (kbd "M-j") 'helm-next-line)
(define-key helm-map (kbd "M-k") 'helm-previous-line)
(define-key helm-map (kbd "<right>") 'helm-next-source)
(define-key helm-map (kbd "<left>") 'helm-previous-source)
;; (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
;; (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
;; (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-candidate-number-limit 500 ; limit the number of displayed canidates
 ;; helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
 ;; useful in helm-mini that lists buffers
 )

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
;; (global-set-key (kbd "C-c h o") 'helm-occur)
;; (global-set-key (kbd "C-c h C-c w") 'helm-wikipedia-suggest)
;; (global-set-key (kbd "C-c h x") 'helm-register)
;; (global-set-key (kbd "C-x r j") 'jump-to-register)

;;(define-key 'help-command (kbd "C-f") 'helm-apropos)
;;(define-key 'help-command (kbd "r") 'helm-info-emacs)
;;(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; use helm to list eshell history
;; (add-hook 'eshell-mode-hook
;;           #'(lambda ()
;;               (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; show minibuffer history with Helm
;;(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
;;(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

;;(define-key global-map [remap find-tag] 'helm-etags-select)
;;(define-key global-map [remap list-buffers] 'helm-buffers-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm-swoop                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Locate the helm-swoop folder to your path
(require 'helm-swoop)

;; Change the keybinds to whatever you like :)
;;(global-set-key (kbd "C-c h o") 'helm-swoop)
;;(global-set-key (kbd "C-c s") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
;;(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; From helm-swoop to helm-multi-swoop-all
;;(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; Save buffer when helm-multi-swoop-edit complete
;;(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
;;(setq helm-swoop-split-with-multiple-windows t)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
;;(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
;;(setq helm-swoop-speed-or-color t)

(helm-mode t)

(provide 'setup-helm)
(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode in Eshell for the same reason as above
;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'python-mode-hook 'helm-gtags-mode)

;; key bindings
;;(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;;(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;;(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(require 'helm-bookmark)
(eval-after-load "helm"
  (lambda()
    ;; M-h,j,k,l 키로 helm-for-files에서 위 아래로 이동합니다.
    (define-key helm-buffer-map (kbd "M-h") 'helm-previous-source)
    (define-key helm-buffer-map (kbd "M-k") 'helm-previous-line)
    (define-key helm-buffer-map (kbd "M-j") 'helm-next-line)
    (define-key helm-buffer-map (kbd "M-l") 'helm-next-source)

    (define-key helm-generic-files-map (kbd "M-h") 'helm-previous-source)
    (define-key helm-generic-files-map (kbd "M-k") 'helm-previous-line)
    (define-key helm-generic-files-map (kbd "M-j") 'helm-next-line)
    (define-key helm-generic-files-map (kbd "M-l") 'helm-next-source)

    (define-key helm-bookmark-map (kbd "M-h") 'helm-previous-source)
    (define-key helm-bookmark-map (kbd "M-k") 'helm-previous-line)
    (define-key helm-bookmark-map (kbd "M-j") 'helm-next-line)
    (define-key helm-bookmark-map (kbd "M-l") 'helm-next-source)

    (define-key helm-read-file-map (kbd "M-h") 'helm-previous-source)
    (define-key helm-read-file-map (kbd "M-k") 'helm-previous-line)
    (define-key helm-read-file-map (kbd "M-j") 'helm-next-line)
    (define-key helm-read-file-map (kbd "M-l") 'helm-next-source)
))

;; gtags 관련해서 자동으로 파일 열고 저장할 때 gtags를 실행하도록 하는 함수들
(gtags-mode t)
(add-hook 'prog-mode-hook 'gtags-mode)


(defun gtags-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
      (let ((olddir default-directory)
            (topdir (read-directory-name
                     "gtags: top of source tree:" default-directory)))
        (cd topdir)
        (shell-command "gtags -q && echo 'created tagfile'")
        (cd olddir)) ; restore
    ;;  tagfile already exists; update it
    (with-temp-buffer
      (shell-command "global -u && echo 'updated tagfile'" t))))


;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (gtags-create-or-update)))
;; (add-hook 'c++-mode-common-hook
;;           (lambda ()
;;             (gtags-create-or-update)))


(defun gtags-root-dir ()
  "Return GTAGS Root directory or nil if doesn't exist"
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))


;; gtags를 매번 저장할 때마다 업데이트하는 함수인듯, global -u 커맨드가 핵심커맨드인듯하다
(defun gtags-update-single (filename)
  "Update Gtags database for changes in a single file"
  (interactive)
  (with-temp-buffer
    (shell-command "global -u" t))
  (start-process "update-gtags" "update-gtags" "bash" "-c" (concat "cd " (gtags-root-dir) " ; gtags --single-update " filename )))


(defun gtags-update-current-file()
  (interactive)
  (defvar filename)
  (setq filename (replace-regexp-in-string (gtags-root-dir) "." (buffer-file-name (current-buffer))))
  (gtags-update-single filename)
  (message "Gtags updated for %s" filename)
  )


(defun gtags-update-hook()
  "Update GTAGS file incrementally upon saving a file"
  (when gtags-mode
    (when (gtags-root-dir)
      (gtags-update-current-file))))


(add-hook 'after-save-hook 'gtags-update-hook)


(provide 'setup-helm-gtags)



;;===========================================================================
;; cedet에 관한 코드들 (auto-complete, cc-mode, semantic...)(단어 자동완성 관련된 코드들)

;; PACKAGE: auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; PACKAGE: semantic
(require 'semantic)
;; (require 'semantic/ia)  ;; interactive analysis
;; (require 'semantic/complete)

;; Semantic ON
(semantic-mode t)

;; semantic mode freezing probelm fixing code
;; https://github.com/syl20bnr/spacemacs/issues/7038#issuecomment-254980900
(eval-after-load 'semantic
    (add-hook 'semantic-mode-hook
              (lambda ()
                (dolist (x (default-value 'completion-at-point-functions))
                  (when (string-prefix-p "semantic-" (symbol-name x))
                    (remove-hook 'completion-at-point-functions x))))
              ))

;; 함수나 변수들을 찾아 이동할 때마다 로그를 기록합니다
;; (global-semantic-mru-bookmark-mode)

;; 자동완성에 쓸 헤더 파일 경로 적는 예
;; 이것이 있어야 #include 한 헤더파일의 내용도 자동완성에 나타납니다.
;; (semantic-add-system-include "/usr/include" 'c-mode)
;; (semantic-add-system-include "/usr/include" 'c++-mode)
;; (semantic-add-system-include "/usr/include/c++/5" 'c-mode)
;; (semantic-add-system-include "/usr/include/c++/5" 'c++-mode)
;; (semantic-add-system-include "/opt/ros/kinetic/include" 'c++-mode)

;; package: company irony
(require 'company)
(require 'irony)

;; Enable company mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; using company-irony
;; (add-hook 'c-mode-hook '(lambda ()
;;                           (local-set-key (kbd "<return>") 'newline-and-indent)
;;                           (linum-mode t)
;;                           (irony-mode t)
;;                           ))
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; C++11 에서 추가된 코드들에 대한 자동완성을 하기 위해 추가한 코드
(setq irony-additional-clang-options '("-std=c++11"))
(setq company-idle-delay 0)

;; Now call this function so it add your path to company-c-header-path-system
;; Irony-mode configuration
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; For irony mode I think
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; irony-server가 느려질 경우 끄기 위한 단축키
(global-set-key (kbd "C-x z") 'irony-server-kill)

;;===========================================================================
;; 기타 초기값 설정 코드들

;; GROUP: Editing -> Editing Basics
(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      tab-width 4                       ; default to 4 visible spaces to display a tab
      )

(add-hook 'sh-mode-hook (lambda ()
                          (setq tab-width 4)))


;; 한글폰트 설정 (size 부분을 바꾸면 크기가 바뀝니다)
(set-fontset-font "fontset-default" 'hangul '("NanumGothic" . "unicode-bmp"))
;; (set-fontset-font "fontset-default" 'hangul '("NanumGothicCoding" . "unicode-bmp"))
(set-fontset-font t 'hangul  (font-spec :name "NanumGothicCoding"))
;; (set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NanumGothicCoding" . "unicode-bmp") )
;; (set-fontset-font "fontset-default" '(#xe0bc . #xf66e)  '("NanumGothicCoding" . "unicode-bmp") )

;; 선호하는 인코딩환경을 utf-8으로 설정합니다 (한글 문제)
;; 한글이 깨지는 경우
;; M-x revert-buffer-with-coding-system --> korea-iso-8bit 으로 설정해주면 정상적으로 보인다
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)

;; emacs --daemon 버전에서 M-x load-file 하거나 새로 켜는 경우 한글폰트를 적용하는 함수
(defun set_korean_font_after_loading (&optional frame)
  (set-fontset-font "fontset-default" 'hangul "NanumGothic"))

(add-hook 'after-make-frame-functions 'set_korean_font_after_loading)

;; org-table에서 한글 폰트로 인해 정렬이 깨지지 않도록 하는 방법
;;https://crazia.tistory.com/entry/Emacs-24x-%EB%B2%84%EC%A0%BC-%ED%95%9C%EA%B8%80-%ED%8F%B0%ED%8A%B8-%EC%84%A4%EC%A0%95-orgmode-%EC%9D%98-%ED%95%9C%EA%B8%80-%ED%85%8C%EC%9D%B4%EB%B8%94-%EA%B9%A8%EC%A7%80%EC%A7%80-%EC%95%8A%EA%B2%8C-%EB%B3%B4%EC%9D%B4%EA%B8%B0
(setq face-font-rescale-alist
      '(("NanumGothicCoding" . 1.2307692307692308)
        ("NanumGothic" . 1.2307692307692308)
        ))

;; PACKAGE: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode t)
(setq dtrt-indent-verbosity 0)

;; PACKAGE: ws-butler
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)
(add-hook 'text-mode 'ws-butler-mode)
(add-hook 'fundamental-mode 'ws-butler-mode)

;; PACKAGE: neotree
(require 'neotree)
;; C-x + n 키로 neotree를 토글합니다.
(global-set-key (kbd "C-x n") 'neotree-toggle)

;; PACKAGE: jedi
;; $ pip install jedi epc pylint virtualenv
(require 'jedi)
;; python에서 클래스 이름에 .을 입력하면 자동으로 멤버함수들의 목록을 출력해준다
(setq jedi:install-server t)
(setq jedi:complete-on-dot t)

;; 파이썬 모드 단축키를 설정합니다
(add-hook 'python-mode-hook
          (lambda ()
            (jedi:setup)
            (jedi:ac-setup)
            (define-key jedi-mode-map (kbd "C-c /") nil)
            (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
            (local-set-key (kbd "M-.") 'jedi:goto-definition)

            ;; 파이썬 선택한영역을 < 또는 > 쪽으로 이동합니다
            (local-unset-key (kbd "C-c >"))
            (local-unset-key (kbd "C-c <"))
            (local-set-key (kbd "C-<") 'python-indent-shift-left)
            (local-set-key (kbd "C->") 'python-indent-shift-right)
            (setq indent-tabs-mode t)
            (setq python-indent-offset 4)
            (setq tab-width 4)

            (elpy-mode)         ;; elpy mode 추가 ("M-t" : elpy-rgrep으로 reference를 찾을 수 있습니다)
            ))


;; elpy에서 사용하는 모든 keymap을 비활성화합니다
(setq elpy-mode-map nil)

;; elpy 모드가 실행되고 나서 설정하고 싶은 코드는 아래 작성한다
(eval-after-load "elpy"
  (lambda ()
    ;; Alt + t 키로 reference를 찾아준다 (grep -r 명령어와 비슷하다고 한다)
    (local-set-key (kbd "M-t") 'elpy-rgrep-symbol)

    ;; elpy-mode에서 부가적으로 실행되는 모든 모듈들을 해제한다
    (remove-hook 'elpy-modules 'elpy-module-flymake)
    (remove-hook 'elpy-modules 'elpy-module-yasnippet)
    (remove-hook 'elpy-modules 'elpy-module-highlight-indentation)
    (remove-hook 'elpy-modules 'elpy-module-django)
    (remove-hook 'elpy-modules 'elpy-module-company)
    (remove-hook 'elpy-modules 'elpy-module-eldoc)
    (remove-hook 'elpy-modules 'elpy-module-pyvenv)
    (remove-hook 'elpy-modules 'elpy-module-sane-defaults)
                          ))


;; PACKAGE : org mode
;; DONE 시에 CLOSED timestamp를 사용하는 함수
(defun my/org-mode-hook ()
  (progn
    "Stop the org-level headers from increasing in height relative to the other text."
    (dolist (face '(org-level-1))
      (set-face-attribute face nil :weight 'normal :height 1.2))

    (dolist (face '(org-level-2
                    org-level-3
                    org-level-4
                    org-level-5))
      (set-face-attribute face nil :weight 'normal :height 0.99))
    ))

;; pomodoro 시간관리를 위해 timestamp에 +25분을 더한 구문을 출력하는 함수
;; ex) <2018-01-01 수 1:00-1:25>
(defun org-capture-pomodoro (date)
  (interactive (list (org-read-date nil t)))
  (let ((start-time (format-time-string "%Y-%m-%d %a %H:%M" date))
        (pomodoro-time (format-time-string "%H:%M" (time-add
                                                    (date-to-time
                                                     (format-time-string "%Y-%m-%d %H:%M" date))
                                                    (seconds-to-time (* 25 60))))
                      ))
  (save-excursion
    (insert "<" (concat start-time "-" pomodoro-time) ">")
    )
  ))

;; pomodoro에서 하루동안 발생한 POMO를 #1 ==> 오늘날짜_1 같이 변경해주는 함수
(defun org-pomodoro-1day-done ()
  (interactive)
  (let ((string_regex (concat "%s/#/" (format-time-string "%y%m%d") "_/g")))
    (if (equal (buffer-name) "pomodoro.org")
        (evil-ex string_regex)
      (message "[-] you are not in pomorodo.org!")
    )
    ))

;; org 모드에서 latex을 쓰기 위한 prefix \[ {...} \] $ {...} $을 입력해주는 함수
(defun create_latex_prefix_align ()
  (interactive)
  (insert "\\begin{align} ")
  (insert "\\end{align}")
  (forward-char -11)
  )
(defun create_latex_prefix_dollar ()
  (interactive)
  (insert "$")
  (insert "$")
  (forward-char -1)
  )
(defun create_latex_prefix ()
  (interactive)
  (insert "\\[  ")
  (insert "\\]")
  (forward-char -3)
  )

;; C-c C-v 키로 .org 버퍼에서 .html 파일을 크롬으로 여는 함수
(defun org-html-open-chrome()
  (interactive)
  (browse-url-of-file (concat "./" (car (split-string (buffer-name) "\\.")) ".html"))
  )

(eval-after-load "mhtml-mode"
  (lambda()
    (define-key mhtml-mode-map (kbd "C-c 1") nil)
    (define-key mhtml-mode-map (kbd "C-c 2") nil)
    (define-key mhtml-mode-map (kbd "C-c 3") nil)
    (define-key mhtml-mode-map (kbd "C-c 4") nil)
))

;; org-capture가 끝나고 바로 방금 저장한 capture로 이동하는 함수
;; org-capture-after-finalize-hook에 등록해야 한다
(defun after-org-capture-goto-there()
  (interactive)
  (org-capture '(16))
  (if (string= (buffer-name) "pomodoro.org")  ;; pomodoro.org 인 경우 이동하지 않는다
      (switch-to-buffer (other-buffer (current-buffer) 1))
    nil)
)

;; ==, '', "" 를 입력할 때 바로 옆에 글을 쓰려고 하면 못 쓰는 경우가 있었는데 이를 방지하기 위한 함수
(defun escape-wrapped-word ()
  "escape == \"\" '' word in org mode by edward"
  (interactive)
  (insert " ")
  (right-char)
  (insert " ")
  (left-char)
  (left-char)
  (backward-delete-char-untabify 1)
  (right-char)
  (right-char)
  )

;; org 모드에서 번호 link를 편하게 생성하기 위한 함수 추가
(defun insert-number-of-link (num)
  (interactive "sEnter # of link: ")
  (insert (concat  "[[*#" num "][#" num "]]"))
  )

;; TODO ==> DONE과 같이 키워드를 한 번에 바꾸고 CLOSED:에 시간까지 추가해주는 함수
;; (defun org-todo-done-edward(arg)
;; ""
;; (interactive)
;; (cond ((string= arg "DONE") (org-todo "DONE"))
;;     ((string= arg "COMPLETE") (org-todo "COMPLETE"))
;;     ((string= arg "CLOSED") (org-todo "CLOSED"))
;;     (t (user-error "Error while doing org-todo-dopne-edward"))
;;     )
;; (save-excursion
;; (next-line)
;; (if (string-match-p "CLOSED:" (thing-at-point 'line t))  ;; 이미 CLOSED: 가 있는 경우
;;     (user-error "CLOSED: is already exists")
;;     (move-end-of-line 1)                                   ;; 없는 경우
;;     (insert " CLOSED: ")
;;     (move-end-of-line 1)
;;     (org-time-stamp-inactive '(16))
;;     ))
;; )

;; package: per-buffer-theme
;; (require 'per-buffer-theme)

;; package: org2jekyll
;; (require 'org2jekyll)

;; package: ycmd
;; (require 'ycmd)
;; (set-variable 'ycmd-server-command '("python3" "-u" "/media/data/gitrepo/ycmd/ycmd"))
;; (set-variable 'ycmd-global-config "/media/data/gitrepo/ycmd/examples/.ycm_extra_conf.py")
;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; (add-hook 'after-init-hook 'global-ycmd-mode)
;; (require 'company-ycmd)
;; (company-ycmd-setup)

;; org 모드가 실행되고 나서 설정하고 싶은 코드는 아래 작성한다
;; "org" because c-h f org-mode ret says that org-mode is defined in org.el
(eval-after-load "org"
  '(progn
     ;; comment(edward): 단축키 해제
     (define-key org-mode-map (kbd "<M-right>") nil)
     (define-key org-mode-map (kbd "<M-left>") nil)
     (define-key org-mode-map (kbd "<S-right>") nil)
     (define-key org-mode-map (kbd "<S-left>") nil)
     (define-key org-mode-map (kbd "<S-up>") nil)
     (define-key org-mode-map (kbd "<S-down>") nil)
     (define-key org-mode-map (kbd "C-k") nil)
     (define-key org-mode-map (kbd "C-y") nil)
     (define-key org-mode-map (kbd "q") nil)
     (define-key org-mode-map (kbd "<C-tab>") nil)
     (define-key org-mode-map (kbd "<C-S-left>") nil)
     (define-key org-mode-map (kbd "<C-S-right>") nil)
     (define-key org-mode-map (kbd "C-a") nil)
     (define-key org-mode-map (kbd "C-C /") nil)
     (define-key org-mode-map (kbd "C-,") nil)
     (define-key org-mode-map (kbd "C-c <up>") nil)
     (define-key org-mode-map (kbd "C-c <down>") nil)
     (define-key org-mode-map (kbd "C-c a") nil)
     (define-key org-mode-map (kbd "C-m") nil)
     (define-key org-mode-map (kbd "M-f") nil)
     (define-key org-mode-map (kbd "<C-down>") nil)
     (define-key org-mode-map (kbd "M-e") nil)
     (define-key org-mode-map (kbd "C-'") nil)
     (define-key org-mode-map (kbd "C-c C-q") nil)
     (define-key org-mode-map (kbd "M-h") nil)
     (define-key org-mode-map (kbd "C-c \\") nil)
     (define-key org-mode-map (kbd "C-e") nil)
     (define-key org-mode-map (kbd "C-c C-l") nil)
     (define-key org-mode-map (kbd "C-c C-o") nil)
     (define-key org-mode-map (kbd "C-c C-p") nil)
     (define-key org-mode-map (kbd "C-c l") nil)
     (define-key org-mode-map (kbd "C-c '") nil)
     (define-key org-mode-map (kbd "C-c ;") nil)
     (define-key org-mode-map (kbd "C-c C-k") nil)
     (define-key org-mode-map (kbd "C-j") nil)
     (define-key org-mode-map (kbd "C-c .") nil)
     (define-key org-mode-map (kbd "C-c -") nil)

     ;; comment(edward): 단축키 등록
     (define-key org-mode-map (kbd "<M-S-right>") 'org-shiftright)
     (define-key org-mode-map (kbd "<M-S-left>") 'org-shiftleft)
     (define-key org-mode-map (kbd "<M-S-up>") 'org-shiftup)
     (define-key org-mode-map (kbd "<M-S-down>") 'org-shiftdown)
     (define-key org-mode-map (kbd "<C-S-right>") 'org-metaright)
     (define-key org-mode-map (kbd "<C-S-left>") 'org-metaleft)
     ;; C-. 키로 어느곳에서나 todo.org 파일을 작성합니다
     (define-key org-mode-map (kbd "C-.") (lambda () (interactive)(org-capture nil ":")))

     ;; org-mode를 저장할 때마다 html로 preview를 보여주는 단축키
     (define-key org-mode-map (kbd "C-c w") 'org-preview-html/preview)
     ;; code ==> image Update 단축키
     (define-key org-mode-map (kbd "C-c q") 'org-toggle-inline-images)
     ;; org  ==> markdown export 단축키
     ;; (define-key org-mode-map (kbd "C-c m") 'org-md-export-to-markdown)
     ;; Shift + Enter 키로 현재 링크를 엽니다
     (define-key org-mode-map (kbd "<S-return>") 'org-open-at-point)
     ;; Ctrl + Shift + Enter 키로 원래 위치로 돌아갑니다
     (define-key org-mode-map (kbd "<C-S-return>") 'org-mark-ring-goto)
     ;; Alt + Enter 키로 org-meta-return키를 설정합니다 (원래 open-line으로 overriding 되어 있었다)
     (define-key org-mode-map (kbd "<M-return>") 'org-meta-return)
     ;; C-c v,b 키로 org-table 모드에서 열과 행을 추가합니다
     (define-key org-mode-map (kbd "C-c b") 'org-table-insert-row)
     (define-key org-mode-map (kbd "C-c v") 'org-table-insert-column)
     ;; C+/ 키로 현재 날짜를 입력합니다b
     (define-key org-mode-map (kbd "C-/") 'org-time-stamp)
     ;; C-? 키로 현재 날짜(+HH:MM)을 입력합니다
     (define-key org-mode-map (kbd "C-?") (lambda() (interactive)(org-insert-time-stamp (current-time) t)))
     ;; C+M+? 키로 agenda를 실행합니다
     (define-key org-mode-map (kbd "C-M-?") 'org-agenda)
     ;; C-down + M-f 키를 기본 cpp,python 파일에서와 같이 구문단위로 이동하도록 설정합니다
     ;; org.el에서 remap이 되어있던 코드를 주석처리하니 아래 두 코드가 정상작동한다
     (define-key org-mode-map (kbd "<C-down>") 'forward-paragraph)
     (define-key org-mode-map (kbd "M-f") 'forward-paragraph)
     ;; C-[ 키로 link를 삽입합니다
     (define-key org-mode-map (kbd "H-[") 'org-insert-link)
     ;; C-c C-[ 키로 org-pomodoro-1day-done 함수를 실행합니다
     (define-key org-mode-map (kbd "C-c H-[") 'org-pomodoro-1day-done)
     ;; C-c C-Enter 키로 체크박스를 ON/OFF 합니다
     (define-key org-mode-map (kbd "C-c C-RET") 'org-toggle-checkbox)
     ;; C-c l 키로 .org 파일에서 latex 수식을 변환합니다 (토글 형식)
     (define-key org-mode-map (kbd "C-c l") 'org-toggle-latex-fragment)
     ;; C-c C-l (or C-;,') 키로 .org 파일에서 latex 수식용 prefix를 생성합니다
     (define-key org-mode-map (kbd "C-c C-'") 'create_latex_prefix_align)
     (define-key org-mode-map (kbd "C-c C-;") 'create_latex_prefix_dollar)
     (define-key org-mode-map (kbd "C-c C-l") 'create_latex_prefix)
     ;; C-c C-v 키로 .org 파일에서 .html 파일 버전을 크롬으로 엽니다 (.html 이 있는 경우만)
     (define-key org-mode-map (kbd "C-c C-v") 'org-html-open-chrome)
     ;; org-mode에서 C-' 키로 tag를 설정합니다
     (define-key org-mode-map (kbd "C-'") 'org-set-tags)
     ;; C-c + ] 키로 cfw org calendar를 실행합니다.
     (define-key org-mode-map (kbd "C-c ]") 'cfw:open-org-calendar)
     ;; C-| 키로 org-mode에서 편하게 번호 link를 추가합니다
     (define-key org-mode-map (kbd "C-|") 'insert-number-of-link)
     ;; C-x + c 키로 다른 tree를 숨기고 현재 tree만 보여주는 명령을 실행합니다.
     (define-key org-mode-map (kbd "C-x c") (lambda() (interactive)
                                              (progn
                                                (outline-hide-other)
                                                (outline-show-subtree))))
     ;; C-c i 키로 org-mode에서 timestamp의 타입을 변경합니다.
     (define-key org-mode-map (kbd "C-c i") 'org-toggle-timestamp-type)

     ;; DONE 시에 CLOSED timestamp를 사용하는 설정
     (setq org-log-done 'time)

     ;; org-mode에서 이미지를 보여주는 설정
     ;; (setq org-startup-with-inline-images t)

     ;; src block에 syntax highlighting을 해주는 패키지
     (setq org-src-fontify-natively t)

     ;; org-mode를 시작할 때 unfold all
     ;;(setq org-inhibit-startup-visibility-stuff t)

     ;; org-mode에서 이미지 크기를 줄이기 위한 설정
     (setq org-image-actual-width nil)

     ;; tag가 달리는 위치 설정
     (setq org-tags-column 120)
     (setq org-startup-indented nil)

     ;; org-agenda view에서 하루가 지난 뒤까지 deadline이 없는 경우 계속 누적되지 않도록 설정
     (setq org-scheduled-past-days 0)
     (setq org-todo-keywords
           '(
             (sequence "TODO" "IN-PROGRESS" "|" "CANCELLED" "DELAYED" "INACTIVATE" "DONE")
             (sequence "MILESTONE" "|" "COMPLETE")
             (sequence "OPEN" "|" "CLOSED")
             )
           )
     ;; Setting Colours (faces) for todo states to give clearer view of work
     (setq org-todo-keyword-faces
           '(("CANCELLED" . "goldenrod")
             ("DELAYED" . "goldenrod")
             ("INACTIVATE" . "goldenrod")
             ("TODO" . "#86dc2f")
             ("MILESTONE" . "#86dc2f")
             ("OPEN" . "#86dc2f")
             ("DONE" . "#268bd2")
             ("COMPLETE" . "#268bd2")
             ("CLOSED" . "#268bd2")
             ))

     ;; org-item의 -를 bullet으로 변경하는 코드
     (font-lock-add-keywords 'org-mode
                             '(("^ +\\([-*]\\) "
                                (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
     (font-lock-add-keywords 'org-mode
                             '(("^ +\\([-*]\\) "
                                0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "‣")))
                               ("\\(->\\)"
                                0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "→")))))

     ;; org-bullets 모드 활성화
     (add-hook 'org-mode-hook (lambda () (org-bullets-mode t)))
     ;; wrap line
     (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
     ;; header 크기 변하지 않게
     (add-hook 'org-mode-hook 'my/org-mode-hook)

     ;; org mode에서만 font를 다르게 설정해주는 variable-pitch-mode를 실행합니다
     (add-hook 'org-mode-hook 'variable-pitch-mode)

     ;; org-link 에서 .pdf 파일은 foxit reader로 열도록 설정한다
     (setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "~/opt/foxitsoftware/foxitreader/FoxitReader \"%s\"")
        ("\\.pdf::\\([0-9]+\\)\\'" . "~/opt/foxitsoftware/foxitreader/FoxitReader \"%s\" -p %1")
        ))

     ;; 해당 폴더 내에 모든 .org 파일을 agenda view에 등록한다
     (setq org-agenda-files (append (file-expand-wildcards "~/gitrepo/ims_org/org_files/*.org") ))

     ;; org-mode 에서 latex 사용할 때 수식의 크기 설정
     (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))

     ;; orgg
     ;; org-capture에서 사용할 목록들 설정
     (setq org-capture-templates  '(("t" "assign todo" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/todo.org" "tasks")
                                    "*** TODO %i%?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")

                                    ("s" "assign todo in SLAMpaper" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/notes/slam-paper/slam-paper.org" "things to do")
                                    "* TODO %i%?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")

                                    ("a" "assign todo in atlas" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/notes/atlas-robotics/atlas.org" "todo")
                                    "*** TODO %i%?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")

                                    ("i" "assign issue in atlas" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/notes/atlas-robotics/atlas.org" "issue")
                                    "*** OPEN %i%?\n%(org-insert-time-stamp (org-read-date nil t \"\"))")

                                   ("u" "add ubuntu tip" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/notes/ubuntu_tips.org" "Ubuntu Tips")
                                    "*** %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n%?")

                                   ("k" "quick note" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/quick.org" "quick")
                                    "*** %i\n%(org-insert-time-stamp (org-read-date nil t \"\"))\n%?")

                                   ("m" "add milestone" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/milestone.org" "milestone")
                                    "*** MILESTONE %i%?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")

                                   ("d" "daily note" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/daily.org" "daily")
                                    "*** %?%i")

                                   ("1" "issue of edward" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/issues.org" "edward")
                                    "*** OPEN %i%?\n%(org-insert-time-stamp (org-read-date nil t \"\"))")
                                   ("2" "issue of DYROS" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/issues.org" "DYROS")
                                    "*** OPEN %i%?\n%(org-insert-time-stamp (org-read-date nil t \"\"))")
                                   ("3" "issue of SNU" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/issues.org" "SNU")
                                    "*** OPEN %i%?\n%(org-insert-time-stamp (org-read-date nil t \"\"))")
                                   ("4" "issue of ATLAS" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/issues.org" "ATLAS")
                                    "*** OPEN %i%?\n%(org-insert-time-stamp (org-read-date nil t \"\"))")
                                   ("5" "issue of emacs" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/issues.org" "EMACS")
                                    "*** OPEN %i%?\n%(org-insert-time-stamp (org-read-date nil t \"\"))")
                                   ("6" "issue of SNU" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/issues.org" "SNU")
                                    "*** OPEN %i%?\n%(org-insert-time-stamp (org-read-date nil t \"\"))")
                                   ))

     (setq org-refile-targets '((org-agenda-files :level . 1)))
     (setq org-agenda-log-mode-items '(closed clock state))
     ))
;; (add-to-ordered-list 'emulation-mode-map-alists '((org-mode . ,my-org-mode-map)) 0)

;; org-mode export에 관련된 설정 (deprecated)
;; org-publish 명령을 통해 아래 경로의 파일들을 원하는 경로(.../html/) 같은 곳에 변환할 수 있다
;; (setq org-publish-project-alist
;;       '(
;;         ("paper"
;;          :base-directory "~/gitrepo/ims_org/org_files/paper"
;;          :publishing-directory "~/gitrepo/ims_org/org_files/paper/"
;;          :base-extension "org"
;;          :publishing-function org-twbs-publish-to-html)
;;       ("note"
;;          :base-directory "~/gitrepo/ims_org/org_files/note"
;;          :publishing-directory "~/gitrepo/ims_org/org_files/note/"
;;          :base-extension "org"
;;          :publishing-function org-twbs-publish-to-html)
;;       ("emacs"
;;        :base-directory "~/gitrepo/ims_org/org_files/emacs"
;;        :publishing-directory "~/gitrepo/ims_org/org_files/emacs/"
;;        :base-extension "org"
;;        :publishing-function org-twbs-publish-to-html)
;;       ("STEM"
;;        :base-directory "~/gitrepo/ims_org/org_files/STEM"
;;        :publishing-directory "~/gitrepo/ims_org/org_files/STEM/"
;;        :base-extension "org"
;;        :publishing-function org-twbs-publish-to-html)
;;       ("link"
;;        :base-directory "~/gitrepo/ims_org/org_files/link"
;;        :publishing-directory "~/gitrepo/ims_org/org_files/link/"
;;        :base-extension "org"
;;        :publishing-function org-twbs-publish-to-html)
;;       ("all" :components ("paper" "note" "emacs" "STEM" "link"))))
(setq org-publish-project-alist
      '(("org-jekyll"
         ;; Path to org files.
         :base-directory "~/gitrepo/ims_org/org_files/blog/"
         :base-extension "org"

         ;; Path to Jekyll Posts
         :publishing-directory "~/gitrepo/tigerk0430.github.io/_posts"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t
         )))

;; Google Calendar와 연동하는 org-gcal 패키지 추가 & 세팅
(require 'org-gcal)
(setq package-check-signature nil)
(setq org-gcal-client-id "815785509878-3gn7mhcti240j6am59uk95s230n11172.apps.googleusercontent.com"
      org-gcal-client-secret "_bYrUIkY5zYh62fxGRtNryTj"
      org-gcal-file-alist '(("gyurse@gmail.com" .  "~/gitrepo/ims_org/org_files/gcal.org")))
;; agenda mode
(add-hook 'org-agenda-mode-hook (lambda ()
                                  ;; atlas1 계정에서는 gcal을 동기화하지 않습니다
                                  ;; (if (string= (user-login-name) "atlas1")
                                  ;;     nil
                                  ;;   (org-gcal-sync nil nil t)
                                  ;;   )

                                  ;; 키바인딩 해제
                                  (define-key org-agenda-mode-map (kbd "C-n") nil)
                                  (define-key org-agenda-mode-map (kbd "C-c C-o") nil)
                                  (define-key org-agenda-mode-map (kbd "C-c C-p") nil)

                                  ;; C-x [ ] 키로 org-agenda 목록을 보도록 설정합니다
                                  (define-key org-agenda-mode-map (kbd "C-x ]") 'org-agenda-list)
                                  (define-key org-agenda-mode-map (kbd "C-x [") 'org-todo-list)

                                  ;; x 키로 emacs 창을 minimize 합니다
                                  (define-key org-agenda-mode-map (kbd "x") 'suspend-frame)

                                  ;; Ctrl + s 키로 emacs 창을 minimize 합니다
                                  (define-key org-agenda-mode-map (kbd "C-s") 'org-save-all-org-buffers)

                                  ;; C-x + , 키로 projectile switch 함수를 실행합니다
                                  (define-key org-agenda-mode-map (kbd "C-x ,") 'helm-projectile-switch-project)

                                  ;; SPC 키로 helm-for-files를 실행합니다
                                  (define-key org-agenda-mode-map (kbd "SPC") 'helm-for-files)

                                  ;; tab 키로 해당 이벤트를 확인합니다
                                  (define-key org-agenda-mode-map (kbd "<tab>") 'org-agenda-show)

                                  ;; comment(edward): evil-mode의 키바인딩을 사용하기 위해 추가한 코드
                                  (define-key org-agenda-mode-map (kbd "j") 'org-agenda-next-line)
                                  (define-key org-agenda-mode-map (kbd "k") 'org-agenda-previous-line)
                                  (define-key org-agenda-mode-map (kbd "l") 'evil-forward-char)
                                  (define-key org-agenda-mode-map (kbd "h") 'evil-backward-char)

                                  ;; evil-scroll-down & up 을 설정합니다
                                  (define-key org-agenda-mode-map (kbd "C-u") 'evil-scroll-up)
                                  (define-key org-agenda-mode-map (kbd "C-d") 'evil-scroll-down)

                                  ;; tab 키로 해당 이벤트를 확인합니다
                                  (define-key org-agenda-mode-map (kbd "<tab>") 'org-agenda-show)

                                  ;; org-agenda-mode에서 C-' 키로 tag를 설정합니다
                                  (define-key org-agenda-mode-map (kbd "C-'") 'org-agenda-set-tags)

                                  ;; ' 키로 tag를 설정합니다
                                  (define-key org-agenda-mode-map (kbd "'") 'org-agenda-set-tags)
                                  (define-key org-agenda-mode-map (kbd "<M-S-right>") 'org-shiftright)
                                  (define-key org-agenda-mode-map (kbd "<M-S-left>") 'org-shiftleft)
                                  ))
;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

;; C-`' 키로 ==, '', "" 문자열 바로 옆에 글을 쓸 수 있도록 해주는 함수
(global-set-key (kbd "C-`") 'escape-wrapped-word)
;; C-\ 키로 org-capture를 실행합니다.
(global-set-key (kbd "C-\\") 'org-capture)
;; C-M-\ 키로 현재 날짜(+HH:MM)을 입력합니다
(global-set-key (kbd "C-M-\\") (lambda() (interactive)(org-insert-time-stamp (current-time) t)))
;; C-c + s 키로 특정 키워드를 검색합니다
(global-set-key (kbd "C-c s") (lambda() (interactive)(org-agenda nil "s")))
;; C-c + ] 키로 cfw org calendar를 실행합니다.
(global-set-key (kbd "C-c ]") 'cfw:open-org-calendar)
;; C-x [ ] 키로 org-agenda 목록을 보도록 설정합니다
(global-set-key (kbd "C-x ]") 'org-agenda-list)
(global-set-key (kbd "C-x [") 'org-todo-list)
;; C-c + # 키로 특정 파일을 엽니다
(global-set-key (kbd "C-c 1") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/todo.org")))
(global-set-key (kbd "C-c 2") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/quick.org")))
(global-set-key (kbd "C-c 3") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/milestone.org")))
(global-set-key (kbd "C-c 4") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/daily.org")))
(global-set-key (kbd "C-c 5") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/issues.org")))
(global-set-key (kbd "C-c 6") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/notes/ubuntu_tips.org")))
;; C-c 8,9 키로 .emacs .emacs_w 파일을 열도록 설정합니다
(global-set-key (kbd "C-c 8") (lambda() (interactive)(find-file "~/gitrepo/lockdpwn/zet_cetera/dot_files/.emacs_w")))
(global-set-key (kbd "C-c 9") (lambda() (interactive)(find-file "~/.emacs")))
(global-set-key (kbd "C-c 0") (lambda() (interactive)(find-file "~/gitrepo/lockdpwn/zet_cetera/dot_files/.emacs")))

;; C + ; 키로 org mode에서 링크를 타기 위한 단축키를 설정합니다
(global-set-key (kbd "C-;") 'org-store-link)
;; C-M-? 키로 어느곳에서나 agenda list를 엽니다
(global-set-key (kbd "C-M-?") 'org-agenda)
;; C-. 키로 gtags-based 코드 네비게이션을 합니다.
(global-set-key (kbd "C-.") 'helm-gtags-dwim)
;; C-> 키로 gtags-based 코드 네비게이션을 합니다.
(global-set-key (kbd "C->") 'helm-gtags-pop-stack)
;; C-, 키로 xref-based 코드 네비게이션을 합니다.
(global-set-key (kbd "C-,") 'xref-find-definitions)
;; C-< 키로 xref-based 코드 네비게이션을 합니다.
(global-set-key (kbd "C-<") 'xref-pop-marker-stack)

;; org-mode용 strike-through를 구현한 함수
(defun strike-through-for-org-mode ()
  (interactive)
  (beginning-of-line)  ;; 커서를 맨 앞으로 이동한다
  (save-excursion      ;; 아래 명령들이 실행하고 현재 커서 위치를 유지한다
    (if (string-prefix-p "*" (thing-at-point 'line t))  ;; 현재 커서 라인에 맨 앞에 * 가 있는 경우
        (progn
          (setq go_char (string-match "[ ]" (thing-at-point 'line t)))  ;; *가 있으면 빈칸까지 이동한 후 한 칸 앞에서 +를 추가해야한다
          (forward-char (+ go_char 1))
          (insert "+")   ;; + 키를 삽입한다
          (end-of-line)  ;; 문장의 맨 뒤로 이동한다
          (insert "+")   ;; + 키를 삽입한다
          )
      (if (string-match "[^ ]" (thing-at-point 'line t))  ;; 현재 커서가 있는 라인에 -,* 문자가 있는지 검사한다
          (progn
            (setq go_char (string-match "[^ ]" (thing-at-point 'line t)))  ;; 있으면 그 문자가 있는 커서의 좌표를 구한다
            (forward-char (+ go_char 2))  ;; 그 좌표로부터 2칸 앞으로 커서를 이동한다
            (insert "+")   ;; + 키를 삽입한다
            (end-of-line)  ;; 문장의 맨 뒤로 이동한다
            (insert "+")   ;; + 키를 삽입한다
            )
        (message "[-] Not Proper Position!")
        )
      )
    )
  )
(defun strike-through-for-org-mode-undo ()
  (interactive)
  (beginning-of-line)  ;; 커서를 맨 앞으로 이동한다
  (save-excursion      ;; 아래 명령들이 실행하고 현재 커서 위치를 유지한다
    (if (string-match "[+]" (thing-at-point 'line t))  ;; 현재 커서가 있는 라인에 + 문자가 있는지 검사한다
        (progn
          (setq go_char (string-match "[+]" (thing-at-point 'line t)))  ;; + 있으면 그 문자가 있는 커서의 좌표를 구한다
          (forward-char go_char)
          (delete-char 1)  ;; 앞에 + 지우고
          (end-of-line)
          (delete-char -1) ;; 뒤에 + 지운다
          )
      (message "[-] Not Proper Position!")
      )
    )
  )

;; org-mode에서 colored text를 사용하기 위해 추가한 코드
(add-to-list 'load-path "~/.emacs.d/load-path/org-colored-text/")
;; (require '{...} nil t)는 만약 이 패키지가 없어도 에러 구문을 내지 않는다는 의미
(require 'org-colored-text nil t)

;; COMMENT(edward): deprecated
;; (defun org-custom-link-img-export (path desc format)
;;   (cond
;;    ((eq format 'html)
;;     (format "<img src=\"/pictures/%s\" alt=\"%s\"/>" path desc))))

;; org source code block options for latex export
;; use minted and to exclude minted from latex preview, apply below code
;; https://orgmode.org/worg/org-tutorials/org-latex-preview.html
(add-to-list 'org-latex-packages-alist '("" "minted" nil))
(setq org-latex-listings 'minted)

;; Add the shell-escape flag
(setq org-latex-pdf-process '(
                              "pdflatex -interaction nonstopmode -output-directory %o %f"
                              ;; "bibtex %b"
                              "pdflatex -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -interaction nonstopmode -output-directory %o %f"
                              ))

;; Sample minted options.
(setq org-latex-minted-options '(
                                 ("frame" "lines")
                                 ("breaklines")
                                 ("fontsize" "\\scriptsize")
                                 ("xleftmargin" "\\parindent")
                                 ;;("linenos" "")
                                 ))
;;org-END=================================================================

;; PACKAGE: calfw
(require 'calfw)
(require 'calfw-org)

;; PACKAGE: smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; Alt + a 키로 괄호를 한 번에 지워주는 키를 설정합니다
;; (global-set-key (kbd "M-a") 'sp-splice-sexp)
;;(define-key c++-mode-map (kbd "M-a") 'sp-splice-sexp)

;; PACKAGE: comment-dwim
;; Alt + ' 키로 comment-dwim 명령어를 수행합니다
(global-set-key (kbd "M-'") 'comment-dwim)
;; (require 'evernote-mode)
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
;; (setq evernote-username "gyurse")
;; (setq evernote-developer-token "S=s1:U=94ad7:E=16b3c61dabe:C=163e4b0ad30:P=1cd:A=en-devtoken:V=2:H=25f588edfdb5ff0df834f685efa0e75b")

;; Package: undo-tree
;; GROUP: Editing -> Undo -> Undo Tree
(require 'undo-tree)
(global-undo-tree-mode)

(eval-after-load "undo-tree"
  (lambda ()
    (define-key undo-tree-map (kbd "C-r") nil)
    (define-key undo-tree-map (kbd "C-?") nil)
    (define-key undo-tree-map (kbd "C-/") nil)

    ;; C-M-?키로 org-agenda 명령을 수행합니다
    (define-key undo-tree-map (kbd "C-M-?") 'org-agenda)
    ))

;; for easy-jekyll mode
(setq easy-jekyll-basedir "~/gitrepo/tigerk0430.github.io/")
(setq easy-jekyll-url "https://tigerk0430.github.io")
(setq easy-jekyll-root "/home/edward/")
(setq easy-jekyll-previewtime "300")

(define-key global-map (kbd "C-c C-e") 'easy-jekyll)
;; (setq easy-jekyll-sshdomain "blogdomain")

;; path를 입력하면 GTAGS, TAGS 파일을 생성해주는 함수
(defun create_GTAGS_TAGS (&optional path)
  ""
  (interactive (list (read-directory-name "path to make GTAGS & TAGS : " default-directory)))
  (helm-gtags-create-tags path "default")
  (with-temp-buffer
    (shell-command (concat "find " (concat path) (concat " -print | etags - *.{cpp,h,c,cc,hpp,py,el}")) t))
  (rename-file "TAGS" (concat path "/TAGS"))
  (message "[+] Successfully created GTAGS & TAGS!")
  )

;; 현재 위치에서 GTAGS, TAGS 파일을 생성해주는 함수 (not used)
(defun create_GTAGS_TAGS_directly (&optional path)
  ""
  (interactive)
  (helm-gtags-create-tags default-directory "default")
  (with-temp-buffer
    (shell-command (concat "find " default-directory (concat " -print | etags - *.{cpp,h,c,cc,hpp,py,el}")) t)
    )
  )

;; revert buffer를 파라미터와 같이 함수화한 코드
(defun my-revert-buffer()
  (interactive)
  (revert-buffer t t t)
  (message "[+] reverted this buffer...")
  )

;; kill-this-buffer가 가끔 menu-bar-mode 때문에 실행되지 않는 경우가 있는데
;; 이를 방지하기 위해 직접 제작한 함수
(defun my-kill-this-buffer ()
  (interactive)
  (menu-bar-mode 1)
  (kill-this-buffer)
  (menu-bar-mode -1)
  )

;; multi-term + 화면분할 및 이동을 자동으로 해주는 함수 by edward
(defun my-multi-term ()
  (interactive)
  (setq num 1)
  (loop (< num 10)
        (let ((terminal_name (concat "*terminal<" (number-to-string num) ">*")))
          (if (get-buffer terminal_name)
              (if (eq (count-windows) 1)
                  (return (progn
                            (split-window-vertically)
                            (next-multiframe-window)
                            (switch-to-buffer terminal_name)
                            ))
                (return (progn
                          (next-multiframe-window)
                          (switch-to-buffer terminal_name)
                          ))
                )
            (if (eq (count-windows) 1)
                (progn
                  (split-window-vertically)
                  (next-multiframe-window)
                  (multi-term)
                  (switch-to-buffer terminal_name)
                  (return))
              (progn
                (next-multiframe-window)
                (multi-term)
                (switch-to-buffer terminal_name)
                (return))
              ))
          )
        (setq num (1+ num))
        ))


;; PACKAGE: evil
(require 'evil)
(evil-mode t)

;; evil 모드를 로딩한 후 설정
(eval-after-load "evil"
  (lambda ()
    ;; h,l 키로 단어를 이동할 때 커서가 맨 끝에 있는 경우 다음 라인으로 넘어가도록 설정한다
    (setq evil-cross-lines t)

    ;; 키바인딩 해제 ESC MODE
    (define-key evil-motion-state-map (kbd "C-b") nil)
    (define-key evil-motion-state-map (kbd "C-w") nil)
    (define-key evil-motion-state-map (kbd "C-f") nil)
    (define-key evil-motion-state-map (kbd "C-o") nil)
    (define-key evil-motion-state-map (kbd "C-z") nil)
    (define-key evil-motion-state-map (kbd "C-y") nil)
    (define-key evil-motion-state-map (kbd "C-e") nil)
    (define-key evil-motion-state-map (kbd "C-m") nil)
    (define-key evil-motion-state-map (kbd "C-p") nil)
    (define-key evil-motion-state-map (kbd "C-]") nil)
    (define-key evil-motion-state-map (kbd "C-6") nil)
    (define-key evil-motion-state-map (kbd "K") nil)
    (define-key evil-motion-state-map (kbd "TAB") nil)
    (define-key evil-motion-state-map (kbd "`") nil)
    
    ;; 키바인딩 해제 VISUAL MODE
    (define-key evil-visual-state-map (kbd "a") 'evil-exit-visual-state)
    (define-key evil-visual-state-map (kbd "\\") 'evil-exit-visual-state)

    ;; evil 모드에서 C-v 키로 visual block을 사용합니다.
    (define-key evil-motion-state-map (kbd "C-v") 'evil-visual-block)

    ;; evil 모드에서 e,E 키로 빠르게 단어를 highlight 합니다
    (define-key evil-motion-state-map (kbd "e") 'highlight-symbol)
    (define-key evil-motion-state-map (kbd "E") 'highlight-symbol-remove-all)

    ;; ` 키로 빠르게 단어 사이를 이동합니다
    (define-key evil-motion-state-map (kbd "`") 'avy-goto-word-0)

    ;; org-mode에서 t,T 키로 TODO DONE을 이동합니다
    (define-key evil-motion-state-map (kbd "t") 'org-shiftright)

    ;; C-x .키로 gtag, TAGS 파일을 생성합니다.
    (define-key evil-motion-state-map (kbd "C-x .") 'create_GTAGS_TAGS)

    ;; C-x t 키로 tabbar mode를 toggle합니다.
    (define-key evil-motion-state-map (kbd "C-x t") 'tabbar-mode)

    ;; C-x b 키로 buffer를 새로고침합니다
    (define-key evil-motion-state-map (kbd "C-x b") 'my-revert-buffer)

    ;; C-x / 키로 cmake 프로젝트를 컴파일합니다
    (define-key evil-motion-state-map (kbd "C-x /") 'cmake-ide-compile)

    ;; org-mode에서 ' 키로 tag를 설정합니다
    (define-key evil-motion-state-map (kbd "'") 'org-set-tags)

    ;; x 키로 emacs 창을 minimize 합니다
    (define-key evil-normal-state-map (kbd "x") 'suspend-frame)
    (define-key evil-motion-state-map (kbd "x") 'suspend-frame)

    ;; U 키로 redo 합니다.
    (define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)
    (define-key evil-motion-state-map (kbd "U") 'undo-tree-redo)

    ;; - 키로 dired 모드를 싱행합니다
    (define-key evil-motion-state-map (kbd "-") (lambda() (interactive)(dired "./")))

    ;; \ 키로 checkbox를 toggle합니다
    (define-key evil-motion-state-map (kbd "\\") 'org-toggle-checkbox)

    ;; SPC 키로 helm-for-files
    (define-key evil-motion-state-map (kbd "SPC") 'helm-for-files)
    (define-key evil-normal-state-map (kbd "SPC") 'helm-for-files)

    ;; , . 키로 forward, backward를 빠르게 이동합니다.
    (define-key evil-motion-state-map (kbd ",") 'forward-paragraph)
    (define-key evil-normal-state-map (kbd ",") 'forward-paragraph)
    (define-key evil-motion-state-map (kbd ".") 'backward-paragraph)
    (define-key evil-normal-state-map (kbd ".") 'backward-paragraph)

    ;; C-x , 키로 projectile switch 를 실행합니다
    (define-key evil-motion-state-map (kbd "C-x ,") 'helm-projectile-switch-project)
    (define-key evil-normal-state-map (kbd "C-x ,") 'helm-projectile-switch-project)

    ;; org-mode에서 c 키로 다른 tree들을 숨기고 현재 tree만 잘 보여줍니다
    (define-key evil-normal-state-map (kbd "C-c h") (lambda() (interactive)
                                                      (progn
                                                        (outline-hide-other)
                                                        (outline-show-subtree))))
    (define-key evil-motion-state-map (kbd "C-c h") (lambda() (interactive)
                                                      (progn
                                                        (outline-hide-other)
                                                        (outline-show-subtree))))

    ;; org-mode에서 q 키로 subtree를 엽니다
    (define-key evil-normal-state-map (kbd "q") 'org-show-subtree)

    ;; org-mode에서 {, }키로 커서의 라인을 strikethrough 처리합니다.
    (define-key evil-motion-state-map (kbd "{") 'strike-through-for-org-mode)
    (define-key evil-normal-state-map (kbd "{") 'strike-through-for-org-mode)
    (define-key evil-motion-state-map (kbd "}") 'strike-through-for-org-mode-undo)
    (define-key evil-normal-state-map (kbd "}") 'strike-through-for-org-mode-undo)

    ;; 키바인딩 해제 INSERT MODE
    (define-key evil-insert-state-map (kbd "C-b") nil)
    (define-key evil-insert-state-map (kbd "C-d") nil)
    (define-key evil-insert-state-map (kbd "C-w") nil)
    (define-key evil-insert-state-map (kbd "C-f") nil)
    (define-key evil-insert-state-map (kbd "C-o") nil)
    (define-key evil-insert-state-map (kbd "C-z") nil)
    (define-key evil-insert-state-map (kbd "C-t") nil)
    (define-key evil-insert-state-map (kbd "C-y") nil)
    (define-key evil-insert-state-map (kbd "C-e") nil)
    (define-key evil-insert-state-map (kbd "C-a") nil)
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-k") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil)
    (define-key evil-insert-state-map (kbd "C-v") nil)

    ;; 키바인딩 해제 NORMAL MODE
    (define-key evil-normal-state-map (kbd "C-t") nil)
    (define-key evil-normal-state-map (kbd "C-n") nil)
    (define-key evil-normal-state-map (kbd "C-p") nil)
    (define-key evil-normal-state-map (kbd "H-[") nil)
    (define-key evil-normal-state-map (kbd "C-.") nil)
    (define-key evil-normal-state-map (kbd "z") nil)
    (define-key evil-normal-state-map (kbd "x") nil)
    (define-key evil-normal-state-map (kbd "J") nil)
    (define-key evil-normal-state-map (kbd "M-.") nil)
    (define-key evil-normal-state-map (kbd "<insert>") nil)

    ;; 키바인딩 설정 ESC MODE
    ;; C-u 키로 page up 키를 설정합니다
    (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)

    (define-key evil-motion-state-map (kbd "C-v") 'evil-visual-block)

    ;; Alt + e 키로 line의 맨 앞으로 이동합니다.
    (define-key evil-insert-state-map (kbd "M-e") 'move-beginning-of-line)
    ))

;; evil-mode로 인해 사용하지 않는 전역 키바인딩을 해제합니다
;; Ctrl
(global-set-key (kbd "C-u") nil)
(global-set-key (kbd "C-j") nil)

;; for compilation mode
(defun my-compilation-mode-hook ()
     ;; Jump at the right column even for tab indentation
     (define-key compilation-mode-map (kbd "<SPC>") 'helm-for-files)
     )
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

(defun newline-without-break-of-line ()
  "1. move to end of the line, 2. insert newline with index."
  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))

(defun newline-without-break-of-line-upper ()
  "1. move to end of the line, 2. insert newline with index above."
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (open-line 1)))

;; Ctrl + F 키를 누르면 자동으로 빈 라인이 하나 만들어집니다 (vim의 o키와 동일합니다)
(global-set-key "\C-f" 'newline-without-break-of-line)

;; Ctrl + G 키를 누르면 원하는 라인으로 이동하는 명령어를 실행합니다
(global-set-key "\C-g" 'goto-line)

;; Ctrl + O 키를 누르면 자동으로 한 줄 위에 빈 라인이 하나 만들어집니다
(global-set-key "\C-o" 'newline-without-break-of-line-upper)


;; Crtl + e 키로 현재 커서의 라인 맨 앞칸으로 이동합니다
(global-set-key (kbd "C-e") 'move-end-of-line)
(add-hook 'c-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-e") 'move-end-of-line))
          )
(add-hook 'c++-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-e") 'move-end-of-line))
          )

;; Alt + e 키로 현재 커서의 라인 맨 뒤칸으로 이동합니다
(global-set-key (kbd "M-e") 'move-beginning-of-line)
(add-hook 'c-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-e") 'move-beginning-of-line))
          )
(add-hook 'c++-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-e") 'move-beginning-of-line))
          )

;; Ctrl + w 키로 helm-find-files 명령을 실행합니다
(global-set-key (kbd "C-w") 'helm-find-files)

;; PACKAGE: image+
(require 'image+)
(imagex-global-sticky-mode t)
;; (eval-after-load "image+"
;;   (lambda ()
;;     ;; C-c = 키로 이미지를 확대한다
;;     (define-key imagex-sticky-mode-map (kbd "C-c =") 'imagex-sticky-zoom-in)
;;     ;; C-+ 키로 이미지 크기를 자동조정한다
;;     (define-key imagex-sticky-mode-map (kbd "C-+") 'imagex-auto-adjust-mode)
;;     ))

;;PACKAGE: minimap
;; C-c m 키로 minimap-mode를 토글합니다.
(global-set-key (kbd "C-c m") 'minimap-mode)

;; Package: yasnippet
;; ~/.emacs.d/elpa/yasnippet-.../snippets 에 있는 파일들을 ~/.emacs.d/snippets 에 넣어야 정상적으로 동작합니다
(require 'yasnippet)
(yas-global-mode t)
(setq warning-suppress-types nil)
;; yasnippet에 elisp 함수를 쓰면 나타나는 경고문을 무시합니다
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))


;; PACKAGE: anzu
(require 'anzu)
(global-anzu-mode)

;; M-% 키로 해당 buffer에서 특정 단어를 바꿉니다
(global-set-key (kbd "M-%") 'anzu-query-replace)
;; C-M-% 키로 정규표현식을 이용한 단어치환을 합니다
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; PACKAGE: duplicate-thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

;; PACKAGE : flycheck
(require 'flycheck)
;; c++11에 안맞는 문법이 있을경우(range-based loop 등) 경고 메세지를 띄우는데 이를 무시한다
(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-gcc-language-standard "c++11")
            (setq flycheck-clang-language-standard "c++11")
            ))

;; ROS를 사용하는 경우 flycheck #include <ros/ros.h>가 나지 않도록 추가한 코드
(setq flycheck-clang-include-path (list (expand-file-name "/opt/ros/kinetic/include")))


;; emacs syntax warning + error 들을 무시합니다
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  )

;; PACKAGE: which-key
(require 'which-key)
;; 단축키 입력시 하단에서 목록을 보여주는 모드
(which-key-mode)

;; PAKCAGE: htmlize
(require 'htmlize)
(setq org-html-htmlize-output-type 'css) ; default: 'inline-css

;; PACKAGE: avy
(require 'avy)

;; PACKGE: eyebrowse
(require 'eyebrowse)
(eyebrowse-mode t)

;; C + 1,2,3을 누를때마다 워크스테이션을 생성한다
(setq eyebrowse-new-workspace t)
(setq eyebrowse-wrap-around t)
(setq eyebrowse-switch-back-and-forth t)
(setq eyebrowse-new-workspace nil)
(setq eyebrowse-mode-line-style (quote always))


(setq custom-safe-themes t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'spacemacs-dark t)
(load-theme 'zenburn t)
;; (load-theme 'gruvbox-dark-soft t)  ;; comment(edward): gruvbox conflicts with tabbar-mode & git-gutter face. So, i removed faces in gruvbox.el and recompile it.



;; elisp, lisp 모드에서만 rainbow-delimiters를 활성화합니다
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)


;; PACKAGE: flymd
;; markdown 언어를 볼 수 있게 해주는 패키지 (not used)
;; (require 'flymd)
;; markdown을 파이어폭스에서 실행하도록 하는 코드
;; (defun my-flymd-browser-function (url)
;;    (let ((browse-url-browser-function 'browse-url-firefox))
;;      (browse-url url)))
;; (setq flymd-browser-open-function 'my-flymd-browser-function)


;; PACKAGE: wrap-region
(require 'wrap-region)
;; (wrap-region-global-mode t)

;; org 모드에서 + wrapping을 해준다
(wrap-region-add-wrapper "+" "+" nil 'org-mode)  ; strikethrough

;; PACKAGE: latex-mode, tex-mode, bibtex-mode
(eval-after-load "tex-mode"
  '(progn
     ;; comment(edward): 단축키 해제
     (define-key latex-mode-map (kbd "C-c C-o") nil)
     (define-key latex-mode-map (kbd "C-c C-p") nil)

     ;; C-c C-v 키로 한번에 latex bibtex latex latex 컴파일을 수행합니다.
     (define-key latex-mode-map (kbd "C-c C-v") (lambda ()
                                                  (interactive)
                                                  (tex-compile (file-name-directory buffer-file-name) (concat "pdflatex " (file-name-nondirectory (buffer-file-name))))
                                                  (tex-compile (file-name-directory buffer-file-name) (concat "bibtex --min-crossref=100 " (file-name-nondirectory (file-name-sans-extension (buffer-file-name)))))
                                                  (tex-compile (file-name-directory buffer-file-name) (concat "pdflatex " (file-name-nondirectory (buffer-file-name))))
                                                  (tex-compile (file-name-directory buffer-file-name) (concat "pdflatex " (file-name-nondirectory (buffer-file-name))))
                                                  ))
     ))

(eval-after-load "bibtex"
  '(progn
     ;; comment(edward): 단축키 해제
     (define-key bibtex-mode-map (kbd "C-c C-o") nil)
     (define-key bibtex-mode-map (kbd "C-c C-p") nil)
     ))

;; PACKAGE: doc-view-mode
;; comment(edward): linum-mode가 있으면 pdf viewer가 매우 느려진다
(add-hook 'doc-view-mode-hook (lambda () (linum-mode -1)))

;; 해당 옵션을 추가하지 않으면 latex preview 도중 계속 "Error running timer `doc-view-display': (error "Selecting deleted buffer") 에러가 발생한다.
(cancel-function-timers 'doc-view-display)

;; comment(edward): image도 마찬가지
(add-hook 'image-mode-hook (lambda () (linum-mode -1)))

;; PACKAGE: highlight-indentation
(require 'highlight-indentation)
;;(add-hook 'python-mode-hook 'highlight-indentation-mode)
;;(add-hook 'js2-mode-hook 'highlight-indentation-mode)
;; (set-face-font 'highlight-indentation-face "Monospace")
;; (set-face-background 'highlight-indentation-face "#0d0d0d")
;; (set-face-attribute 'highlight-indentation-face nil :height 54)

;; PACKAGE: which-func
;; 현재 라인이 가리키고 있는 함수를 위에 상태창에 표시합니다
(require 'which-func)
;;(add-to-list 'which-func-modes 'ruby-mode)
;;(add-to-list 'which-func-modes 'cc-mode)
;;(add-to-list 'which-func-modes 'emacs-lisp-mode)
(setq which-func-unknown "n/a")
(which-function-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
      ;; We remove Which Function Mode from the mode line, because it's mostly
      ;; invisible here anyway.
      (assq-delete-all 'which-func-mode mode-line-misc-info))

;; PACKAGE: git-gutter
;; git gutter 모드를 사용해 수정된 라인을 하이라이팅한다
(global-git-gutter-mode t)
;; linum-mode와 겹쳐서 linum이 안보이는 문제를 해결하기 위해 코드 추가
;; (git-gutter:linum-setup)
;; (setq git-gutter:window-width 1)

;; custom 모양 및 색상 추가
(set-face-foreground 'git-gutter:modified "yellow")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")
;; C-c + g 키로 git gutter에서 수정된 부분을 뒤로 돌릴건지 물어보는 명령어를 실행합니다
(global-set-key (kbd "C-c g") 'git-gutter:revert-hunk)


;; PACKAGE: iedit
(require 'iedit)
;; iedit mode가 시작되고 실행되는 코드
(eval-after-load "iedit"
  (lambda()
    ;; iedit 모드에서 `키로 선택 해제를 합니다 (default: M-;)
    (define-key iedit-mode-keymap (kbd "<delete>") 'iedit-toggle-selection)
    (define-key iedit-mode-occurrence-keymap (kbd "<delete>") 'iedit-toggle-selection)
    ))


;; PACKAGE: wgrep
(require 'wgrep)

;; PACKAGE: rvm
;; Ruby 관련된 패키지 설정들
;; 1. 처음 루비 파일을 연 다음 C-c C-s를 누르면 inf-ruby (irb) 창이 열립니다
;; 2. 이 때 다시 한 번 C-c C-s를 눌러 robe start 명령어를 실행합니다
;; 3. C-c C-c 를 눌러 irb 창을 닫습니다.
;; 그 다음부턴 원하는 함수, 변수의 자동완성과 jump 기능을 사용할 수 있습니다
(require 'rvm)
(rvm-use-default)
(defadvice inf-ruby-console-auto
    (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;;(eval-after-load 'company
;; '(push 'company-robe company-backends))
;;(require 'rinari)
;;(require 'ido)
;;(ido-mode)
;;(require 'rhtml-mode)
;;(global-rinari-mode)
;;(add-hook 'rhtml-mode-hook
;;	  (lambda () (rinari-launch)))
;;(setq rinari-tags-file-name "TAGS")
;;(add-hook 'ruby-mode-hook 'rinari-launch)

(add-hook 'ruby-mode-hook
          (lambda ()
            ;;(local-set-key (kbd "<tab>") 'company-robe)
            (local-set-key (kbd "C-c C-s") 'inf-ruby-console-auto)))

(add-hook 'inf-ruby-mode-hook
          (lambda()
            (local-set-key (kbd "C-c C-s") 'robe-start)
            ;; (local-set-key (kbd "C-c C-c") 'delete-window)
            ))

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
;;(add-hook 'ruby-mode-hook 'company-mode)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; Package: clean-aindent-mode
;; (require 'clean-aindent-mode)
;; (add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

;; helm-projectile-switch-project로 프로젝트를 바꾼 다음 실행하는 명령어로 바뀐 프로젝트의 홈폴더에서 dired 모드를 실행합니다
(setq projectile-switch-project-action 'projectile-dired)

;; 현재 경로를 projectile project로 추가하는 함수 by edward
(defun add-current-project-to-projectile ()
  (interactive)
  (write-region "" "" ".projectile")
  (projectile-add-known-project default-directory)
  (message (concat "[+] This Project has added to projectile!: " default-directory))
  )

;; PACKAGE: helm-projectile
(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

;; highlight symbol mode를 활성화합니다
(require 'highlight-symbol)
(add-hook 'c-mode-hook 'highlight-symbol-mode)
(add-hook 'c++-mode-hook 'highlight-symbol-mode)
(add-hook 'python-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)

;; hs-minor-mode 를 활성화합니다. 코드를 접엇다 펼쳤다 하는 모드
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; PACKAGE: multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; multi-term은 term-mode를 사용한다
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-b") nil)
            (define-key term-raw-map (kbd "C-q") nil)
            (define-key term-raw-map (kbd "<S-insert>") nil)

            (define-key term-raw-map (kbd "C-b") 'helm-for-files)
            (define-key term-mode-map (kbd "C-b") 'helm-for-files)
            ))

;; C-c u 키로 cua-mode를 On/Off합니다.
;; multi-term을 사용하면 .cpp 버퍼에서 C-c : copy(cua-mode)가 안먹히는 버그가 있는데 이 때 사용하기 위한 단축키
(global-set-key (kbd "C-C u") (lambda ()
                                (interactive)
                                (if (bound-and-true-p cua-mode)
                                  (progn
                                    (cua-mode -1)
                                    (message "[+] cua-mode disabled")
                                    )
                                  (progn
                                    (cua-mode 1)
                                    (message "[+] cua-mode enabled")
                                    )
                                  )
                                ))

;; PACKAGE: smart-mode-line
;; sml 2018버전 패키지가 multi-term하고 충돌하는 오류가 발생한다. 2019 버전부터는 수정된듯
(sml/setup)

;; C-n C-S-n 키로 새로운 frame을 만들고 제거합니다
(global-set-key (kbd "C-n") 'make-frame-command)
(global-set-key (kbd "C-S-n") 'delete-frame)


;; PACKAGE: protobuf-mode
(require 'protobuf-mode)

;; 다중모니터에서 C-x-5-2를 통해서 새로운 frame을 생성한 다음에 모니터가 작아서 폰트사이즈가 작은 경우 폰트크기를 크게하기 위해 설정한 함수
;; https://stackoverflow.com/questions/24705984/increase-decrease-font-size-in-an-emacs-frame-not-just-buffer
(defun zoom-frame (&optional n frame amt)
  "Increase the default size of text by AMT inside FRAME N times.
  N can be given as a prefix arg.
  AMT will default to 10.
  FRAME will default the selected frame."
  (interactive "p")
  (let ((frame (or frame (selected-frame)))
        (height (+ (face-attribute 'default :height frame) (* n (or amt 5)))))
    (set-face-attribute 'default frame :height height)
    (message "Set frame's default text height to %d." height)))

(defun zoom-frame-out (&optional n frame amt)
  "Call `zoom-frame' with -N."
  (interactive "p")
  (zoom-frame (- n) frame amt))

(defun set-frame-custom (&optional num)
  "Increase the default size of text by AMT inside FRAME N times.
  N can be given as a prefix arg.
  AMT will default to 10.
  FRAME will default the selected frame."
  (interactive "p")
  (let ((frame (selected-frame)))
    (set-face-attribute 'default frame :height (string-to-number num))
    (message (concat "Set frame's default text height to " num))))

;; C + <f1><f2> keybinding set
(global-set-key (kbd "C-<f1>") 'projectile-add-known-project)
(global-set-key (kbd "C-<f2>") 'projectile-remove-known-project)
;; C + <f#> 키로 새로 생성한 프레임의 폰트가 작을 경우 크기를 키우거나 줄일 수 있다
(global-set-key (kbd "C-<f5>") '(lambda () (interactive) (set-frame-custom "93")))
(global-set-key (kbd "C-<f6>") '(lambda () (interactive) (set-frame-custom "103")))
(global-set-key (kbd "C-<f7>") '(lambda () (interactive) (set-frame-custom "110")))
(global-set-key (kbd "C-<f8>") '(lambda () (interactive) (set-frame-custom "120")))
(global-set-key (kbd "C-<f9>") '(lambda () (interactive) (set-frame-custom "130")))
(global-set-key (kbd "C-<f10>") '(lambda () (interactive) (set-frame-custom "140")))

(global-set-key (kbd "C-=") 'zoom-frame)
(global-set-key (kbd "C--") 'zoom-frame-out)
(define-key c++-mode-map (kbd "C-=") 'zoom-frame)
(define-key c++-mode-map (kbd "C--") 'zoom-frame-out)

;;GUI 환경에서 시작 시 창 화면 최대화 하기
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))(add-to-list 'default-frame-alist '(height . 31))
;; (add-to-list 'default-frame-alist '(width . 100))
; (setq frame-title-format "")
;; hide titlebar (not working at initial booting)
;; https://www.reddit.com/r/emacs/comments/7wc2to/is_it_possible_to_disable_window_decorations_in/
; (set-frame-parameter nil 'undecorated t)
; (set-frame-position (selected-frame) 0 0)

;; 매칭되는 괄호 강조하기
;;show paren mode
(show-paren-mode 1)
(setq show-paren-delay 0)

;; 시작화면 스킵하고 기본 모드 설정하기
(setq inhibit-startup-screen t)

;; 상태표시줄에 시간표시하기
(display-time)

;; 몇가지 유용한 설정
(transient-mark-mode t)
(global-set-key [C-kanji] 'set-mark-command)

;; PACKAGE: pomodoro
;; 일정관리를 위한 Pomodoro Timer 패키지
(require 'pomodoro)
(pomodoro-add-to-mode-line)

(defun pomodoro-start-edward ()
  (interactive)
  (pomodoro-start nil)
  ;;(org-capture nil "o")
  )

;; 일반적인 timer
(defun pomodoro-custom-edward (time)
  (interactive "sEnter the custom time: ")
  (pomodoro-custom (string-to-number time))
)

;; C-c C-o,p 키로 타이머를 시작, 중지합니다, C-c C-9,0 키로 중지, 재개합니다
(global-set-key (kbd "C-c C-o") 'pomodoro-start-edward)
(global-set-key (kbd "C-c C-p") 'pomodoro-stop)
(global-set-key (kbd "C-c C-9") '(lambda ()
                                   (interactive)
                                   (pomodoro-pause)
                                   (message "[+] Pomodoro Paused!")
                                   ))
(global-set-key (kbd "C-c C-0") '(lambda ()
                                   (interactive)
                                   (pomodoro-resume)
                                   (message "[+] Pomodoro Resumed!")
                                   ))
(add-hook 'c++-mode-hook (lambda ()
                           (define-key c++-mode-map (kbd "C-c C-o") 'pomodoro-start-edward)
                           (define-key c++-mode-map (kbd "C-c C-p") 'pomodoro-stop)
                           ))
(add-hook 'python-mode-hook (lambda ()
                             (define-key python-mode-map (kbd "C-c C-p") 'pomodoro-stop)
                             ))

(global-set-key (kbd "C-c C-]") 'pomodoro-custom-edward)


;;파일 편집 위치 기억
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file     "~/_places.sav")

;;최근 파일 접근
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 20) ; 최근 파일 목록 수

;;GUI 환경에서 줄 간격 조절
(setq-default line-spacing 1)

;;파일이 수정되었을 때 자동으로 다시 읽어들이도록 하는 설정
(global-auto-revert-mode t)

;;linum 모드 켜기 (줄번호 표시하기)
;; linum-mode는 너무 느려서 nlinum 모드로 변경했다
;; (global-linum-mode t)
;; (global-nlinum-mode t)
(global-display-line-numbers-mode)

;; 계산기 자릿수 분리기호 삽입 calc EMACS 기본 계산기 모드에서 자릿수 분리기호 삽입
(setq calc-group-digits t)

;;시작 화면 메세지 끄기
(setq initial-scratc-message "")

;;시작 모드를 text모드로 시작하기. 보통은 LISP Interaction 상태.
(setq initial-major-mode 'emacs-lisp-mode)

;;블럭 선택부분 색상 반전시키기
(setq-default transient-mark-mode t)

;;status bar에 줄 번호, 칼럼 번호 표시
(setq line-number-mode t)
(setq column-number-mode t)

;;백업파일 만들지 않기, ( #Readmin.md# )
(setq make-backup-files nil)

;;자동 저장 기능 끄기  ( Readme.md~ )
(setq auto-save-default nil)

;; interlocking 파일 생성 끄기 ( .#Readme.md )
(setq create-lockfiles nil)

;; 모든 자동저장, 백업파일을 tmp 폴더에 만들기
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;;하단 스크롤시에 빈 줄 추가 하지 않기.
;;보통은 스크롤이 맨 끝까지 가면 자동으로 빈 줄이 추가 된다.
(setq next-line-add-newlines nil)

;;하단 스크롤시 1줄씩만 스크롤 되도록 하기.
(setq scroll-step 1)

;;페이지 넘길 때 3줄은 포함.
(setq next-screen-context-lines 3)

;;찾기 기능에서 하이라이트 설정
(setq search-highlight t)

;;상단 메뉴 숨기기
(menu-bar-mode 0)

;; Current Line Highlighting
(global-hl-line-mode t)

;;도구 모음 숨기기
(tool-bar-mode 0)

;;스크롤바 숨기기
(scroll-bar-mode 0)

;;줄 바꿈 칼럼수 설정.
(setq-default fill-column 120)

;;날짜 삽입하기. 편집 할 때
(defun today ()
  "Insert Date YYYY-MM-DD"
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

;;날짜 삽입 단축키 (편집 시)
(global-set-key "\M-\pd" 'today)

;;날짜 삽입하기. 저장 할 때
(defun today1 ()
  "Insert Date YYMMDD00"
  (interactive)
  (insert (format-time-string "%y%m%d00")))

;;Dired모드에서 디렉토리 우선 정렬로 보기 (기본은 지원 안함)
(defun sof/dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2)
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'sof/dired-sort)


;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)

(add-hook 'dired-mode-hook 'variable-pitch-mode)

;; refer: https://stackoverflow.com/a/20302565/7402755
(defun dired-new-file ()
(interactive)
  (let* (
      (n 0)
      lawlist-filename
      (dired-buffer-name (buffer-name)))
    (catch 'done
      (while t
        (setq lawlist-filename (concat ".dir-locals"
          (if (= n 0) "" (int-to-string n))
            ".el"))
        (setq n (1+ n))
        (if (not (file-exists-p lawlist-filename))
          (throw 'done nil)) ))
    (message "[b]uffer + file (maybe) | [f]ile + buffer (maybe)")
    (let ((file-or-buffer (read-char-exclusive)))
      (cond
        ((eq file-or-buffer ?b)
          (switch-to-buffer (get-buffer-create lawlist-filename))
          (text-mode)
          (or (y-or-n-p (format "Save Buffer `%s'? "lawlist-filename))
            (error "Done."))
          (write-file lawlist-filename)
          (with-current-buffer dired-buffer-name
            (revert-buffer)))
        ((eq file-or-buffer ?f)
          (start-process "touch-file" nil "touch" lawlist-filename)
          (revert-buffer))
        (t (message "You have exited the function.")) ))))

;; dired mode에서 여러 단축키들을 설정하는 코드
(eval-after-load "dired"
  '(progn
     ;; dired mode : Move to the parent directory
     (define-key dired-mode-map "a"
       (lambda ()
         (interactive)
         (find-alternate-file "..")))

     ;; ` 키로 빠르게 단어 사이를 이동합니다
     (define-key dired-mode-map "`" 'avy-goto-word-0)

     ;; dired mode 관련 단축키들을 추가했다
     ;; dired mode : Emacs's adaption of find
     (define-key dired-mode-map "F" 'find-name-dired);

     ;; dired mode : Move up and down
     (define-key dired-mode-map "j" 'dired-next-line)
     (define-key dired-mode-map "k" 'dired-previous-line);

     ;; dired mode : Jump to a file with ido
     (define-key dired-mode-map "i" 'ido-find-file)

     ;; dired mode 에서 chmod를 바로 수행하고 싶을 경우 M키를 눌러서 합니다
     (define-key dired-mode-map "M" 'chmod)

     ;; dired mode 에서 X키로 마크한 파일들을 삭제합니다
     (define-key dired-mode-map "X" 'dired-do-flagged-delete)

     ;; dired mode 에서 x키로 최소화를 수행합니다
     (define-key dired-mode-map (kbd "x") 'suspend-frame)

     ;; dired mode 에서 SPC키로 helm-for-files를 실행합니다
     (define-key dired-mode-map (kbd "SPC") 'helm-for-files)

     ;; C-x - 키로 gtags, etags를 생성하는 명령어들을 실행합니다
     (define-key dired-mode-map (kbd "C-x -") 'create_GTAGS_TAGS)

     ;; tab 키로 커서가 가리키고 있는 파일을 임시적으로 봅니다
     (define-key dired-mode-map (kbd "<tab>") 'dired-display-file)

     ;; . 키로 .dir-locals.el 파일을 생성합니다.
     (define-key dired-mode-map (kbd ".") 'dired-new-file)

     ;; n,N 키로 evil-search 다음 단어로 이동합니다.
     (define-key dired-mode-map (kbd "n") 'evil-search-next)
     (define-key dired-mode-map (kbd "N") 'evil-search-previous)
     ))

;; 엔터 입력시 자동 들여쓰기 다른 방법
(load "cc-mode")
(define-key c++-mode-map "\r" 'reindent-then-newline-and-indent)
(define-key c-mode-map "\r" 'reindent-then-newline-and-indent)
(define-key java-mode-map "\r" 'reindent-then-newline-and-indent)

;;emacs tab 설정
(setq c-basic-offset 4
      tab-width 4
      indent-tabs-mode t)

;; 탭 대신 공백 넣기
(setq-default indent-tabs-mode nil)

;;최근 사용된 word list를 가지고, 자동 완성구현, 3글자 이후에 M-RET
(dynamic-completion-mode)

(require 'cmake-ide)
(require 'rtags)
(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

;; package: eldoc
(use-package eldoc :ensure t :pin melpa :diminish eldoc-mode)

;;; Rtags + Eldoc:
;; https://github.com/Andersbakken/rtags/issues/987
(defun fontify-string (str mode)
  "Return STR fontified according to MODE."
  (with-temp-buffer
    (insert str)
    (delay-mode-hooks (funcall mode))
    (font-lock-default-function mode)
    (font-lock-default-fontify-region
     (point-min) (point-max) nil)
    (buffer-string)))

(defun rtags-eldoc-function ()
  (let ((summary (rtags-get-summary-text)))
    (and summary
         (fontify-string
          (replace-regexp-in-string
           "{[^}]*$" ""
           (mapconcat
            (lambda (str) (if (= 0 (length str)) "//" (string-trim str)))
            (split-string summary "\r?\n")
            " "))
          major-mode))))

(defun rtags-eldoc-mode ()
  (interactive)
  (setq-local eldoc-documentation-function #'rtags-eldoc-function)
  (eldoc-mode 1))

(add-hook 'c-mode-hook 'rtags-eldoc-mode)
(add-hook 'c++-mode-hook 'rtags-eldoc-mode)

;; PACKAGE: mic-paren
;; 반대편 괄호의 line number를 알려주는 패키지
(require 'mic-paren) ; loading
(paren-activate)     ; activating
;; offscreen parenthesis의 경우 반대쪽 괄호의 라인정보를 알려준다
(setq paren-message-show-linenumber "absolute")

(defun set-default-programming-style ()
  ;; 엔터 입력시 들여쓰기
  (local-set-key (kbd "<return>") 'newline-and-indent)

  ;; 탭키 입력시 영역지정되어 있으면 영역 들여쓰기. 영역없으면 탭키.
  (local-set-key (kbd "<tab>") 'indent-block)

  ;; 들여쓰기 할 때 실제 탭문자 입력
  (setq indent-tabs-mode t)

  ;; 탭 사이즈 4
  (setq tab-width 4)

  ;; 줄번호 표시
  (linum-mode 1)
  )

;; PACKAGE: ECB Emacs Code Browser
(require 'ecb)

;; ECB tree view에서 F3 키가 ecb-show-help로 키바인딩되어있는 것을 해제해준다
(add-hook 'ecb-common-tree-buffer-after-create-hook
          (lambda ()
            (local-unset-key [f3])
            ))
(add-hook 'ecb-directories-buffer-after-create-hook
          (lambda ()
            (local-unset-key [f3])
            ))

;; ecb는 semantic-mode를 켜야지 정상적으로 function, variable list를 보여준다
;; ecb symboldef 버퍼에서 semantic mode가 필요하기 때문에 ecb를 로딩하는 순간 같이 실행해준다 (NOT USED)
(eval-after-load "ecb" (lambda ()
                         (irony-server-kill)
                         ;; (semantic-mode t)
                         ))


(require 'tabbar)
; turn on the tabbar
(tabbar-mode -1)

;; PACKAGE: google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)

                                        ;
;; C언어 모드에서 자동정렬 (들여쓰기 스타일)
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "google")))


;;C++ 모드 자동정렬 (들여쓰기 스타일)
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "google")))


;; 영어 대문자, 소문자를 토글해주는 함수
(defun xah-toggle-letter-case ()
  "Toggle the letter case of current word or text selection.
Always cycle in this order: Init Caps, ALL CAPS, all lower.
URL `http://ergoemacs.org/emacs/modernization_upcase-word.html'
Version 2017-04-19"
  (interactive)
  (let (
        (deactivate-mark nil)
        $p1 $p2)
    (if (use-region-p)
        (setq $p1 (region-beginning)
              $p2 (region-end))
      (save-excursion
        (skip-chars-backward "[:alnum:]-_")
        (setq $p1 (point))
        (skip-chars-forward "[:alnum:]-_")
        (setq $p2 (point))))
    (when (not (eq last-command this-command))
      (put this-command 'state 0))
    (cond
     ((equal 0 (get this-command 'state))
      (upcase-initials-region $p1 $p2)
      (put this-command 'state 1))
     ((equal 1  (get this-command 'state))
      (upcase-region $p1 $p2)
      (put this-command 'state 2))
     ((equal 2 (get this-command 'state))
      (downcase-region $p1 $p2)
      (put this-command 'state 0)))))

;; Alt + u 키로 region 영역에 영어단어를 대문자, 소문자, 앞에만 대문자 형식으로 토글해줍니다
(global-set-key (kbd "M-u") 'xah-toggle-letter-case)

(defun gdb-setup-windows-default ()
  "Layout the window pattern for option `gdb-many-windows'."
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil ( / ( * (window-height) 3) 4)))
        (win2 (split-window nil ( / (window-height) 3)))
        (win3 (split-window-right)))
    (gdb-set-window-buffer (gdb-locals-buffer-name) nil win3)
    (select-window win2)
    (set-window-buffer
     win2
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         ;; Put buffer list in window if we
         ;; can't find a source file.
         (list-buffers-noselect))))
    (setq gdb-source-window (selected-window))
    (let ((win4 (split-window-right)))
      (gdb-set-window-buffer
       (gdb-get-buffer-create 'gdb-inferior-io) nil win4))
    (select-window win1)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (let ((win5 (split-window-right)))
      (gdb-set-window-buffer (if gdb-show-threads-by-default
                                 (gdb-threads-buffer-name)
                               (gdb-breakpoints-buffer-name))
                             nil win5))
    (select-window win0)))

;; custom gdb 창을 바꿔주는 함수들
(defun my-gdb-setup-windows1 ()
  "Restore GUD buffer, IO buffer and source buffer next to each other.
;; http://dschrempf.github.io/posts/Emacs/2015-06-24-Debugging-with-Emacs-and-GDB.html#orgb894a48
"
  (interactive)
  ;; Select dedicated GUD buffer.
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (set-window-dedicated-p (get-buffer-window) t)
  (when (or gud-last-last-frame gdb-show-main)
    (let ((side-win (split-window nil nil t))
          (bottom-win (split-window)))
      ;; Put source to the right.
      (set-window-buffer
       side-win
       (if gud-last-last-frame
           (gud-find-file (car gud-last-last-frame))
         (gud-find-file gdb-main-file)))
      (setq gdb-source-window side-win)
      ;; Show dedicated IO buffer below.
      (set-window-buffer
       bottom-win
       (gdb-get-buffer-create 'gdb-inferior-io))
      (set-window-dedicated-p bottom-win t)
      )))

(defun my-gdb-setup-windows2 ()
  (interactive)
  "Layout the window pattern for option `gdb-many-windows'.
;; https://github.com/saogog123456/.emacs.d/blob/e065ad86fa548d67a114f222154e6e2f399ad4c8/core/neoclear-window.el
"
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (gdb-get-buffer-create 'gdb-inferior-io)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil (/ (* (window-height) 3) 4)))
        (win2 (split-window-right (/ (* (window-width) 2) 6))))
    (gdb-set-window-buffer (gdb-locals-buffer-name) nil win1)
    (set-window-buffer win2
                       (if gud-last-last-frame
                           (gud-find-file (car gud-last-last-frame))
                         (if gdb-main-file
                             (gud-find-file gdb-main-file)
                           ;; Put buffer list in window if we
                           ;; can't find a source file.
                           (list-buffers-noselect))))
    (select-window win1)
    (let ((win3 (split-window-right (/ (* (window-width) 3) 5)))
          (win4 (split-window-right (/ (* (window-width) 3) 5))))
      (gdb-set-window-buffer (gdb-breakpoints-buffer-name) nil win3)
      (gdb-set-window-buffer (gdb-stack-buffer-name) nil win4))
    (select-window win2)
    (setq gdb-source-window (selected-window))
    (select-window win0)
    (let ((win5 (split-window nil (/ (* (window-height) 3) 5))))
      (gdb-set-window-buffer (gdb-inferior-io-name) nil win5))
    (select-window win2)))

(defun my-gdb-setup-windows3 ()
  (interactive)
  "my gdb ui,fix sizes of every buffer
;; https://github.com/shanhaiying/.emacs.d-1/blob/b5e126649887f9099b0320c3432f719c52278e02/lisp/init-cc-mode.el
"
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (setq gud-gdb-buffer-width (/ (* (window-width) 3) 4)) ;for input/output buffer and locals buffer of gud mode
  (let ((win0 (selected-window))
        (win1 (split-window nil (/ (* (window-height) 8) 10)))
        (win2 (split-window nil (/ (* (window-height) 3) 8)))
        ;; (win3 (split-window nil (- (/ (* (window-width) 2) 3) 1) 'right))
        (win3 (split-window nil gud-gdb-buffer-width 'right)) ;input/output
	)
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3)
    (select-window win2)
    (set-window-buffer
     win2
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         ;; Put buffer list in window if we
         ;; can't find a source file.
         (list-buffers-noselect))))
    (setq gdb-source-window (selected-window))
    (let ((win4 (split-window nil gud-gdb-buffer-width 'right))) ;locals
      (gdb-set-window-buffer (gdb-locals-buffer-name) nil win4))
    (select-window win1)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (let ((win5 (split-window-right)))
      (gdb-set-window-buffer (if gdb-show-threads-by-default
                                 (gdb-threads-buffer-name)
                               (gdb-breakpoints-buffer-name))
                             nil win5))
    (select-window win0)))

(defun my-gdb-setup-windows4 ()
  (interactive)
  "my gdb ui, just source,gdb,io,stack buffers"
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil (/ (* (window-width) 1) 2) 'left))                     ;code and output
        (win2 (split-window-below (/ (* (window-height) 3) 4))) ;stack
        )
    (select-window win2)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (select-window win1)
    (set-window-buffer
     win1
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         ;; Put buffer list in window if we
         ;; can't find a source file.
         (list-buffers-noselect))))
    (setq gdb-source-window (selected-window))
    (let ((win3 (split-window nil (/ (* (window-height) 3) 4)))) ;io
      (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3)) ;gdb-inferior-io
    ;; (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-locals-buffer) nil win3)
    (select-window win0)
    ))

(defun my-gdb-setup-windows5 ()
  "https://stackoverflow.com/questions/39762833/emacsgdb-customization-how-to-display-source-buffer-in-one-window
"
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let
      ((win0 (selected-window))             ; breakpoints ==> Speedbar Watch Expression
       (win1 (split-window-horizontally
              (floor (* 0.4 (window-width)))))   ; source + i/o
       (win2 (split-window-vertically
              (floor (* 0.5 (window-body-height))))) ; gdb
       (win3 (split-window-vertically
              (floor (* 0.5 (window-body-height))))) ; locals
       ;; (win4 (split-window-vertically
       ;;     (floor (* 0.6 (window-body-height))))) ; stack
       )
    (select-window win1)
                                        ; configurating right window
    (let
        ((winSrc (selected-window)) ; source
         (winIO (split-window-vertically (floor (* 0.9 (window-body-height))))) ; I/O
         )
      (set-window-buffer winIO (gdb-get-buffer-create 'gdb-inferior-io))
      (set-window-buffer winSrc
                         (if gud-last-last-frame
                             (gud-find-file (car gud-last-last-frame))
                           (if gdb-main-file
                               (gud-find-file gdb-main-file)
                             (list-buffers-noselect))))
      (setq gdb-source-window winSrc)
      (set-window-dedicated-p winIO t)
      ;; comment(edward): Stack Frame added
      (select-window winIO)
      (let
          ((winStack (split-window-horizontally (floor (* 15 (window-body-height))))) ;; comment(edward): Stack buffer added
           )
        (set-window-buffer winStack (gdb-get-buffer-create 'gdb-stack-buffer)) ;; comment(edward): Stack buffer added
        ))
    ;; (set-window-buffer win0 (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    (if (get-buffer " SPEEDBAR")
        (set-window-buffer win0 " SPEEDBAR")
      (set-window-buffer win0 (gdb-get-buffer-create 'gdb-breakpoints-buffer))
      )
    ;; comment(edward): " SPEEDBAR"" 추가!
    (set-window-buffer win3 (gdb-get-buffer-create 'gdb-locals-buffer))
    (set-window-buffer win4 (gdb-get-buffer-create 'gdb-stack-buffer))
    (select-window win2)
    )
  )

(defun my-gdb-settings-toggle ()
  "처음으로 직접 만들어 본 elips defun
gdb-setup-windows 함수들을 순차적으로 불러온다
created by edward 180515"
  (interactive)
  (let ()
    (when (not (eq last-command this-command))
      (put this-command 'state 0))
    (cond
     ((equal 0 (get this-command 'state))
      (gdb-setup-windows-default)
      (message "[+] Setting my-gdb-setup-default...")
      (put this-command 'state 1))
     ((equal 1 (get this-command 'state))
      (my-gdb-setup-windows1)
      (message "[+] Setting my-gdb-setup-windows1...")
      (put this-command 'state 2))
     ((equal 2  (get this-command 'state))
      (my-gdb-setup-windows2)
      (message "[+] Setting my-gdb-setup-windows2...")
      (put this-command 'state 3))
     ((equal 3 (get this-command 'state))
      (my-gdb-setup-windows3)
      (message "[+] Setting my-gdb-setup-windows3...")
      (put this-command 'state 4))
     ((equal 4 (get this-command 'state))
      (my-gdb-setup-windows4)
      (message "[+] Setting my-gdb-setup-windows4...")
      (put this-command 'state 5))
     ((equal 5 (get this-command 'state))
      (my-gdb-setup-windows5)
      (message "[+] Setting my-gdb-setup-windows5...")
      (put this-command 'state 0))
     )))

;; 처음 gdb를 시작할 때 생성되는 창을 설정하는 함수 (my-gdb-setup-windows5) 로 설정했다 (defadvice로 설정하는 듯)
(defadvice gdb-setup-windows (around setup-more-gdb-windows activate)
  (my-gdb-setup-windows1)
  )

;; f1 키로 이전 버퍼창 이동
(global-set-key [f1] 'tabbar-backward)

;; f2 키로 다음 버퍼창 이동
(global-set-key [f2] 'tabbar-forward)

;; f3 키로 다음 창으로 이동
(global-set-key [f3] 'next-multiframe-window)

;; f4 키로 다음 창으로 이동
(global-set-key [f4] 'previous-multiframe-window)

;; C-f5 키로 org-show-todo-tree 명령어 실행 (for org-mode)
(global-set-key (kbd "C-<f5>") '(lambda() (interactive)(org-show-todo-tree '(4))))

;; f5 키로 org-match-sparse-tree 명령어 실행 (for org-mode)
(global-set-key [f5] 'org-match-sparse-tree)

;; f6 키로 ECB 시작
(global-set-key [f6] 'ecb-minor-mode)

;; f7 키로 latex-preview-pane 모드 시작
(global-set-key [f7] 'latex-preview-pane-mode)

;; f8 키로 디버깅 단축키
(global-set-key [f8] 'gdb)

;; shift + f8 키로 gud를 실행한다
(global-set-key (kbd "S-<f8>") 'gud-run)

;; f9 소스창에서 바로 브레이크포인트 설정
(global-set-key (kbd "<f9>") 'gud-break)

;; f10 키로 라인 실행하고 다음 라인으로
(global-set-key (kbd "<f10>") 'gud-next)

;; Shift + f10 키로 함수안으로 따라 들어간다
(global-set-key (kbd "S-<f10>") 'gud-step)

;; f11 키로 전체화면 모드 실행
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)

;; Shift + f11 키로 현재 실행중인 함수 리턴후 멈춤
(global-set-key (kbd "S-<f11>") 'gud-finish)

;; insert 키로 현재 커서까지 실행하고 멈춤
(global-set-key (kbd "<insert>") '(lambda () (interactive)
                                    (call-interactively 'gud-tbreak)
                                    (call-interactively 'gud-cont)))

;; home 키로 gdb 다중창 On/Off
(global-set-key (kbd "<home>") 'gdb-many-windows)

;; end 키로 gdb의 layout을 변경합니다
(global-set-key (kbd "<end>") 'my-gdb-settings-toggle)

;; gdb variables
(setq gdb-show-changed-values t)
(setq gdb-use-colon-colon-notation t)
(setq gdb-use-separate-io-buffer nil)
(setq gdb-display-io-nopopup nil)
(setq gdb-delete-out-of-scope t)
(setq gdb-speedbar-auto-raise t)

;; gdb 다중창 설정
(setq gdb-many-windows t)
(setq gdb-show-main t)

;; gdb 명령어 설정
(setq gud-gdb-command-name "gdb -q -i=mi --args")

;; gdb를 실행하고 나서 환경설정 코드
(eval-after-load "gud"
  '(progn
     ;; C-M-w 키로 gud-watch 명령을 실행합니다
     (define-key gud-minor-mode-map (kbd "C-M-w") 'gud-watch)
     ))

;; compile 명령어 수정 (c++일 경우 g++, c일 경우 gcc로 해주면 됩니다)
(setq compile-command "g++ -m64 -std=c++11 -Wall -O2 -g -o ")

;; Ctrl + Alt + 1 키로 jekyll 블로그의 .org 포스트를 올립니다
(global-set-key (kbd "C-M-1") (lambda()
                                (interactive)
                                (org-publish "org-jekyll" t)

                                ;; org 모드에서 ../pictrues/{path} 경로를 html로 변환할 때는 /pictures/{path}로 변환해주기 위한 함수
                                ;; 단 경로가 ~/gitrepo/tigerk0430.github.io에 있어야 한다.
                                (shell-command "sed -i 's/..\\/..\\/pictures/\\/pictures/g' ~/gitrepo/tigerk0430.github.io/_posts/*.html" t)
                                ))

;; Ctrl + Alt + 2 키로 jekyll 블로그의 .org 포스트를 올립니다 (현재 버퍼의 파일만)
(global-set-key (kbd "C-M-2") (lambda ()
                                (interactive)
                                (org-publish-current-file)
                                (shell-command "sed -i 's/..\\/..\\/pictures/\\/pictures/g' ~/gitrepo/tigerk0430.github.io/_posts/*.html" t)
                                ))

;; C-1 키로 현재 파일에서 빠르게 특정 함수나 변수로 이동합니다
(global-set-key (kbd "C-1") 'helm-semantic)
                                        ;
;; C-2 키로 find file 파일이 존재하는지 검색합니다
(global-set-key (kbd "C-2") 'helm-find)

;; C-3 키로 find dir 폴더가 존재하는지 검색합니다
(global-set-key (kbd "C-3") 'helm-projectile-find-dir)

;; C-4 키로 *scratch* buffer를 생성하고 이동합니다
(global-set-key (kbd "C-4") 'create-scratch-buffer)

;; C-5 키로 현재 경로를 projectile project로 추가합니다
(global-set-key (kbd "C-5") 'add-current-project-to-projectile)

;; Ctrl + 7 키로 선택한 버퍼를 닫습니다
(global-set-key (kbd "C-7") 'buffer-menu)

;; Ctrl + 8 키로 현재 버퍼를 닫습니다
(global-set-key (kbd "C-8") 'my-kill-this-buffer)

;; Ctrl + 9 키로 Customize Variable 명령어를 사용한다
(global-set-key (kbd "C-9") 'pwd)

;; Ctrl + 0 키로 Customize Variable 명령어를 사용한다
(global-set-key (kbd "C-0") 'customize-variable)

;; Alt + 1 키로 multi terminal을 실행합니다
(global-set-key (kbd "M-1") 'multi-term)

;; Alt + 2 키로 multi-term으로 화면분할 후 자동으로 이동하도록 설정합니다
(global-set-key (kbd "M-2") 'my-multi-term)

;; Alt + 3 키로 다음 윈도우 창으로 이동합니다
(global-set-key (kbd "M-3") 'next-multiframe-window)

;; Alt + 4 키로 다음 윈도우 창으로 이동합니다
(global-set-key (kbd "M-4") 'previous-multiframe-window)

;; Alt + 8 키로 flycheck 기능을 ON/OFF합니다
(global-set-key (kbd "M-8") 'global-flycheck-mode)

;; Alt + 9 키로 shell을 불러오는 커맨드를 실행합니다
(global-set-key (kbd "M-9") 'shell-command)

;; Alt + 0 키로 컴파일 단축키를 설정합니다
(global-set-key (kbd "M-0") 'compile)

;; Alt + right left up down  윈도우 창 이동
(global-set-key (kbd "<M-right>") 'next-multiframe-window)
(global-set-key (kbd "<M-down>") 'next-multiframe-window)
(global-set-key (kbd "<M-left>") 'previous-multiframe-window)
(global-set-key (kbd "<M-up>") 'previous-multiframe-window)

;; Ctrl + q 키로 현재 창 남기고 나머지 창 모두 닫기
(global-set-key "\C-q" 'delete-other-windows)

;; Alt + q 키로 현재 창을 닫습니다
(global-set-key "\M-q" 'delete-window)
(define-key c++-mode-map (kbd "M-q") 'delete-window)

(global-unset-key (kbd "S-SPC"))
(global-unset-key (kbd "C-S-SPC"))
;; Ctrl + tab 키를 한/영키로
(global-set-key (kbd "<kana>") 'toggle-input-method)
(global-set-key (kbd "S-SPC") 'toggle-input-method)

;; PACKAGE: cua-mode
;;잘라내기, 붙여넣기, CTRL+C, V를 활성화 시켜준다.
;; (cua-mode)

;;북 마크에 저장 하기 Alt + b
(global-set-key (kbd "M-b") 'bookmark-set)

;; 북마크 삭제 Ctrl + Alt + b
(global-set-key (kbd "C-M-b") 'bookmark-delete)

;;북 마크 열기 Alt + v
(global-set-key (kbd "M-v") 'bookmark-jump)

;; Ctrl + k 키로 해당 커서의 한 줄 전체를 지웁니다
(global-set-key "\C-k" 'kill-whole-line)

;; 현재 커서로부터 맨 아래까지 라인을 지우는 함수
;; (defun kill-to-end-of-buffer() "Deletes all lines after the current line"
;;   (interactive)
;;   (progn
;;     (forward-line 1)
;;     (delete-region (point) (point-max))))
;; ;; Ctrl + Shift + k 키로 현재 커서부터 아래 라인을 모두 지웁니다
;; (global-set-key (kbd "C-S-k") 'kill-to-end-of-buffer)

;; Ctrl + Shift + k 키로 해당 커서의 오른쪽부분만 삭제합니다
(global-set-key (kbd "C-S-k") 'kill-visual-line)
(define-key org-mode-map (kbd "C-S-k") 'kill-visual-line)

;; Ctrl + a 키로 전체선택하게 합니다
(global-set-key "\C-a" 'mark-whole-buffer)

;; Ctrl + s 키로 해당 버퍼를 저장합니다
(global-set-key "\C-s" 'save-buffer)

;; Ctrl + Shift + s 키로 모든 버퍼를 저장합니다
(defun save-all () (interactive)
       (save-some-buffers t)
       (message "[+] saving all buffers..."))
(global-set-key (kbd "C-S-s") 'save-all)

;; 랜덤한 string을 생성하는 함수 (not used)
(defun random-alpha ()
  (let* ((alnum "abcdefghijklmnopqrstuvwxyz")
         (i (% (abs (random)) (length alnum))))
    (substring alnum i (1+ i))))

;; 현재 버퍼의 파일을 임의로 /.emacs.d/.temporary/ 폴더에 저장하는 함수
(defun copy-buffer-to-file ()
  (interactive)
  (let ((bufname (concat "~/.emacs.d/.temporary/" (concat (format-time-string "%Y%m%d_%T")
                                         "_"
                                         (buffer-name)
                                         ))))
    (if (file-directory-p "~/.emacs.d/.temporary")
        (progn
          (write-region (point-min) (point-max) bufname t)
          (message (concat "[+] saving a temp file in " bufname)))
      (progn
        (make-directory "~/.emacs.d/.temporary")
        (write-region (point-min) (point-max) bufname t)
        (message (concat "[+] created folder && saving a temp file in " bufname)))
      )))

;; C-c + ' 키를 사용해 현재 버퍼를 /tmp 폴더에 임의의 5개 랜덤글자 파일로 저장한다
(global-set-key (kbd "C-c '") 'copy-buffer-to-file)

;; Ctrl + p 키로 grep 명령어를 실행합니다
(global-set-key (kbd "C-p") 'grep-find)

;; grep-find 기본 명령어를 아래와 같이 수정합니다
;;(setq grep-find-template
;;"find . <X> -type f <F> -exec grep <C> -nH -ie <R> \\{\\} +")
;;"find . -type f -exec grep --exclude=*{ph.h, rviz, rst} --include={cpp,c,h,py} -nH -ie   {} +" 같이 확장자를 필터링할 수 있다
(grep-apply-setting 'grep-find-command '("find . -type f -exec grep -nH -ie   {} +" . 35))

(eval-after-load "grep"
  '(progn
     ;; 키바인딩 해제 for evil mode keybinding n,N
     (define-key grep-mode-map (kbd "n") nil)
     (define-key grep-mode-map (kbd "N") nil)
     (define-key grep-mode-map (kbd "<SPC>") 'helm-for-files)
     ))


(eval-after-load "buff-menu"
  '(progn
     ;; Space 키로 helm-for-files 명령을 실행합니다.
     (define-key Buffer-menu-mode-map (kbd "<SPC>") 'helm-for-files)
     ))

;; 괄호 사이를 이동하는 코드
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s(")
         (forward-list 1) (backward-char 1))
        ((looking-at "\\s)")
         (forward-char 1) (backward-list 1))
        (t nil)))

;; Ctrl + ] 키를 누르면 해당 괄호의 끝부분으로 이동합니다
(global-set-key (kbd "\C-]") 'match-paren)


;; Alt + Enter 키로 현재 커서는 멈춘 상태에서 newline을 생성합니다
(global-set-key (kbd "M-<return>") 'open-line)


;; vim과 같이 앞에 있는 단어 중 숫자의 크기를 증가시키는 함수
(defun increment-number-at-point ()
  "customized by ewdard"
  (interactive)
  (skip-chars-backward "0-9")
  (or (search-forward-regexp "[0-9]+"))  ;; 여기 코드를 수정하니 정상적으로 작동한다
  (replace-match (number-to-string
                  (1+ (string-to-number
                       (match-string 0)))))
  )


;; Ctrl + t 를 누르면 커서의 숫자가 증가합니다
(global-set-key (kbd "C-t") 'increment-number-at-point)

;; M-., M-, 키로 함수나 변수로 이동하는 단축키를 설정한다
(global-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
(global-set-key (kbd "M-,") 'rtags-location-stack-back)
;; M-< 키로 현재 커서에 있는 변수의 reference를 검색합니다.
(global-set-key (kbd "M-<") 'rtags-find-references-at-point)
;; M-> 키로 현재 커서에 있는 변수로 이동합니다
(global-set-key (kbd "M->") 'rtags-find-symbol)


;; 변수나 함수 하이라이팅한 구문을 빠르게 이동합니다 higlight-symbol 패키지
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)


;; Alt + G 단축키로 구문을 fold 접거나 펼치거나 합니다
(global-set-key "\M-g" 'hs-toggle-hiding)

;; C-x + l 단축키로 같은 level의 구문을 fold 접거나 펼치거나 합니다
(global-set-key (kbd "C-x l") 'hs-hide-level)

;; C-x + h 단축키로 같은 모든 접힌 구문을 펼칩니다.
(global-set-key (kbd "C-x h") 'hs-show-all)

;; Ctrl + Alt + G 키로 주석을 감췄다 보여줬다 하는 단축키 설정
(hide/show-comments)
(global-set-key (kbd "C-M-g") 'hide/show-comments-toggle)


;; Ctrl + PageUp, Down 단축키로 첫째줄, 마지막줄로 바로 이동합니다. Ctrl + Home, End는 원래 가능
(global-set-key (kbd "C-<prior>") 'beginning-of-buffer)
(global-set-key (kbd "C-<next>") 'end-of-buffer)

;; Alt + z로 시각화된 undo tree를 봅니다
(global-set-key "\M-z" 'undo-tree-visualize)

;; Ctrl + z로 뒤로가기 기능을 실행합니다
(global-set-key "\C-z" 'undo-tree-undo)

;; Alt + j 키로 vim처럼 한칸씩 아래로 움직입니다
(define-key c++-mode-map "\M-j" nil)
(define-key c-mode-map "\M-j" nil)
(global-set-key "\M-j" 'next-line)

;; Alt + k 키로 vim처럼 한칸씩 위로 올라갑니다
(global-set-key "\M-k" 'previous-line)

;; vim 처럼 M-i,o 키를 좌우로 단어 단위로 움직이도록 설정합니다
(global-set-key (kbd "M-i") 'left-word)
(global-set-key (kbd "M-o") 'right-word)

;; vim 처럼 M-h,l 키를 좌우로 글자 단위로 움직이도록 설정합니다
(global-set-key (kbd "M-h") 'left-char)
(global-set-key (kbd "M-l") 'right-char)


;; C-c + C-c (or C-v) 로 window의 사이즈를 조절합니다
(define-key c++-mode-map (kbd "C-c C-c") nil)
(define-key c-mode-map (kbd "C-c C-c") nil)
(global-set-key (kbd "C-c C-c") (lambda ()
                                  (interactive)
                                  (enlarge-window-horizontally 2)
                                  (enlarge-window 2)
                                  ))

;; python-mode, org-mode에서도 같은 단축키가 동작하도록 설정한다
(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-c") (lambda ()
                                              (interactive)
                                              (enlarge-window-horizontally 2)
                                              (enlarge-window 2)
                                              ))
             ))
(add-hook 'org-mode-hook
          '(lambda ()
             (local-unset-key (kbd "M-j"))
             (local-set-key (kbd "C-c C-c") (lambda ()
                                              (interactive)
                                              (enlarge-window-horizontally 2)
                                              (enlarge-window 2)
                                              ))
             (local-set-key (kbd "M-j") 'next-line)

             (define-key input-decode-map (kbd "C-[") (kbd "H-["))
             (define-key input-decode-map (kbd "C-i") (kbd "H-i"))
             ;; (define-key input-decode-map (kbd "C-m") (kbd "H-m"))

             ;; C-z 키는 undo-tree 의 undo 명령어가 실행되도록 합니다 (for org-mode)
             (undo-tree-mode t)
             ))

;; M-/ 키로 cmake-ide compile_commands.json을 불러옵니다
(global-set-key (kbd "M-/") 'cmake-ide-load-db)
;; M-? 키로 cmake-ide cmake를 실행합니다
(global-set-key (kbd "M-?") 'cmake-ide-run-cmake)

;;; cmake-ide + gdb/exec.
(defun run-process-in-comint (cmd)
  (let* ((name (format "Process: %s" cmd))
         (buf (set-buffer (generate-new-buffer name)))
         (proc nil)
         (line-- (make-string 80 ?-))
         (proc-sentinal-fn (lambda (proc evt)
                             (insert (format "%s\n%s -- %s\n%s\n" line-- evt (current-time-string) line--))))
         (comint-mode-result (comint-mode)))
    ;;
    (switch-to-buffer-other-window buf)
    ;;
    (insert (format "Starting: %s\n%s\n" (current-time-string) line--))
    (setq proc (start-process-shell-command name buf cmd))
    (set-process-sentinel proc (lambda (proc evt)
                                 (insert (format "==========\n%s -- (%s) %s\n"
                                                 evt
                                                 (process-exit-status proc)
                                                 evt (current-time-string)))))
    ;;
    proc))

(defun cmake-ide-find-exe-file ()
  (interactive)
  (let* ((exec-files (seq-filter 'file-executable-p
                                 (directory-files-recursively
                                  (cide--build-dir)
                                  ".*")))
         (base-buffer-name (file-name-base (buffer-name)))
         (calc-dist (lambda (fn) (cons fn
                                       (levenshtein-distance
                                        base-buffer-name
                                        (file-name-base fn)))))
         (cdr-< (lambda (a b) (< (cdr a) (cdr b))))
         (distances (sort (mapcar calc-dist exec-files) cdr-<))
         ;;(---- (message distances))
         (nearest (car (first distances))))
    (cons nearest exec-files)))

(defun cmake-ide-gdb-files-source ()
  "http://kitchingroup.cheme.cmu.edu/blog/2015/01/24/Anatomy-of-a-helm-source/"
  (interactive)
  (require 'seq)
  `((name . "Executable file to debug")
    (candidates . ,(cmake-ide-find-exe-file))
    (action . (lambda (sel)
                (gdb (read-from-minibuffer
                      "Cmd: " (format "%s %s" gud-gdb-command-name sel)))))))

(defun cmake-ide-helm-run-gdb ()
  (interactive)
  (helm :sources (cmake-ide-gdb-files-source)))

;; C-c q 키로 해당 cmake 프로젝트에서 gdb exe 파일을 찾아주는 명령을 실행합니다.
(define-key c-mode-base-map (kbd "C-c q") (function cmake-ide-helm-run-gdb))

;; C-S-l 키로 python 코드에서 들여쓰기를 보여줍니다.
(global-set-key (kbd "C-S-l") 'highlight-indentation-mode)


(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

;; Ctrl + y 키로 현재 커서의 라인을 선택합니다
(global-set-key (kbd "C-y") 'select-current-line)

;; Ctrl + b 키로 helm 파일 브라우저를 실행합니다
(global-set-key (kbd "C-b") 'helm-for-files)

(defun select-current-line-and-comment ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position))
  (comment-dwim 1))

;; Alt + ; 키로 현재 커서라인을 주석처리 Toggle ON/OFF 합니다
(global-set-key (kbd "M-;") 'select-current-line-and-comment)

;; Alt + \ 키로 magit의 상태창을 실행합니다
(global-set-key (kbd "M-\\") 'magit-status)

;; C-c + e 키로 git project에서 두 파일을 비교하는 magit-ediff-dwim을 수행합니다
(global-set-key (kbd "C-c e") 'magit-ediff-dwim)

;; C-c + d 키로 git project에서 두 파일을 비교하는 magit-diff-dwim을 수행합니다
(global-set-key (kbd "C-c d") 'magit-diff-dwim)

;; C-c + f키로 두 파일을 비교하는 diff 명령을 실행합니다
(global-set-key (kbd "C-c f") 'diff)

;; C-c + r키로 두 파일을 비교하는 ediff 명령을 실행합니다
(global-set-key (kbd "C-c r") 'ediff)

;; C-c + w키로 region 영역 단위로 ediff를 실행하는 명령을 설정합니다
(global-set-key (kbd "C-c w") 'ediff-regions-linewise)

;; C-c + t 키로 한 파일의 변경기록을 검사하는 magit-log-buffer-file 명령을 수행합니다
(global-set-key (kbd "C-c t") 'magit-log-buffer-file)

;; C-c + y 키로 다른 branch에 있는 파일의 내용을 확인합니다
(global-set-key (kbd "C-c y") 'magit-find-file)

;; C-c + b 키로 .el 파일을 .elc 파일로 컴파일합니다
(global-set-key (kbd "C-c b") 'byte-compile-file)

(eval-after-load "diff-mode"
  '(progn
    (define-key diff-mode-map (kbd "M-3") nil)
    )
  )

(eval-after-load "make-mode"
  '(progn
     (define-key makefile-gmake-mode-map (kbd "M-n") 'highlight-symbol-next)
     (define-key makefile-gmake-mode-map (kbd "M-p") 'highlight-symbol-prev)
     )
  )


;; magit 패키지가 로딩되면 같이 실행되는 코드
(eval-after-load "magit"
  (lambda ()
    ;; comment(edward): 키바인딩 해제
    (define-key magit-status-mode-map (kbd "C-w") nil)
    (define-key magit-status-mode-map (kbd "C-c C-o") nil)
    (define-key magit-status-mode-map (kbd "C-c C-p") nil)
    (define-key magit-status-mode-map (kbd "M-3") nil)
    (define-key magit-diff-mode-map (kbd "M-3") nil)
    (define-key magit-diff-mode-map (kbd "M-4") nil)
    (define-key magit-process-mode-map (kbd "M-3") nil)
    (define-key magit-file-mode-map (kbd "C-x g") nil)

    ;; comment(edward): j,k 키를 evil-mode의 vim 키바인딩으로 설정한다
    (define-key magit-log-mode-map (kbd "j") 'evil-next-line)
    (define-key magit-log-mode-map (kbd "k") 'evil-previous-line)
    (define-key magit-log-mode-map (kbd "C-u") 'evil-scroll-up)
    (define-key magit-log-mode-map (kbd "C-d") 'evil-scroll-down)

    (define-key magit-status-mode-map (kbd "j") 'evil-next-line)
    (define-key magit-status-mode-map (kbd "k") 'evil-previous-line)
    (define-key magit-status-mode-map (kbd "C-u") 'evil-scroll-up)
    (define-key magit-status-mode-map (kbd "C-d") 'evil-scroll-down)

    (define-key magit-process-mode-map (kbd "j") 'evil-next-line)
    (define-key magit-process-mode-map (kbd "k") 'evil-previous-line)
    (define-key magit-process-mode-map (kbd "C-u") 'evil-scroll-up)
    (define-key magit-process-mode-map (kbd "C-d") 'evil-scroll-down)

    (define-key magit-branch-section-map (kbd "k") 'evil-previous-line)
    (define-key magit-branch-section-map (kbd "C-u") 'evil-scroll-up)
    (define-key magit-branch-section-map (kbd "C-d") 'evil-scroll-down)

    (define-key magit-unstaged-section-map (kbd "k") 'evil-previous-line)
    (define-key magit-unstaged-section-map (kbd "C-u") 'evil-scroll-up)
    (define-key magit-unstaged-section-map (kbd "C-d") 'evil-scroll-down)

    ;; (define-key magit-file-mode-map (kbd "k") 'evil-previous-line)
    ;; (define-key magit-file-mode-map (kbd "C-u") 'evil-scroll-up)
    ;; (define-key magit-file-mode-map (kbd "C-d") 'evil-scroll-down)

    (define-key magit-diff-mode-map (kbd "j") 'evil-next-line)
    (define-key magit-diff-mode-map (kbd "k") 'evil-previous-line)
    (define-key magit-diff-mode-map (kbd "C-u") 'evil-scroll-up)
    (define-key magit-diff-mode-map (kbd "C-d") 'evil-scroll-down)

    ;; Space 키로 helm-for-files 명령을 실행합니다
    (define-key magit-status-mode-map (kbd "<SPC>") 'helm-for-files)
    (define-key magit-diff-mode-map (kbd "<SPC>") 'helm-for-files)
    (define-key magit-revision-mode-map (kbd "<SPC>") 'helm-for-files)
    (define-key magit-process-mode-map (kbd "<SPC>") 'helm-for-files)

    ;; x키로 emacs 창을 최소화합니다.
    (define-key magit-process-mode-map (kbd "x") 'suspend-frame)
    (define-key magit-log-mode-map (kbd "x") 'suspend-frame)
    (define-key magit-diff-mode-map (kbd "x") 'suspend-frame)
    (define-key magit-status-mode-map (kbd "x") 'suspend-frame)
    (define-key magit-unstaged-section-map (kbd "x") 'suspend-frame)
    (define-key magit-branch-section-map (kbd "x") 'suspend-frame)

    ;; C-x , 키로 projectile switch 를 실행합니다
    (define-key magit-process-mode-map (kbd "C-x ,") 'helm-projectile-switch-project)
    (define-key magit-log-mode-map (kbd "C-x ,") 'helm-projectile-switch-project)
    (define-key magit-diff-mode-map (kbd "C-x ,") 'helm-projectile-switch-project)
    (define-key magit-status-mode-map (kbd "C-x ,") 'helm-projectile-switch-project)
    (define-key magit-unstaged-section-map (kbd "C-x ,") 'helm-projectile-switch-project)
    (define-key magit-branch-section-map (kbd "C-x ,") 'helm-projectile-switch-project)

    ;; - 키로 dired 모드를 실행합니다
    (define-key magit-process-mode-map (kbd "-") (lambda() (interactive)(dired "./")))
    (define-key magit-log-mode-map (kbd "-") (lambda() (interactive)(dired "./")))
    (define-key magit-diff-mode-map (kbd "-") (lambda() (interactive)(dired "./")))
    (define-key magit-status-mode-map (kbd "-") (lambda() (interactive)(dired "./")))
    (define-key magit-unstaged-section-map (kbd "-") (lambda() (interactive)(dired "./")))
    (define-key magit-branch-section-map (kbd "-") (lambda() (interactive)(dired "./")))

    ;; ` 키로 avy-goto-mode-0 를 실행한다.
    (define-key magit-process-mode-map (kbd "`") 'avy-goto-word-0)
    (define-key magit-log-mode-map (kbd "`") 'avy-goto-word-0)
    (define-key magit-diff-mode-map (kbd "`") 'avy-goto-word-0)
    (define-key magit-status-mode-map (kbd "`") 'avy-goto-word-0)
    (define-key magit-unstaged-section-map (kbd "`") 'avy-goto-word-0)
    (define-key magit-branch-section-map (kbd "`") 'avy-goto-word-0)

    ))

;;; 이맥스가 기본적으로 제공하는 Git 백엔드를 켜두면 매우 느려진다. magit만 쓴다.
(setq vc-handled-backends nil)

;; Alt + [ 키로 선택된 단어를 iedit 일괄편집합니다
(global-set-key (kbd "M-[") 'iedit-mode)
;; 원래 C-; 가 iedit-mode로 키바인딩 되어있는 것을 해제합니다
;; (global-set-key (kbd "C-;") nil)

;; git merge 도중 conflict가 난 파일은 <<<< HEAD 같은 코드가 생기는데
;; 이 때 smerge-mode를 사용해서 conflict를 관리하는 함수
(global-set-key (kbd "C-c v") 'smerge-mode)

;; smerge mode가 시작되고 실행되는 코드
(eval-after-load "smerge-mode"
  (lambda()
    ;; evil-mode-map을 smerge-mode-map이 오버라이딩하려고 했지만 실패함 <2018-10-6 18:00>
    ;; (add-to-ordered-list 'emulation-mode-map-alists '(smerge-mode smerge-mode-map) 0)
    ;; (message "%S" emulation-mode-map-alists)
                                        ;
    ;; merge conflict를 효율적으로 관리하기 위해 단축키를 변경한다
    ;; C-c e 키로 ediff 모드를 사용한다 (a,b로 내 코드, 다른 코드를 선택 가능)
    (define-key smerge-mode-map (kbd "C-c e") 'smerge-ediff)

    ;; C-c n,p 키로 움직입니다
    (define-key smerge-mode-map (kbd "C-c n") 'smerge-next)
    (define-key smerge-mode-map (kbd "C-c p") 'smerge-prev)

    ;; C-c a,b 키로 어느 conflict를 선택할지 결정합니다
    (define-key smerge-mode-map (kbd "C-c a") 'smerge-keep-mine)
    (define-key smerge-mode-map (kbd "C-c b") 'smerge-keep-other)
    ))

;; Ctrl + \ - 키로 창을 가로,세로로 분할합니다
(global-set-key (kbd "C-c \\") 'split-window-right)
(global-set-key (kbd "C-c -") 'split-window-vertically)
(define-key imagex-sticky-mode-map (kbd "C-c -") 'split-window-vertically)

;; 모든 환경에서 C-i <==> TAB 키를 따로 사용하기 위한 훅 코드
;; C-i <==> TAB 이 같은 키로 인식되므로 아래 코드를 추가해준다
(add-hook 'prog-mode-hook '(lambda()
                             (keyboard-translate ?\C-i ?\H-i)
                             (define-key input-decode-map (kbd "C-[") (kbd "H-["))
                             (define-key input-decode-map (kbd "C-i") (kbd "H-i"))
                             ;; (define-key input-decode-map (kbd "C-m") (kbd "H-m"))
                             ;; (define-key input-decode-map (kbd "C-S-m") (kbd "H-S-m"))
                             (define-key input-decode-map (kbd "C-S-i") (kbd "H-S-i"))
                             ))

;; customize mode와 같이 실행되는 hook 코드
(add-hook 'custom-mode-hook (lambda ()
                               ;; evil 모드 키바인딩을 설정합니다
                               (define-key custom-mode-map (kbd "SPC") 'helm-for-files)
                               (define-key custom-mode-map (kbd "j") 'evil-next-line)
                               (define-key custom-mode-map (kbd "k") 'evil-previous-line)
                               (define-key custom-mode-map (kbd "l") 'evil-forward-char)
                               (define-key custom-mode-map (kbd "h") 'evil-backward-char)
                               (define-key custom-mode-map (kbd "g g") 'evil-goto-first-line)
                               (define-key custom-mode-map (kbd "G") 'evil-goto-line)
                               (define-key custom-mode-map (kbd "C-u") 'evil-scroll-up)
                               (define-key custom-mode-map (kbd "C-d") 'evil-scroll-down)
                              ))

;; C-u 키로 swiper (버퍼 간 빠른이동) 기능을 실행합니다 (NOT USED)
;; (global-set-key (kbd "C-u") 'swiper-all)

;; Alt + a 키로 해당 단어의 reference를 검색해줍니다
(global-set-key (kbd "M-a") 'helm-projectile-grep)
(define-key c++-mode-map (kbd "M-a") 'helm-projectile-grep)

;; ESC키 2번으로 기존에 3번 ESC를 눌러야 작동하던 escape를 대신합니다
(global-set-key (kbd "<escape> <escape>") 'keyboard-escape-quit)

;; C-x C-z 키가 suspend-frame으로 되어있어서 잘못해서 emacs가 멈추는 경우가 생기므로 해제합니다
(global-unset-key (kbd "C-x C-z"))

;; White space를 없애주는 함수
(defun kill-whitespace ()
  "Kill the whitespace between two non-whitespace characters"
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
        (progn
          (re-search-forward "[ \t\r\n]+" nil t)
          (replace-match "" nil nil))))))

;; Alt + w 키로 white-space를 제거하는 기능을 설정합니다
(global-set-key (kbd "M-w") 'kill-whitespace)
(define-key c++-mode-map (kbd "M-w") 'kill-whitespace)

;; Alt + m 키로 공백들을 제거합니다
(global-set-key (kbd "M-m") 'delete-blank-lines)

;; Alt + f 키로 forward paragraph (C-<down>) 과 같은 명령을 실행합니다
(global-set-key (kbd "M-f") 'forward-paragraph)
(define-key c++-mode-map (kbd "M-f") 'forward-paragraph)

;; Alt + r 키로 backward paragraph (C-<up>) 과 같은 명령을 실행합니다
(global-set-key (kbd "M-r") 'backward-paragraph)
(define-key c++-mode-map (kbd "M-r") 'backward-paragraph)

;; (eval-after-load "simple"
;;   (lambda ()
;;     ;; SPC 키로 helm-for-files를 실행합니다
;;     (define-key debugger-mode-map (kbd "SPC") 'helm-for-files)
;;     ))

;; Horizontal <--> Vertical view를 토글해주는 함수
(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

;; Alt + ] 키로 horizontal <--> vertical을 토글하는 키를 설정한다
(global-set-key (kbd "M-]") 'window-split-toggle)

;; Package: key-chord
(require 'key-chord)
;; 두 키가 입력되는데 걸리는 시간 설정
(setq key-chord-two-keys-delay 0.1) ; default 0.1
;; 1개의 키가 입력되는데 걸리는 시간 설정
(setq key-chord-one-key-delay 0.17) ; default 0.2
(key-chord-define-global "zc" 'save-buffers-kill-terminal)     ;; emacs 종료하기 (or emacsclient)
(key-chord-define-global "zv" 'kill-emacs)                     ;; emacs --daemon 종료하기
(key-chord-mode t)
;; (key-chord-define-global "mm" 'jedi:complete)                  ;; 코드 자동완성 for python
;; (key-chord-define-global "zz" 'helm-gtags-dwim)                ;; 코드 네비게이션 함수 찾아가기
;; (key-chord-define-global "aa" 'helm-gtags-pop-stack)           ;; 코드 네비게이션 돌아오기
;; (key-chord-define-global "ZZ" 'xref-find-definitions)          ;; 코드 네비게이션 함수 찾아가기 (up to emacs 25.2)
;; (key-chord-define-global "AA" 'xref-pop-marker-stack)          ;; 코드 네비게이션 돌아오기      (up to emacs 25.2)
;; (key-chord-define-global "MM" 'ac-complete-semantic)           ;; 코드 자동완성
;; (key-chord-define-global "mm" 'ac-complete-semantic-raw)       ;; 코드 자동완성2
;;(key-chord-define-global "??" 'split-window-right)             ;; 오른쪽에 새창 만들기 (NOT USED)
;;(key-chord-define-global ">>" 'split-window-below)             ;; 아래쪽에 새창 만들기 (NOT USED)
;;(key-chord-define-global "<<" 'ac-complete-semantic-raw)       ;; 코드 자동완성2 (NOT USED)


;; .h header 파일을 c++ 모드로 설정합니다
;; 아니면 아래 라인을 적용하지 않고 헤더파일 맨 첫줄에 // -*-c++-*- 구문을 입력합니다
;; 아니면 .hpp 파일로 만들면 됩니다
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; xml 구문을 folding해서 쉽게 보기 위해 아래와 같이 코드를 작성합니다.
(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"
               "<!--"
               sgml-skip-tag-forward
               nil))
(add-hook 'nxml-mode-hook 'hs-minor-mode)

;; Alt + g 키로 xml 파일 내에서 코드를 folding할 수 있습니다
(define-key nxml-mode-map (kbd "M-g") 'hs-toggle-hiding)
;; nxml(.launch file) 모드에서도 C-c + / 키로 edward.org 파일을 엽니다 (deprecated)
;; (define-key nxml-mode-map (kbd "C-c /") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/edward.org")))

;; grep-find (C-p) 명령어에서 새로운 grep 창이 열리지 않고 바로 현재창이 바뀌도록 하는 코드
(eval-when-compile (require 'cl))
(defun kill-grep-window ()
  (destructuring-bind (window major-mode)
      (with-selected-window (next-window (selected-window))
        (list (selected-window) major-mode))
    (when (eq major-mode 'grep-mode)
      (delete-window window))))
(add-hook 'next-error-hook 'kill-grep-window)

;; *scratch* 버퍼를 새로 생성하는 함수
(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (emacs-lisp-mode)
  )

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Roboto Mono for Powerline" :weight normal))))
 )

;; ROS의 .launch 파일을 xml모드로 구문 하이라이팅하기 위해 설정합니다
(setq auto-mode-alist
      (append '((".*\\.launch\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.xacro\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.urdf\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.gazebo\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.world\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.sdf\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.vim\\'" . ruby-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.msg\\'" . ruby-mode))
              auto-mode-alist))
;; .cu 같은 CUDA 확장자를 c++ 환경으로 인식하도록 설정합니다
(setq auto-mode-alist
      (append '((".*\\.cu\\'" . c++-mode))
              auto-mode-alist))

;; .emacs_w 파일을 elisp 모드로 세팅합니다.
(setq auto-mode-alist
      (append '((".*\\.emacs_w\\'" . emacs-lisp-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.emacs.atlas1\\'" . emacs-lisp-mode))
              auto-mode-alist))

;; Map Alt key to Meta Alt키를 Meta키로 인식하도록 설정한다 (vnc에서 emacs를 사용하는 경우)
(setq x-alt-keysym 'meta)

;; ad-handle-definition 'winner-mode' got redefined 경고를 없애줍니다
(setq ad-redefinition-action 'accept)

;; Disable Beeping when using VNC
(setq visible-bell 1)

;; 가끔씩 evil-mode search freezing 현상이 일어날 때가 있는데 이를 방지하기 위해 설정한 코드
;; https://github.com/syl20bnr/spacemacs/issues/3623
(setq-default search-invisible t)

;; for org-mode timestamp English ver.
;; <2018-12-19 수> ==> <2018-12-19 Wed>
(setq system-time-locale "C")

;; emacs titlebar의 이름을 제거합니다.
(setq frame-title-format "")

;; Variable Customizing========================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(async-bytecomp-allowed-packages (quote (async helm helm-core helm-ls-git helm-ls-hg magit)))
 '(auto-hscroll-mode t)
 '(avy-all-windows nil)
 '(avy-keys
   (quote
    (97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122)))
 '(avy-style (quote at-full))
 '(cmake-ide-make-command "make -j4")
 '(column-number-mode t)
 '(company-backends (quote (company-irony company-clang company-cmake)))
 '(compilation-message-face (quote default))
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-format "%H:%M, %D")
 '(ecb-layout-name "left3")
 '(ecb-layout-window-sizes
   (quote
    (("right2"
      (ecb-directories-buffer-name 0.33189655172413796 . 0.27586206896551724)
      (ecb-methods-buffer-name 0.33189655172413796 . 0.7241379310344828))
     ("left3"
      (ecb-directories-buffer-name 0.2 . 0.29411764705882354)
      (ecb-sources-buffer-name 0.2 . 0.3333333333333333)
      (ecb-methods-buffer-name 0.2 . 0.35294117647058826))
     ("right1"
      (ecb-directories-buffer-name 0.3151515151515151 . 0.20833333333333334)
      (ecb-sources-buffer-name 0.3151515151515151 . 0.2916666666666667)
      (ecb-methods-buffer-name 0.3151515151515151 . 0.4791666666666667))
     ("left14"
      (ecb-directories-buffer-name 0.271523178807947 . 0.7317073170731707)
      (ecb-history-buffer-name 0.271523178807947 . 0.24390243902439024)))))
 '(ecb-options-version "2.50")
 '(ecb-tip-of-the-day nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(evil-mode-line-format (quote (after)))
 '(fci-rule-color "#073642")
 '(find-file-visit-truename t)
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:modified-sign "▸")
 '(helm-bookmark-show-location t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-foreground-color "black")
 '(highlight-symbol-idle-delay 0.25)
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(magit-diff-use-overlays nil)
 '(minimap-enlarge-certain-faces nil)
 '(minimap-highlight-line nil)
 '(minimap-major-modes (quote (prog-mode org-mode)))
 '(minimap-minimum-width 20)
 '(minimap-update-delay 0.01)
 '(minimap-window-location (quote right))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-current-time-string "now ------------------------------------------")
 '(org-agenda-files
   (quote
    ("~/gitrepo/ims_org/org_files/notes/slam-paper/slam-paper.org" "~/gitrepo/ims_org/org_files/notes/ip_list.org" "~/gitrepo/ims_org/org_files/notes/atlas-robotics/atlas.org" "~/gitrepo/ims_org/org_files/notes/feature_based_method.org" "~/gitrepo/ims_org/org_files/notes/computer_specification.org" "~/gitrepo/ims_org/org_files/daily.org" "~/gitrepo/ims_org/org_files/gcal.org" "~/gitrepo/ims_org/org_files/issues.org" "~/gitrepo/ims_org/org_files/milestone.org" "~/gitrepo/ims_org/org_files/quick.org" "~/gitrepo/ims_org/org_files/todo.org" "~/gitrepo/ims_org/org_files/notes/algorithm.org" "~/gitrepo/ims_org/org_files/notes/camera_calibration.org" "~/gitrepo/ims_org/org_files/notes/cmd_command.org" "~/gitrepo/ims_org/org_files/notes/convex_optimization.org" "~/gitrepo/ims_org/org_files/notes/emacs_custom_commands.org" "~/gitrepo/ims_org/org_files/notes/estimation_theory.org" "~/gitrepo/ims_org/org_files/notes/freiburg_robotics.org" "~/gitrepo/ims_org/org_files/notes/homography.org" "~/gitrepo/ims_org/org_files/notes/intelligent_convergence_system_mid_2019.org" "~/gitrepo/ims_org/org_files/notes/least_square.org" "~/gitrepo/ims_org/org_files/notes/matrix_cookbook.org" "~/gitrepo/ims_org/org_files/notes/org-bullet-windows.org" "~/gitrepo/ims_org/org_files/notes/org-colored-text.org" "~/gitrepo/ims_org/org_files/notes/private_stuff.org" "~/gitrepo/ims_org/org_files/notes/road-slam.org" "~/gitrepo/ims_org/org_files/notes/rodrigues_formula.org" "~/gitrepo/ims_org/org_files/notes/rtags_cmake_ide.org" "~/gitrepo/ims_org/org_files/notes/snu_interviews.org" "~/gitrepo/ims_org/org_files/notes/tigerk0430.github.io.org" "~/gitrepo/ims_org/org_files/notes/ubuntu_tips.org" "~/gitrepo/ims_org/org_files/notes/vs2017.org")))
 '(org-agenda-finalize-hook
   (quote
    ((lambda nil
       (save-excursion
         (goto-char
          (point-min))
         (while
             (re-search-forward "gcal:" nil t)
           (add-text-properties
            (match-beginning 0)
            (point-at-eol)
            (quote
             (face
              (:foreground "dark gray")))))))
     (lambda nil
       (save-excursion
         (goto-char
          (point-min))
         (while
             (re-search-forward "now" nil t)
           (add-text-properties
            (match-beginning 0)
            (point-at-eol)
            (quote
             (face
              (:foreground "deep sky blue" :weight bold))))))))))
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-time-grid
   (quote
    ((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     "......" " ")))
 '(org-bullets-bullet-list (quote ("●" "◉" "▸" "✸")))
 '(org-capture-before-finalize-hook (quote (org-gcal--capture-post)))
 '(org-capture-bookmark nil)
 '(org-capture-prepare-finalize-hook
   (quote
    ((lambda nil
       (goto-line
        (+
         (line-number-at-pos)
         -2))
       (beginning-of-line)
       (insert "*"))
     (lambda nil
       (progn
         (if
             (or
              (string=
               (buffer-name)
               "CAPTURE-issues.org")
              (string=
               (buffer-name)
               "CAPTURE-quick.org"))
             (progn
               (setq num 1)
               (loop
                (< num 2000)
                (let
                    ((numbering
                      (concat "#"
                              (number-to-string num)))
                     (content
                      (with-current-buffer
                          (cadr
                           (split-string
                            (buffer-name)
                            "-"))
                        (buffer-substring-no-properties
                         (point-min)
                         (point-max))))
                     (capture_content
                      (with-current-buffer
                          (buffer-name)
                        (buffer-substring-no-properties
                         (point-min)
                         (point-max)))))
                  (if
                      (save-excursion
                        (goto-char
                         (point-min))
                        (string-match numbering content))
                      nil
                    (return
                     (progn
                       (if
                           (string=
                            (buffer-name)
                            "CAPTURE-issues.org")
                           (progn
                             (beginning-of-line)
                             (search-forward "OPEN")
                             (insert
                              (concat " " numbering)))
                         (progn
                           (end-of-line)
                           (insert numbering))))))
                  (setq num
                        (1+ num)))))))))))
 '(org-default-priority 66)
 '(org-gcal-auto-archive nil)
 '(org-hide-emphasis-markers t)
 '(org-keep-stored-link-after-insertion t)
 '(org-link-file-path-type (quote relative))
 '(org-link-parameters
   (quote
    (("bibtex" :follow org-bibtex-open :store org-bibtex-store-link)
     ("colorbold" :follow
      #[257 "\300\207"
            ["No follow action."]
            2 "No follow action.

(fn PATH)"]
      :export
      #[771
        [color-name-rgb-alist latex format "{\\color{%s}%s}" html assoc nil 65535.0 255 2 65535.0 3 65535.0 "<span style=\"color: rgb(%s,%s,%s);font-weight:bold\">%s</span>" truncate "No Color RGB for %s"]
        13 "

(fn COLOR DESCRIPTION BACKEND)"])
     ("color" :follow
      #[257 "\300\207"
            ["No follow action."]
            2 "No follow action.

(fn PATH)"]
      :export
      #[771
        [color-name-rgb-alist latex format "{\\color{%s}%s}" html assoc nil 65535.0 255 2 65535.0 3 65535.0 "<span style=\"color: rgb(%s,%s,%s)\">%s</span>" truncate "No Color RGB for %s"]
        13 "
(fn COLOR DESCRIPTION BACKEND)"])
     ("file+sys")
     ("file+emacs")
     ("doi" :follow org--open-doi-link)
     ("elisp" :follow org--open-elisp-link)
     ("file" :complete org-file-complete-link)
     ("ftp" :follow
      (lambda
        (path)
        (browse-url
         (concat "ftp:" path))))
     ("help" :follow org--open-help-link)
     ("http" :follow
      (lambda
        (path)
        (browse-url
         (concat "http:" path))))
     ("https" :follow
      (lambda
        (path)
        (browse-url
         (concat "https:" path))))
     ("mailto" :follow
      (lambda
        (path)
        (browse-url
         (concat "mailto:" path))))
     ("news" :follow
      (lambda
        (path)
        (browse-url
         (concat "news:" path))))
     ("shell" :follow org--open-shell-link))))
 '(org-lowest-priority 68)
 '(org-reverse-note-order nil)
 '(org-scheduled-delay-days 0)
 '(org-tags-column -80)
 '(org-time-stamp-custom-formats (quote ("[%m/%d/%y %a]" . "[%m/%d/%y %a %H:%M]")))
 '(package-selected-packages
   (quote
    (monokai-theme zenburn-theme docker-tramp electric-operator auto-indent-mode cmake-mode spacemacs-theme tabbar cmake-ide rtags centered-cursor-mode minimap ov ox-twbs per-buffer-theme use-package smart-mode-line pomodoro tea-time image+ sr-speedbar org-gcal company-irony irony mic-paren htmlize org-preview-html jedi-direx yasnippet ws-butler undo-tree smartparens rainbow-delimiters key-chord jedi highlight-indentation helm-swoop helm-projectile helm-gtags google-c-style flycheck ecb duplicate-thing dtrt-indent clean-aindent-mode anzu)))
 '(pomodoro-break-time 5)
 '(pomodoro-extra-time 5)
 '(pomodoro-play-sounds nil)
 '(pomodoro-work-time 25)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(recenter-positions (quote (middle top bottom)))
 '(rtags-other-window-window-size-percentage 1)
 '(rtags-split-window-function (quote split-window-below))
 '(rtags-tracking t)
 '(rtags-tracking-timer-interval 0.1)
 '(rtags-use-bookmarks nil)
 '(safe-local-variable-values
   (quote
    ((cmake-ide-cmake-args . "RelWithDebInfo")
     (eval font-lock-add-keywords nil
           (\`
            (((\,
               (concat "("
                       (regexp-opt
                        (quote
                         ("sp-do-move-op" "sp-do-move-cl" "sp-do-put-op" "sp-do-put-cl" "sp-do-del-op" "sp-do-del-cl"))
                        t)
                       "\\_>"))
              1
              (quote font-lock-variable-name-face))))))))
 '(shell-escape-mode "-shell-escape")
 '(sml/battery-format "")
 '(sml/col-number-format "")
 '(sml/full-mode-string " ")
 '(sml/line-number-format "")
 '(sml/mode-width 2)
 '(sml/modified-char "* ")
 '(sml/no-confirm-load-theme t)
 '(sml/numbers-separator "")
 '(sml/position-percentage-format "")
 '(sml/prefix-face-list (quote ((":SU:" sml/sudo) (":G" sml/git) ("" sml/prefix))))
 '(sml/prefix-regexp (quote (":\\(.*:\\)" "\\[.*]" "~/")))
 '(sml/projectile-replacement-format "[%s] ")
 '(sml/read-only-char "R ")
 '(sml/shorten-directory nil)
 '(sml/show-client t)
 '(sml/show-remote nil)
 '(sml/show-trailing-N nil)
 '(sml/size-indication-format "")
 '(sml/theme (quote respectful))
 '(sml/use-projectile-p (quote before-prefixes))
 '(sml/vc-mode-show-backend nil)
 '(sp-base-key-bindings nil)
 '(sp-escape-quotes-after-insert nil)
 '(speedbar-update-flag t)
 '(split-width-threshold 150)
 '(tabbar-cycle-scope nil)
 '(tabbar-separator (quote ("|")))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c8805d801780")
     (60 . "#bec073400bc0")
     (80 . "#b58900")
     (100 . "#a5008e550000")
     (120 . "#9d0091000000")
     (140 . "#950093aa0000")
     (160 . "#8d0096550000")
     (180 . "#859900")
     (200 . "#66aa9baa32aa")
     (220 . "#57809d004c00")
     (240 . "#48559e556555")
     (260 . "#392a9faa7eaa")
     (280 . "#2aa198")
     (300 . "#28669833af33")
     (320 . "#279993ccbacc")
     (340 . "#26cc8f66c666")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"])
 '(yas-also-auto-indent-first-line t)
 '(yas-also-indent-empty-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :foreground "gainsboro" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 103 :width normal :foundry "ADBO" :family "Source Code Pro"))))
 '(avy-lead-face ((t (:inherit isearch :background "#1c1c1c" :foreground "yellow" :weight bold))))
 '(avy-lead-face-0 ((t (:inherit isearch :background "#1c1c1c" :foreground "yellow" :box nil :weight bold))))
 '(avy-lead-face-1 ((((class color) (min-colors 89)) (:inherit isearch :background "#cb4b16"))))
 '(avy-lead-face-2 ((t (:inherit isearch :background "gold"))))
 '(cfw:face-today ((t (:background "#262626" :foreground "gainsboro" :weight bold))))
 '(diff-added ((t (:background "dark olive green" :foreground "white smoke"))))
 '(diff-hunk-header ((t (:inherit diff-header :background "black"))))
 '(diff-refine-added ((t (:background "olive drab"))))
 '(diff-refine-changed ((t (:background "nil"))))
 '(diff-refine-removed ((t (:background "firebrick"))))
 '(diff-removed ((t (:background "brown" :foreground "white smoke"))))
 '(dired-directory ((t (:foreground "gold" :weight normal))))
 '(ecb-default-highlight-face ((t (:background "dark violet"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "forest green"))))
 '(font-lock-comment-face ((t (:foreground "lime green" :slant normal))))
 '(hi-blue ((t (:background "blue" :foreground "#5c95b9"))))
 '(hi-blue-b ((t (:background "cyan" :foreground "#49a19a" :weight bold))))
 '(hi-green ((t (:background "green" :foreground "#8c9d50"))))
 '(hi-green-b ((t (:background "chartreuse" :foreground "#899b30" :weight bold))))
 '(hi-pink ((t (:background "pink" :foreground "#b36b91"))))
 '(hi-red-b ((t (:background "orange" :foreground "#c65351" :weight bold))))
 '(hi-yellow ((t (:background "yellow" :foreground "#a39450"))))
 '(highlight-symbol-face ((t (:background "#5f5f5f" :foreground "yellow"))))
 '(hl-line ((t (:background "dim gray"))))
 '(iedit-occurrence ((t (:foreground "magenta" :weight bold))))
 '(iedit-read-only-occurrence ((t (:foreground "magenta"))))
 '(magit-diff-hunk-heading ((t (:background "dark slate gray" :foreground "light gray"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "dark cyan" :foreground "light gray"))))
 '(minimap-active-region-background ((t nil)))
 '(minimap-semantic-function-face ((t (:inherit (font-lock-function-name-face minimap-font-face)))))
 '(minimap-semantic-type-face ((t (:inherit (font-lock-type-face minimap-font-face)))))
 '(minimap-semantic-variable-face ((t (:inherit (font-lock-function-name-face minimap-font-face)))))
 '(org-agenda-calendar-event ((t (:foreground "gainsboro"))))
 '(org-agenda-date ((t (:background "light gray" :foreground "black" :inverse-video nil :box (:line-width 2 :color "#002b36") :overline nil :slant normal :weight normal :height 1.0))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :background "#002b36" :foreground "deep sky blue" :inverse-video t :overline nil :weight normal))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :foreground "black" :inverse-video nil :overline nil :underline t))))
 '(org-agenda-done ((t (:foreground "gainsboro" :slant italic))))
 '(org-block ((t (:foreground "gainsboro"))))
 '(org-checkbox ((t (:background "#3f3f3f" :foreground "white" :box nil))))
 '(org-checkbox-statistics-done ((t (:foreground "gainsboro" :weight bold))))
 '(org-checkbox-statistics-todo ((t (:foreground "gainsboro" :weight bold))))
 '(org-code ((t (:foreground "aquamarine"))))
 '(org-date ((t (:foreground "goldenrod" :underline nil :height 0.8))))
 '(org-level-1 ((t (:inherit variable-pitch :foreground "gainsboro" :weight normal :height 1.0))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "green yellow" :weight normal :height 0.99))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "medium spring green" :weight normal :height 0.99))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "gainsboro" :weight normal :height 0.99))))
 '(org-level-5 ((t (:inherit variable-pitch :foreground "sky blue" :weight normal :height 0.99))))
 '(org-level-6 ((t (:inherit variable-pitch :foreground "yellow3"))))
 '(org-level-7 ((t (:inherit variable-pitch :foreground "light sea green" :weight normal))))
 '(org-link ((t (:foreground "gold" :box nil :underline t :weight normal))))
 '(org-meta-line ((t (:foreground "#586e75" :slant normal))))
 '(org-priority ((t (:inherit font-lock-keyword-face :foreground "gray"))))
 '(org-scheduled ((t (:foreground "gainsoboro" :weight normal))))
 '(org-scheduled-previously ((t (:foreground "gainsboro" :slant normal :weight normal))))
 '(org-scheduled-today ((t (:foreground "gainsoboro" :weight normal :height 1.0))))
 '(org-special-keyword ((((class color) (min-colors 89)) (:foreground "#586e75" :weight bold))))
 '(org-tag ((t (:foreground "gainsboro" :underline nil :slant normal :weight bold :height 1.0))))
 '(org-time-grid ((t (:foreground "gainsboro"))))
 '(org-upcoming-deadline ((t (:inherit org-priority :foreground "yellow2" :underline nil :weight normal))))
 '(org-verbatim ((t (:foreground "deep pink"))))
 '(tabbar-button ((t (:inherit tabbar-default))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default :foreground "white"))))
 '(tabbar-default ((t (:foreground "white" :height 0.9))))
 '(tabbar-highlight ((t (:foreground "white"))))
 '(tabbar-modified ((t (:inherit tabbar-default :foreground "green"))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "cyan"))))
 '(tabbar-selected-modified ((t (:inherit tabbar-default :foreground "red"))))
 '(tabbar-unselected ((t (:inherit tabbar-default))))
 '(variable-pitch ((t (:family "Roboto Mono for Powerline" :weight normal)))))
