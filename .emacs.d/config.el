(add-to-list 'load-path "~/.emacs.d/config/")

(require 'buffer-move)          ;; Buffer-move for better window management
;(require 'elpaca-setup)         ;; The Elpaca Package Manager

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq default-directory "~/")

; Tree-sitter
(require 'treesit)

(setq user-full-name "toru"
      user-mail-address "toru777average@cock.li")

;(global-undo-tree-mode)

;; Save last place in file
(save-place-mode 1)

;; Enable mouse-support for the terminal-version
(xterm-mouse-mode 1)

(setq display-buffer-alist
 '(
   ("\\*Occur\\*"
    (display-buffer-reuse-mode-window
     display-buffer-below-selected)
     (window-height . fit-window-to-buffer)
   )))

;; Window undo/redo commands
;(winner-mode 1)

;(pixel-scroll-precision-mode 1)

(defvar +scroll-delta 180)

(defun +scroll-up-some ()
  (interactive)
  (pixel-scroll-precision-scroll-up +scroll-delta))

(defun +scroll-down-some ()
  (interactive)
  (pixel-scroll-precision-scroll-down +scroll-delta))

 (defun +bind-scroll-keys (mode-map)
   (evil-define-key '(motion normal) mode-map (kbd "K") '+scroll-up-some)
   (evil-define-key '(motion normal) mode-map (kbd "J") '+scroll-down-some))

;; no backup files with ~ at the end
(setq make-backup-files nil)

;; Temp/backups files directory
(setq backup-directory-alist '((".*" . "~/.local/share/Trash/files")))

;; Italic comments
(set-face-attribute 'default nil :height 120)
(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)
(setq-default line-spacing 0.12)

;; General Settings
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq org-hide-emphasis-markers t)
(setq native-comp-async-report-warnings-errors 'silent)
(setq org-edit-src-content-indentation 0)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(setq confirm-kill-emacs nil)
(eval-after-load 'auto-complete '(global-auto-complete-mode 1))
(global-set-key [escape] 'keyboard-escape-quit)

(setq use-file-dialog nil)  ;; No file dialog
(setq use-dialog-box nil)   ;; No dialog box
(setq pop-up-window nil)    ;; No popup windows
(delete-selection-mode 1)    ;; You can select text and delete it by typing.
(electric-indent-mode 1)    ;; Turn on the weird indenting that Emacs does by default.
(electric-pair-mode -1)       ;; Turns on automatic parens pairing
;; The following prevents <> from auto-pairing when electric-pair-mode is on.
;; Otherwise, org-tempo is broken when you try to <s TAB...
(add-hook 'org-mode-hook (lambda ()
                           (setq-local electric-pair-inhibit-predicate
                                       `(lambda (c)
                                          (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
(global-auto-revert-mode t)  ;; Automatically show changes if the file has changed
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-visual-line-mode t)  ;; Enable truncated lines
(scroll-bar-mode -1)         ;; Disable the scroll bar
(menu-bar-mode 1)           ;; Disable the menu bar
(tool-bar-mode 1)           ;; Disable the tool bar
(setq tool-bar-style 'both)
(setq org-edit-src-content-indentation 0) ;; Set src block automatic indent to 0 instead of 2.
(setq redisplay-dont-pause t
      scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setenv "PATH" (concat (getenv "PATH") ":/nix/store/2pdl1pbmbjb85xwsd66dmnd5233bsj8d-system-path/bin"))
(setq exec-path (append exec-path '("/nix/store/2pdl1pbmbjb85xwsd66dmnd5233bsj8d-system-path/bin")))

(setq inhibit-startup-message t) ;doesnt show the default emacs startpage
(setq inhibit-startup-screen t)
;(setq initial-buffer-choice 'about-emacs)
;(switch-to-buffer-other-window "*scratch*")

;; (use-package dashboard
;;   :ensure t
;;   :init
;;   (setq initial-buffer-choice 'dashboard-open)
;;   (setq dashboard-set-footer nil)

;;   (setq dashboard-icon-type 'all-the-icons) ;; use `all-the-icons' package
;;   (setq dashboard-display-icons-p t) ;; display icons on both GUI and terminal
;;   (setq dashboard-icon-type 'nerd-icons) ;; use `nerd-icons' package
;;   (setq dashboard-set-heading-icons t)
;;   (setq dashboard-set-file-icons t)

;;   (setq dashboard-set-init-info t)
;;    ;(setq dashboard-init-info "This is an init message!")
;;    (setq dashboard-show-shortcuts t)
;;    (setq dashboard-banner-logo-title "More Than a Text Editor")
;;    (setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
;;   (setq dashboard-startup-banner "~/.emacs.d/img/dr.png")  ;; use custom image as banner
;;   (setq dashboard-page-separator "\n\^L\n")
;;   (setq dashboard-center-content t) ;; set to 't' for centered content
;;   (setq dashboard-items '((recents  . 5)
;;                        (bookmarks . 5)))
;; :config
;;   (dashboard-setup-startup-hook))

;; Theme
(load-theme 'doom-one t)

; Font
(set-face-attribute 'default nil
		    :family "jetbrains mono"
		    :height 135
		    ;;:weight 'semilight
		    )

(custom-set-faces
 `(org-checkbox ((t :box (:line-width 2 :color "gray"
           :style released-button)))))



(setq modus-themes-org-blocks 'gray-background)
(add-to-list 'custom-theme-load-path "~/.emacs.d/etc/themes")

;; Transparency
(set-frame-parameter nil 'alpha-background 97)
(add-to-list 'default-frame-alist '(alpha-background . 97))

;; Blinking cursor
(setq blink-cursor-mode nil)

;; Buffers
;(global-tab-line-mode 1)

;; Tabs
;(tab-bar-mode 1)

(global-prettify-symbols-mode t)

;; (setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "†")
;;                                        ("#+END_SRC" . "†")
;;                                        ("#+begin_src" . "†")
;;                                        ("#+end_src" . "†")
;;                                        (">=" . "≥")
;;                                        ("=>" . "⇨")))
;; (setq prettify-symbols-unprettify-at-point 'right-edge)
;; (add-hook 'org-mode-hook 'prettify-symbols-mode)

(use-package simple-modeline
   :hook (after-init . simple-modeline-mode))

;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode))
;; (setq doom-modeline-enable-word-count t)

(use-package diminish
  :ensure t)

;; Default custom modeline
(setq-default mode-line-format (delq 'mode-line-modes mode-line-format))

'(mode-line ((t (:background "color-233" :foreground "cyan"))))
 '(mode-line-inactive ((t (:inherit mode-line :background "color-233" :foreground "brightblack" :weight light))))

;; DRAW A BOX AROUND THE MODELINE
;; (set-face-attribute 'mode-line nil
;;                 :box '(:line-width 1 :color "white"))

(setq display-time-day-and-date t
      display-time-format "%a, %d-%m-%y %I:%M") ;; displays date

(display-time-mode 1) ;; displays current time

(setq display-time-default-load-average nil)
(setq display-time-load-average nil)

(use-package general
  :ensure t
  :config
  (general-evil-setup)
  (eval-after-load "org" '(define-key org-mode-map (kbd "C-j") nil))
  (eval-after-load "org" '(define-key org-mode-map (kbd "C-k") nil))
  (eval-after-load "org" '(define-key org-mode-map (kbd "M-l") nil))
  (general-define-key
   :states '(normal insert motion)
   "C-h" 'evil-window-left
   "C-j" 'evil-window-down
   "C-k" 'evil-window-up
   "C-l" 'evil-window-right
   "M-l" 'org-make-olist)

  (general-create-definer user/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set 'SPC' as leader key
    :global-prefix "C-SPC") ;; access leader in insert mode
  
  (user/leader-keys
    "." '(find-file :wk "Find file")
    ;"=" '(perspective-map :wk "Perspective") ;; Lists all the perspective keybindings
    "TAB TAB" '(comment-line :wk "Comment lines")
    "u" '(universal-argument :wk "Universal argument"))

   (user/leader-keys
    "a" '(:ignore t :wk "Agenda buffers")
    "a" '(org-agenda :wk "Open the agenda"))

  (user/leader-keys
    "b" '(:ignore t :wk "Bookmarks/Buffers")
    "b r" '(recentf :wk "Recent files")
    "b d" '(bookmark-delete :wk "Delete bookmark")
    "b k" '(kill-current-buffer :wk "Kill current buffer")
    "b K" '(kill-some-buffers :wk "Kill multiple buffers")
    "b l" '(consult-bookmark :wk "List bookmarks")
    "b m" '(bookmark-set :wk "Set bookmark")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b x" '(revert-buffer :wk "Reload buffer")
    "b s" '(basic-save-buffer :wk "Save buffer")
    "b S" '(save-some-buffers :wk "Save multiple buffers")
    "b w" '(bookmark-save :wk "Save current bookmarks to bookmark file"))

  (user/leader-keys
    "e" '(:ignore t :wk "Eshell/Eval/EWW")
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "e e" '(eval-expression :wk "Evaluate and elisp expression")
    "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "e r" '(eval-region :wk "Evaluate elisp in region")
    "e w" '(eww :which-key "EWW emacs web wowser"))
  
  (user/leader-keys
    "i" '(:ignore t :wk "Insert")
    "i i" '(ispell :wk "Insert ispell")
    "i d" '(org-id-get-create :wk "Insert id")
    "i n" '(increment-number-at-point :wk "Increment numbers")
    "i o" '(org-schedule :wk "Org scheduled")
    "i f" '(org-deadline :wk "Org deadline")
    "i m" '(org-time-stamp :wk "Org timestamp")
    "i t" '(org-set-tags-command :wk "Org set tags")
    "i y" '(consult-yank-from-kill-ring :wk "Kill ring")
    "i e" '(org-export-dispatch :wk "Org export")
    "i l" '(org-make-list :wk "Make automatic numerical lists")
    "i c" '(org-capture :wk "Capture")
    "i s" '(consult-yasnippet :wk "Insert snippet"))

  (user/leader-keys
    "p" '(:ignore t :wk "Projects")
    "p p" '(project-switch-project :wk "Search projects")
    "p d" '(project-find-dir :wk "Find directory project"))

  (user/leader-keys
    "r" '(:ignore t :wk "Org-Roam")
    "r b" '(org-roam-buffer-toggle :wk "Toggle buffer")
    "r f" '(org-roam-node-find :wk "Find notes")
    "r c" '(org-roam-capture :wk "Capture notes")
    "r d" '(org-roam-dailies-capture-date :wk "Capture date 'dailies'")
    "r i" '(org-roam-node-insert :wk "Insert note link"))

  (user/leader-keys
    "s" '(:ignore t :wk "Search")
    "s o" '(occur :wk "Occur")
    "s s" '(consult-line :wk "Consult line")
    "s a" '(avy-goto-char :wk "Avy go to char")
    "s c" '(consult-buffer :wk "Consult global")
    "s r" '(replace-regexp :wk "Search & replace")
    "s l" '(consult-outline :wk "Travel on org-headings"))

    (user/leader-keys
    "h" '(:ignore t :wk "Help")
    "h b" '(describe-bindings :wk "Describe bindings")
    "h c" '(describe-char :wk "Describe character under cursor")
    "h d" '(:ignore t :wk "Emacs documentation")
    "h d a" '(about-emacs :wk "About Emacs")
    "h d d" '(view-emacs-debugging :wk "View Emacs debugging")
    "h d f" '(view-emacs-FAQ :wk "View Emacs FAQ")
    "h d m" '(info-emacs-manual :wk "The Emacs manual")
    "h d n" '(view-emacs-news :wk "View Emacs news")
    "h d o" '(describe-distribution :wk "How to obtain Emacs")
    "h d p" '(view-emacs-problems :wk "View Emacs problems")
    "h d t" '(view-emacs-todo :wk "View Emacs todo")
    "h d w" '(describe-no-warranty :wk "Describe no warranty")
    "h e" '(view-echo-area-messages :wk "View echo area messages")
    "h f" '(describe-function :wk "Describe function")
    "h F" '(describe-face :wk "Describe face")
    "h g" '(describe-gnu-project :wk "Describe GNU Project")
    "h i" '(info :wk "Info")
    "h I" '(describe-input-method :wk "Describe input method")
    "h k" '(describe-key :wk "Describe key")
    "h l" '(view-lossage :wk "Display recent keystrokes and the commands run")
    "h L" '(describe-language-environment :wk "Describe language environment")
    "h m" '(describe-mode :wk "Describe mode")
    "h r" '(:ignore t :wk "Reload")
    "h r r" '((lambda () (interactive)
                (load-file "~/.emacs.d/init.el"))
              :wk "Reload emacs config")
    "h t" '(consult-theme :wk "Load theme")
    "h v" '(describe-variable :wk "Describe variable")
    "h w" '(where-is :wk "Prints keybinding for command if set")
    "h x" '(describe-command :wk "Display full documentation for command"))

  (user/leader-keys
    "t" '(:ignore t :wk "Toggle")
    "t c" '(comment-line :wk "Toggle comment lines")
    "t v" '(vundo :wk "Vundo")
    "t s" '(toggle-org-buffer :wk "New scratch buffer")
    "t o" '(olivetti-mode :wk "Toggle olivetti-mode")
    "t i" '(org-toggle-inline-images :wk "Toggle images in org")
    "t n" '(display-line-numbers-mode :wk "Toggle line-numbers"))

 (user/leader-keys
    "w" '(:ignore t :wk "Windows")
    ;; Window splits
    "w c" '(evil-window-delete :wk "Close window")
    "w n" '(evil-window-new :wk "New window")
    "w s" '(evil-window-split :wk "Horizontal split window")
    "w v" '(evil-window-vsplit :wk "Vertical split window")
    "w =" '(balance-windows :wk "Balance your windows")

    ;; Window motions
    "w h" '(evil-window-left :wk "Window left")
    "w j" '(evil-window-down :wk "Window down")
    "w k" '(evil-window-up :wk "Window up")
    "w l" '(evil-window-right :wk "Window right")
    "w w" '(evil-window-next :wk "Goto next window")

    ;; Move Windows
    "w H" '(buf-move-left :wk "Buffer move left")
    "w J" '(buf-move-down :wk "Buffer move down")
    "w K" '(buf-move-up :wk "Buffer move up")
    "w L" '(buf-move-right :wk "Buffer move right"))

  (user/leader-keys
    "z" '(:ignore t :wk "Hydras")
    "z p" '(hydra-personal-files/body :wk "Hydra Personal")
    "z r" '(hydra-OrgRoam/body :wk "Hydra Org Roam")
    "z i" '(hydra-index/body :wk "Hydra Index")
    "z t" '(hydra-toggle/body :wk "Hydra Toggle"))

)

(require 'bind-key)
(bind-key* "<C-return>" 'toru/insert-item-below)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-x k") 'image-kill-buffer)
(global-set-key (kbd "C-x c") 'calendar)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;(global-set-key (kbd "C-x <right>") 'centaur-tabs-forward)
;(global-set-key (kbd "C-x <left>") 'centaur-tabs-backward)
;(global-set-key (kbd "C-v") 'consult-yank-pop)
;; (global-set-key (kbd "C-c <right>") 'tab-line-switch-to-next-tab)
;; (global-set-key (kbd "C-c <left>") 'tab-line-switch-to-prev-tab)
;;;(global-set-key (kbd "C-v") 'org-yank)
;; (global-set-key (kbd "C-z") 'undo-tree-undo)
;; (global-set-key (kbd "C-S-z") 'undo-tree-redo)
;; (global-set-key (kbd "C-<tab>") 'universal-argument)
;; (global-set-key (kbd "C-q") 'kill-ring-save)

(global-set-key (kbd "M-a") 'other-window)

;; (global-set-key (kbd "M-s l") 'consult-outline)
;; (global-set-key (kbd "M-s o") 'occur)
;; (global-set-key (kbd "M-y") 'scroll-up-command)

(setq scroll-preserve-screen-position 1)

;;scroll window up/down by one line
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

(defun export-org-to-pdf-and-cleanup ()
  "Export current org file to PDF, delete generated .log and .tex files, and move PDF to a specific folder."
  (interactive)
  (let* ((org-file (buffer-file-name)) 
         (pdf-folder "~/dc/craft-tools/mispdfs/") 
         (pdf-file (concat pdf-folder (file-name-base org-file) ".pdf")) 
         (default-directory (file-name-directory org-file))) ; Set default directory for export
    (org-latex-export-to-pdf) 
    (delete-file (concat (file-name-base org-file) ".log")) 
    (delete-file (concat (file-name-base org-file) ".tex"))  
    (rename-file (concat (file-name-base org-file) ".pdf") pdf-file t) 
    (message "Exported org file to PDF and cleaned up.")))

(global-set-key (kbd "C-c e") 'export-org-to-pdf-and-cleanup)

(defun new-scratch-pad ()
  "Create a new org-mode buffer for random stuff."
  (interactive)
  (progn
 (let ((buffer (generate-new-buffer "Org-scratch-buffer")))
      (switch-to-buffer buffer)
      (setq buffer-offer-save t)
      (org-mode)
      (olivetti-mode t))))

(defun toggle-org-buffer ()
  "Toggle the Org-scratch-buffer buffer"
  (interactive)
  (if (equal (buffer-name (current-buffer)) "Org-scratch-buffer")
   (if (one-window-p t)
    (switch-to-buffer (other-buffer))
        (delete-window))
    (if (get-buffer "Org-scratch-buffer")
        (if (get-buffer-window "Org-scratch-buffer")
            (progn
     (bury-buffer "Org-scratch-buffer")
     (delete-window (get-buffer-window "Org-scratch-buffer")))
    (switch-to-buffer "Org-scratch-buffer"))
   (new-scratch-pad))))

    (defun increment-number-at-point ()
      (interactive)
      (skip-chars-backward "0-9")
      (or (looking-at "[0-9]+")
          (error "No number at point"))
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

;; Disable line-numbers on fireplace-mode
(add-hook 'fireplace-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

;; Disable line-numbers on org-agenda
(add-hook 'org-agenda-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

;; Disable line-numbers on org-mode
;(add-hook 'org-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

;; Disable line-numbers on pdf-view-mode
(add-hook 'pdf-view-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

;; Disable line-numbers on dired buffer
(add-hook 'dired-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

;; Disable line-numbers on term
(add-hook 'term-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

;; Disable line-numbers on doc-view-mode
(add-hook 'doc-view-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

;; Start GNUS on Emacs startup
;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (gnus)))

;; Create a list selecting several lines
(defun org-make-list (arg)
  (interactive "P")
  (let ((n (or arg 1)))
    (when (region-active-p)
      (setq n (count-lines (region-beginning)
                           (region-end)))
      (goto-char (region-beginning)))
    (dotimes (i n)
      (beginning-of-line)
      (insert (concat (number-to-string (1+ i)) ". "))
      (forward-line))))

;; Create list with C-Enter
(defun toru--insert-item (direction)
  (let ((context (org-element-lineage
                  (org-element-context)
                  '(table table-row headline inlinetask item plain-list)
                  t)))
    (pcase (org-element-type context)
      ;; Add a new list item (carrying over checkboxes if necessary)
      ((or `item `plain-list)
       (let ((orig-point (point)))
         ;; Position determines where org-insert-todo-heading and `org-insert-item'
         ;; insert the new list item.
         (if (eq direction 'above)
             (org-beginning-of-item)
           (end-of-line))
         (let* ((ctx-item? (eq 'item (org-element-type context)))
                (ctx-cb (org-element-property :contents-begin context))
                ;; Hack to handle edge case where the point is at the
                ;; beginning of the first item
                (beginning-of-list? (and (not ctx-item?)
                                         (= ctx-cb orig-point)))
                (item-context (if beginning-of-list?
                                  (org-element-context)
                                context))
                ;; Horrible hack to handle edge case where the
                ;; line of the bullet is empty
                (ictx-cb (org-element-property :contents-begin item-context))
                (empty? (and (eq direction 'below)
                             ;; in case contents-begin is nil, or contents-begin
                             ;; equals the position end of the line, the item is
                             ;; empty
                             (or (not ictx-cb)
                                 (= ictx-cb
                                    (1+ (point))))))
                (pre-insert-point (point)))
           ;; Insert dummy content, so that `org-insert-item'
           ;; inserts content below this item
           (when empty?
             (insert " "))
           (org-insert-item (org-element-property :checkbox context))
           ;; Remove dummy content
           (when empty?
             (delete-region pre-insert-point (1+ pre-insert-point))))))
      ;; Add a new table row
      ((or `table `table-row)
       (pcase direction
         ('below (save-excursion (org-table-insert-row t))
                 (org-table-next-row))
         ('above (save-excursion (org-shiftmetadown))
                 (toru/table-previous-row))))

      ;; Otherwise, add a new heading, carrying over any todo state, if
      ;; necessary.
      (_
       (let ((level (or (org-current-level) 1)))
         ;; I intentionally avoid `org-insert-heading' and the like because they
         ;; impose unpredictable whitespace rules depending on the cursor
         ;; position. It's simpler to express this command's responsibility at a
         ;; lower level than work around all the quirks in org's API.
         (pcase direction
           (`below
            (let (org-insert-heading-respect-content)
              (goto-char (line-end-position))
              (org-end-of-subtree)
              (insert "\n" (make-string level ?*) " ")))
           (`above
            (org-back-to-heading)
            (insert (make-string level ?*) " ")
            (save-excursion (insert "\n"))))
         (run-hooks 'org-insert-heading-hook)
         (when-let* ((todo-keyword (org-element-property :todo-keyword context))
                     (todo-type    (org-element-property :todo-type context)))
           (org-todo
            (cond ((eq todo-type 'done)
                   ;; Doesn't make sense to create more "DONE" headings
                   (car (toru-get-todo-keywords-for todo-keyword)))
                  (todo-keyword)
                  ('todo)))))))

    (when (org-invisible-p)
      (org-show-hidden-entry))
    (when (and (bound-and-true-p evil-local-mode)
               (not (evil-emacs-state-p)))
      (evil-insert 1))))

(defun toru/insert-item-below (count)
  "Inserts a new heading, table cell or item below the current one."
  (interactive "p")
  (dotimes (_ count) (toru--insert-item 'below)))

(defalias 'lp 'org-latex-export-to-pdf)
(defalias 'cf 'consult-find)
(defalias 'cr 'consult-ripgrep)
(defalias 'rc 'recentf-cleanup)
(defalias 'db 'org-roam-db-sync)
(defalias 'id 'org-roam-update-org-id-locations)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Org-directory
(setq org-directory "~/pu/org/")

(setq org-ellipsis "⤵")

;; Org images

(setq org-startup-with-inline-images t)

(setq org-image-actual-width (list 400))

;(setq org-M-RET-may-split-line nil)

;; Abre el org-link en una nueva ventana en vez de un split
(setq org-link-frame-setup
      '((file . find-file)))

;; Default mode
(setq-default major-mode 'org-mode)

;; Scratch buffer default > org-mode
(setq initial-major-mode 'org-mode)

(require 'org-id)

;; Export
(require 'ox-md)
(require 'ox-man)


;; Links org files with their IDs, not their file names
(setq org-id-link-to-org-use-id t)

;; Setting RETURN key in org-mode to follow links
(setq org-return-follows-link  t)

;; Scratch buffer default message
; if you want a message, change the balue 'nil' with "YOUR MESSAGE"
(setq initial-scratch-message nil)

(add-hook 'org-mode-hook 'org-indent-mode)

(eval-after-load 'org-indent '(diminish 'org-indent-mode))

;; Tamaño de headers (titulos)
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.0))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.0)))))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)

(setq org-agenda-files '("~/pu/org/todos.org"
                           "~/pu/org/plans.org"
                           "~/pu/org/aniversarios.org"
                           "~/pu/org/periodic.org"))

(setq org-log-done 'time) ;;put a timestamp when a TODO is done
(setq org-agenda-compact-blocks t)
(setq org-agenda-start-with-log-mode t)
(setq org-log-into-drawer t)
(setq org-agenda-window-setup 'switch-to-buffer-other-window)
(setq org-agenda-block-separator 61)
(setq org-agenda-span 'day) ;; default agenda view
(setq org-priority-faces '((?A . (:foreground "red" :weight 'bold))
                           (?B . (:foreground "yellow"))
                           (?C . (:foreground "green"))))

;; ORG TODO KEYWORDS
(setq org-todo-keywords
      '((sequence "TODO(t)" "NOTE(n)" "PLAN(p)" "|" "CANCELLED(c@)" "DONE(d!)")))

;; BASE
(use-package org-roam
:ensure t
:custom
(org-roam-directory (file-truename "~/pu/org/"))
:config

; If you're using a vertical completion framework, you might want a more informative completion interface
(setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
(org-roam-db-autosync-mode t))

(use-package consult-org-roam
   :ensure t
   :after org-roam
   :init
   (require 'consult-org-roam)
   ;; Activate the minor mode
   (consult-org-roam-mode 1)
   :custom
   ;; Use `ripgrep' for searching with `consult-org-roam-search'
   (consult-org-roam-grep-func #'consult-ripgrep)
   ;; Configure a custom narrow key for `consult-buffer'
   (consult-org-roam-buffer-narrow-key ?r)
   ;; Display org-roam buffers right after non-org-roam buffers
   ;; in consult-buffer (and not down at the bottom)
   (consult-org-roam-buffer-after-buffers t)
   :config
   ;; Eventually suppress previewing for certain functions
   (consult-customize
    consult-org-roam-forward-links
    :preview-key "M-."))

(use-package org-roam-ui)

(setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start nil)

;; TEMPLATES
(setq org-roam-capture-templates
   '(

;; NOTAS
     ("n" "Notas")

     ("ne" "Estudio")

;; Filosofía
     ("nef" "Filosofía" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.1.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Tecnología
     ("net" "Tecnología" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.1.2_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Comunicación
     ("nec" "Comunicación" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.1.3_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Italiano
     ("nei" "Italiano" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.1.4_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Metaprendizaje
     ("nem" "Metaprendizaje" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.1.5_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Personal
     ("nep" "Personal" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.2.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Trabajo
     ("net" "Trabajo" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.4.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("nc" "Craft")

;; Zaralia
     ("ncz" "Zaralia" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.3.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Mindbreak
     ("ncm" "Mindbreak" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.3.2_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Crazy Mythos
     ("ncc" "Crazy Mythos" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.3.3_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Kurai Sekai
     ("nck" "Kurai Sekai" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.3.4_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("nb" "Baile")

;; Casino
     ("nbc" "Casino" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.5.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Sensual
     ("nbs" "Sensual" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.5.2_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Pacheco
     ("nbp" "pacheco" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.5.3_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Linea
     ("nbl" "Linea" plain (file "~/dotfiles/.emacs.d/etc/templates/notas.org")
      :if-new (file+head "1.5.4_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; LIBROS
     ("l" "Libros")

;; Zaralia
     ("lz" "Zaralia")

     ("lzg" "Gran Caza" plain (file "~/dotfiles/.emacs.d/etc/templates/zaralia.org")
      :if-new (file+head "2.1.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lza" "Antinaturales" plain (file "~/dotfiles/.emacs.d/etc/templates/zaralia.org")
      :if-new (file+head "2.1.2_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lzm" "Misticismo" plain (file "~/dotfiles/.emacs.d/etc/templates/zaralia.org")
      :if-new (file+head "2.1.3_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lzg" "Gea" plain (file "~/dotfiles/.emacs.d/etc/templates/zaralia.org")
      :if-new (file+head "2.1.4_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lzh" "Historia" plain (file "~/dotfiles/.emacs.d/etc/templates/zaralia.org")
      :if-new (file+head "2.1.5_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     
;; Mindbreak
     ("lm" "Mindbreak")

     ("lmp" "Programa Jung" plain (file "~/dotfiles/.emacs.d/etc/templates/mindbreak.org")
      :if-new (file+head "2.2.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lmq" "Psique" plain (file "~/dotfiles/.emacs.d/etc/templates/mindbreak.org")
      :if-new (file+head "2.2.2_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lmf" "Profundidades" plain (file "~/dotfiles/.emacs.d/etc/templates/mindbreak.org")
      :if-new (file+head "2.2.3_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Crazy Mythos
     ("lc" "Crazy Mythos")

     ("lch" "Crazy History" plain (file "~/dotfiles/.emacs.d/etc/templates/crazymythos.org")
      :if-new (file+head "2.3.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lct" "Tecnología 915" plain (file "~/dotfiles/.emacs.d/etc/templates/crazymythos.org")
      :if-new (file+head "2.3.2_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lce" "Exteriores" plain (file "~/dotfiles/.emacs.d/etc/templates/crazymythos.org")
      :if-new (file+head "2.3.3_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lcd" "Dimensiones" plain (file "~/dotfiles/.emacs.d/etc/templates/crazymythos.org")
      :if-new (file+head "2.3.4_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

;; Kurai Sekai
     ("lk" "Kurai Sekai")

     ("lkm" "Mundo Oscuro" plain (file "~/dotfiles/.emacs.d/etc/templates/kuraisekai.org")
      :if-new (file+head "2.4.1_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lkk" "Khan" plain (file "~/dotfiles/.emacs.d/etc/templates/kuraisekai.org")
      :if-new (file+head "2.4.2_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lks" "SCPU" plain (file "~/dotfiles/.emacs.d/etc/templates/kuraisekai.org")
      :if-new (file+head "2.4.3_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lkh" "Historia" plain (file "~/dotfiles/.emacs.d/etc/templates/kuraisekai.org")
      :if-new (file+head "2.4.4_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ("lkw" "Mundo" plain (file "~/dotfiles/.emacs.d/etc/templates/kuraisekai.org")
      :if-new (file+head "2.4.5_${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)

     ))

;; DAILIES
(setq org-roam-dailies-directory "~/pu/org/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))



      ;; '(("d" "Dailies" plain (file "~/dotfiles/.emacs.d/etc/templates/dailies.org")
      ;;    :if-new (file+head "%<%Y-%m-%d>.org" "#+title: ${title}\n"))

(setq org-capture-templates
      '(

        ("t" "Todo" entry (file "~/pu/org/todos.org")
         (file "~/.emacs.d/etc/templates/todo-template.txt"))

        ("p" "Plan" entry (file "~/pu/org/plans.org")
         (file "~/.emacs.d/etc/templates/plan-template.txt"))

        ))

(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))

(use-package toc-org
  :ensure t
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(setq toc-org-max-depth 3)

(use-package org-bullets
  :ensure t
  :config)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package org-download)

(add-hook 'dired-mode-hook 'org-download-enable)

(use-package evil
  :ensure t
  :init      ;; tweak evil's configuration before loading it
  (setq evil-want-integration t  ;; This is optional since it's already set to t by default.
        evil-want-keybinding nil
        evil-vsplit-window-right t
        evil-split-window-below t
        evil-undo-system 'undo-redo)  ;; Adds vim-like C-r redo functionality
  (evil-mode))

(use-package evil-goggles
  :ensure t
  :config
  (evil-goggles-mode)

  ;; optionally use diff-mode's faces; as a result, deleted text
  ;; will be highlighed with `diff-removed` face which is typically
  ;; some red color (as defined by the color theme)
  ;; other faces such as `diff-added` will be used for other actions
  (evil-goggles-use-diff-faces))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (add-to-list 'evil-collection-mode-list 'help) ;; evilify help mode
  (evil-collection-init))
;; Using RETURN to follow links in Org/Evil
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))

(setq dired-clean-confirm-killing-deleted-buffers nil)
(setq dired-confirm-shell-command nil)
(setq dired-no-confirm t)
(setq dired-recursive-deletes (quote always))
(setq dired-deletion-confirmer '(lambda (x) t))
(setq dired-recursive-deletes 'always)
(setq confirm-kill-emacs nil)
(setq confirm-kill-processes nil)
(setq confirm-nonexistent-file-or-buffer nil)
(set-buffer-modified-p nil)

(use-package dired-open
  :ensure t
  :after dired
  :config
  (setq dired-open-extensions '(
                                ;; ("jpg" . "nsxiv")
                                ;; ("png" . "nsxiv")
                                ("svg" . "inkscape")
                                ("mp3" . "mpv")
                                ("ogg" . "mpv")
                                ("mkv" . "mpv")
                                ("gif" . "mpv")
                                ("webm" . "mpv")
                                ("mp4" . "mpv")
                                ("pdf" . "zathura"))))

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode)
            (dired-sort-toggle-or-edit)))

;; Sort directories alphabeticly
(setq dired-listing-switches "-al --dired --group-directories-first -h -G")

;; (use-package dired-sidebar
;;   :ensure t
;;   :commands (dired-sidebar-toggle-sidebar))

(use-package vertico
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map
         ("M-h" . dw/minibuffer-backward-kill))
  :custom
  (vertico-cycle t)
  :custom-face
  ;(vertico-current ((t (:background "#3a3f5a"))))
  :init
  (vertico-mode))

(use-package savehist
  :ensure nil
  :config
    (setq history-length 25)
    (savehist-mode 1))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(defun dw/minibuffer-backward-kill (arg)

  "When minibuffer is completing a file name delete up to parent
folder, otherwise delete a word"
  (interactive "p")
  (if minibuffer-completing-file-name
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
      (backward-kill-word arg)))

(use-package vundo)

(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ([remap Info-search] . consult-info)

         ;; C-x bindings in `ctl-x-map'
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer

         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop

         ;; M-g bindings in `goto-map'
         ;("M-g m" . consult-mark)
         ;("M-g i" . consult-imenu)
         ("M-g g" . consult-goto-line)             ;; orig. goto-line

         ;; M-s bindings in `search-map'
         ;("M-s g" . consult-git-grep)
         ("M-s f" . consult-find)                  ;; Alternative: consult-fd
         ("M-s r" . consult-ripgrep)
         ("M-s u" . consult-focus-lines))

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

)

(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'prog-mode-hook 'abbrev-mode)

;(define-abbrev global-abbrev-table "" "")

(use-package hydra
  :ensure t)

(use-package major-mode-hydra
  :after hydra)

(pretty-hydra-define hydra-personal-files
  (:hint nil :color teal :quit-key "q")

  ("Agenda"
   (("t" (find-file "~/pu/org/todos.org") "Tareas")
    ("s" (find-file "~/pu/org/periodic.org") "Periodicos")
    ("a" (find-file "~/pu/org/aniversarios.org") "Aniversarios")
    ("p" (find-file "~/pu/org/plans.org") "Planes"))

   "Personal"
   (("r" (find-file "~/pu/org/rutina.org") "Rutina")
    ("f" (find-file "~/pu/org/1.2.1_Personal_Rutina_Finanzas.org") "Personal y finanzas"))))

(global-set-key (kbd "<f1>") 'hydra-personal-files/body)

(pretty-hydra-define hydra-OrgRoam
  (:color amaranth :quit-key "q")

  ("Org Roam"
   (("f" org-roam-node-find "Find node")
    ("c" org-roam-capture "Capture node")
    ("t" org-roam-buffer-toggle "Toggle buffer node")
    ("u" org-roam-ui-open "Open Roam UI")
    ("d" org-roam-dailies-capture-date "Capture date node")
    ("i" org-roam-node-insert "Insert node"))

  "Consult + Roam"
   (("l" consult-org-roam-foward-links "Fowardlinks")
    ("b" consult-org-roam-backlinks "Backlinks")
    ("s" consult-org-roam-search "Search in nodes"))))

(global-set-key (kbd "<f4>") 'hydra-OrgRoam/body)

(pretty-hydra-define hydra-toggle
  (:color amaranth :quit-key "q")

  ("Basic"
   (("n" display-line-numbers-mode "Line Numbers" :toggle t)
    ("r" rainbow-mode "Rainbow Mode" :toggle t)
    ("o" olivetti-mode "Olivetti Mode" :toggle t))

   "Highlight"
   (("l" hl-line-mode "Hl-Line" :toggle t)
    ("t" hl-todo-mode "Hl-TODO" :toggle t))))

(global-set-key (kbd "<f2>") 'hydra-toggle/body)

(pretty-hydra-define hydra-index
  (:hint nil :color teal :quit-key "q")

  ("Notas"
   (("i" (find-file "~/pu/org/1.0_Index_Index.org") "Index Index")
    ("e" (find-file "~/pu/org/1.1_Estudio_Index.org") "Estudio Index")
    ("p" (find-file "~/pu/org/1.2_Personal_Index.org") "Personal Index")
    ("f" (find-file "~/pu/org/1.3_Craft_Index.org") "Craft Index")
    ("t" (find-file "~/pu/org/1.4_Trabajo_Index.org") "Trabajo Index")
    ("b" (find-file "~/pu/org/1.5_Baile_Index.org") "Baile Index"))

   "Libros"
   (("z" (find-file "~/pu/org/2.0_Zaralia_Index.org") "Zaralia Index")
    ("m" (find-file "~/pu/org/2.0_Mindbreak_Index.org") "Mindbreak Index")
    ("k" (find-file "~/pu/org/2.0_Kurai_Sekai_Index.org") "Kurai Sekai Index")
    ("c" (find-file "~/pu/org/2.0_Crazy_Mythos_Index.org") "Crazy Mythos Index"))))

(global-set-key (kbd "<f3>") 'hydra-index/body)

;; (defhydra hydra-personal (:color blue)
;;   "Hydra Personal"
;;   ("r" (find-file "~/pu/org/rutina.org") "Rutina" :color red)
;;   ("f" (find-file "~/pu/org/1.2.1_Finanzas_Personales.org") "Finanzas")
;;   ("m" (find-file "~/pu/org/1.2.1_Menu_personal.org") "Menu Personal"))

;; (global-set-key (kbd "<f1>") 'hydra-personal/body)

;; (defhydra hydra-agenda (:color blue)
;;   "Hydra Personal"
;;   ("f" (find-file "~/pu/org/todos.org") "Tareas")
;;   ("r" (find-file "~/pu/org/periodic.org") "Periodicos")
;;   ("m" (find-file "~/pu/org/plans.org") "Planes"))

;; (global-set-key (kbd "<f2>") 'hydra-agenda/body)

;; SUPER HYDRAS

;; (defhydra hydra-directory (:color blue)
;;   "Directory Hydra"
;;   ("s" (find-file "~/.scripts/") "Scripts")
;;   ("c" (find-file "~/dotfiles/.config/") "Config")
;;   ("e" (find-file "~/dotfiles/.emacs.d/") "Emacs.d"))

;; (global-set-key (kbd "C-c 2") 'hydra-directory/body)

;; (defhydra hydra-zoom (:color red)
;;   "Hydra Zoom"
;;   ("-" text-scale-decrease "Out")
;;   ("+" text-scale-increase "In"))

;; (global-set-key (kbd "C-c 3") 'hydra-zoom/body)

;; (defun with-alltheicon (icon str &optional height v-adjust face)
;;   "Display an icon from all-the-icon."
;;   (s-concat (all-the-icons-alltheicon icon :v-adjust (or v-adjust 0) :height (or height 1) :face face) " " str))

;; (defun with-faicon (icon str &optional height v-adjust face)
;;   "Display an icon from Font Awesome icon."
;;   (s-concat (all-the-icons-faicon icon :v-adjust (or v-adjust 0) :height (or height 1) :face face) " " str))

;; (defun with-fileicon (icon str &optional height v-adjust face)
;;   "Display an icon from the Atom File Icons package."
;;   (s-concat (all-the-icons-fileicon icon :v-adjust (or v-adjust 0) :height (or height 1) :face face) " " str))

;; (defun with-octicon (icon str &optional height v-adjust face)
;;   "Display an icon from the GitHub Octicons."
;;   (s-concat (all-the-icons-octicon icon :v-adjust (or v-adjust 0) :height (or height 1) :face face) " " str))

;; (pretty-hydra-define hydra-personal-files
;;   (:hint nil :color teal :quit-key "q" :title (with-faicon "book" "Open org Agenda files" 1 -0.05))

;;   ("Agenda"
;;    (("t" (find-file "~/pu/org/todos.org") "Tareas")
;;     ("s" (find-file "~/pu/org/periodic.org") "Periodicos")
;;     ("p" (find-file "~/pu/org/plans.org") "Planes"))

;;    "Personal"
;;    (("r" (find-file "~/pu/org/rutina.org") "Rutina")
;;     ("f" (find-file "~/pu/org/1.2.1_Finanzas_Personales.org") "Finanzas")
;;     ("m" (find-file "~/pu/org/1.2.1_Menu_personal.org") "Menu personal"))))

;; (global-set-key (kbd "<f2>") 'hydra-personal-files/body)

;; ;; (pretty-hydra-define hydra-launcher
;; ;;   (:hint nil :color teal :quit-key "q" :title (with-octicon "rocket" "Hydra Launcher" 1 -0.05))
;; ;;   ("Launch"

;; ;;    (("h" man "man")
;; ;;  ("j" (browse-url "https://jpacheco.xyz") "Jpacheco")
;; ;;  ("w" (browse-url "http://www.emacswiki.org/") "emacswiki")
;; ;;  ("g" (browse-url "http://www.google.com") "Google")
;; ;;  ("d" (browse-url "https://autoliv-mx.leading2lean.com/") "L2L")
;; ;;  ("s" shell "shell"))))

;; ;; (global-set-key (kbd "<f1>") 'hydra-launcher/body)

;; ;; (pretty-hydra-define hydra-yasnippet 
;; ;;   (:nit nil :color teal :quit-key "q" :title (with-octicon "code" "Yasnippet" 1 -0.05))

;; ;;   ("Yasnippet Menu"
;; ;;    (("i" yas-insert-snippet)
;; ;;  ("e" yas-visit-snippet-file)
;; ;;  ("m" yas-minor-mode)
;; ;;  ("n" yas-new-snippet))))

;; ;; (global-set-key (kbd "<f2>") 'hydra-yasnippet/body)

(use-package avy
  :ensure t)

(use-package corfu
  :ensure t
  ;; Optional customizations
  :custom
  (corfu-cycle t)                 ; Allows cycling through candidates
  (corfu-auto t)                  ; Enable auto completion
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.4)
  (corfu-popupinfo-delay '(0.5 . 0.5))
  (corfu-preview-current 'insert) ; insert previewed candidate
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)      ; Don't auto expand tempel snippets
  ;; Optionally use TAB for cycling, default is `corfu-complete'.
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ([tab]        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ([backtab]    . corfu-previous)
              ;("S-<return>" . corfu-insert)
              ("RET"        . corfu-insert))

  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode) ; Popup completion info
  :config
  (add-hook 'eshell-mode-hook
            (lambda () (setq-local corfu-quit-at-boundary t
                                   corfu-quit-no-match t
                                   corfu-auto nil)
              (corfu-mode))
            nil
            t))

;; Use Dabbrev with Corfu!
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode))

(use-package cape
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p /" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p h" . cape-history)
         ("C-c p f" . cape-file)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-elisp-symbol)
         ("C-c p e" . cape-elisp-block)
         ("C-c p a" . cape-abbrev)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)
         ("C-c p :" . cape-emoji)
         ("C-c p t" . cape-tex)
         ("C-c p _" . cape-tex)
         ("C-c p ^" . cape-tex)
         ("C-c p &" . cape-sgml)
         ("C-c p r" . cape-rfc1345))
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-elisp-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
)

;; (use-package ledger-mode
;;    :ensure t)

;; (add-to-list 'load-path "~/.emacs.d/config/ledger-mode")
;; (require 'ledger-mode)

;; (use-package flycheck-ledger
;;   :ensure t
;;   :after ledger-mode)

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1)
  :diminish
  :config
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha
        which-key-allow-imprecise-window-fit nil
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.8
        which-key-max-description-length 25
        which-key-allow-imprecise-window-fit nil
        which-key-separator " > " ))

(setq diary-file "~/pu/org/diary")

(setq calendar-view-diary-initially-flag t
      diary-number-of-entries 7
      diary-display-function #'diary-fancy-display)
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)

(setq org-agenda-include-diary t)

(setq-default abbrev-mode 1)

(use-package yasnippet
  :ensure t
  :defer 2
  :config
  :init
  (yas-global-mode 1))
(add-hook 'emacs-startup-hook (lambda () (yas-load-directory "~/.emacs.d/snippets")))
(yas-reload-all)

(use-package consult-yasnippet)

(setq ispell-dictionary "es")
(setq ispell-personal-dictionary "~/.emacs.d/var/dictionary.org")

(use-package no-littering)

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package solaire-mode)

(setq solaire-mode t)
(solaire-global-mode +1)

;; (use-package markdown-mode
;;   :ensure t
;;   :mode ("README\\.md\\'" . gfm-mode)
;;   :init (setq markdown-command "multimarkdown")
;;          ("C-c C-e" . markdown-do))

(use-package highlight-indent-guides
  :config
    (setq highlight-indent-guides-method 'character)
    (setq highlight-indent-guides-auto-enabled nil)

    (set-face-background 'highlight-indent-guides-odd-face "darkgray")
    (set-face-background 'highlight-indent-guides-even-face "dimgray")
    (set-face-foreground 'highlight-indent-guides-character-face "#458588")
    :init (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package all-the-icons
  :ensure t
  :if(display-graphic-p))

(use-package nerd-icons
  :ensure t)

(use-package all-the-icons-completion
  :ensure t
  ;(:host github :branch "master" :repo "MintSoup/all-the-icons-completion")
  :config
  (all-the-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))

 (use-package all-the-icons-dired
   :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

;; (use-package nerd-icons-dired
;;   :hook
;;   (dired-mode . nerd-icons-dired-mode))

;; (setq nerd-icons-dired-mode t)

(use-package rainbow-mode)

;; (add-hook 'text-mode-hook (lambda () (rainbow-mode t)))
;; (add-hook 'prog-mode-hook (lambda () (rainbow-mode t)))

(add-hook 'text-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)

(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode . rainbow-delimiters-mode)
         (clojure-mode . rainbow-delimiters-mode)))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annonators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package olivetti)

(setq olivetti-body-width 100)

(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :init (global-flycheck-mode))

(use-package hl-todo
  :ensure t
  :hook ((org-mode . hl-todo-mode)
         (prog-mode . hl-todo-mode)))

(setq hl-todo-highlight-punctuation ":")
(setq hl-todo-keyword-faces
      '(("TODO"       . "#FF0000")
        ("DONE"       . "#00ff00")
        ("CANCELLED"  . "#696969")
        ("NOTE"       . "#ffd700")
        ("REVIEW"     . "#A020F0")
        ("PERIODIC"   . "#FF4500")
        ("PLAN"       . "#1E90FF")))

;; Enable in org-mode hl-line-mode
(add-hook 'org-mode-hook #'(lambda () (interactive) (hl-line-mode 1)))

;; (use-package fireplace
;;   :ensure t
;;   :config)

;; (use-package org-drill
;;   :config (progn
;;             (add-to-list 'org-modules 'org-drill)
;;             (setq org-drill-add-random-noise-to-intervals-p t)
;;             (setq org-drill-hint-separator "||")
;;             (setq org-drill-left-cloze-delimiter "<[")
;;             (setq org-drill-right-cloze-delimiter "]>")
;;             (setq org-drill-learn-fraction 0.25)
;;             (setq org-drill-use-visible-cloze-face-p t) ;;cloze-deleted text show special font
;;             (setq org-drill-hide-item-headings-p t) ;; item headings made invisible while each item is being tested
;;             (setq org-drill-maximum-items-per-session 40) ;; number of review items
;;              ;(setq org-drill-save-buffers-after-drill-sessions-p nil) ;; prompted to save all unsaved buffers at the end of a drill session
;;             (setq org-drill-maximum-duration 10) ;; minutes
;;             (setq org-drill-overdue-interval-factor 1.1) ;; cannot be less than 1.0
;;             (setq org-drill-days-before-old 7) ;; inter-repetition interval of 10 days or less
;;             (setq org-drill-adjust-intervals-for-early-and-late-repetitions-p t)
;;             (setq org-drill-learn-fraction 0.45)   ; change the value as desired
;;             (setq org-drill-directory "/media/tomb/org/drill")))

;; (use-package emms
;;     :commands emms
;;     :bind (("C-c m n" . emms-next)
;;            ("C-c m p" . emms-previous)
;;            ("C-c m b" . emms-smart-browse)
;;            ("C-c m l" . emms-playlist-mode-go)
;;            ("C-c m SPC" . emms-pause)
;;            ("C-c m a" . emms-add-directory-tree)
;;            ("C-c m s s" . emms-browser-search-by-names)
;;            ("C-c m u" . emms-player-mpd-update-all-reset-cache))
;;     :config
;;     (require 'emms-setup)
;;     (require 'emms-player-mpd)
;;     (emms-standard)
;;     (emms-default-players)
;;     (setq emms-mode-line-format "♫ %s ")
;;     (setq emms-player-list '(emms-player-mpd))
;;     (setq emms-player-mpd-server-name "localhost")
;;     (setq emms-player-mpd-server-port "6600"))

;; (use-package page-break-lines
;;   :ensure t)

;; (setq page-break-lines-mode t)
