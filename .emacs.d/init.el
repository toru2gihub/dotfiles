(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "46325e20421d2b4423cc90db5a35e0a45bd78a6f3e26c52314b189af3cc00733" default))
 '(display-time-default-load-average nil)
 '(ispell-personal-dictionary "~/.emacs.d/dictionary.org")
 '(newsticker-url-list
   '(("Mental Outlaw" "https://invidious.protokolla.fi/feed/channel/UC7YOGHUfC1Tb6E4pudI9STA" nil nil nil)
     ("Distrotube" "https://invidious.protokolla.fi/feed/channel/UCVls1GmFKf6WlTraIb_IaJg" nil nil nil)
     ("Bugswriter" "https://invidious.protokolla.fi/feed/channel/UCngn7SVujlvskHRvRKc1cTw" nil nil nil)
     ("Protesilaos Stavrou" "https://invidious.protokolla.fi/feed/channel/UC0uTPqBCFIpZxlz_Lv1tk_g" nil nil nil)
     ("The Linux Experiment" "https://invidious.protokolla.fi/feed/channel/UC5UAwBUum7CPN5buc-_N1Fw" nil nil nil)
     ("The Linux Cast" "https://invidious.protokolla.fi/feed/channel/UCylGUf9BvQooEFjgdNudoQg" nil nil nil)
     ("Emacs Elements" "https://invidious.protokolla.fi/feed/channel/UCEqYjPJdmEcUVfHmQwJVM9A" nil nil nil)
     ("Wesleyda" "https://invidious.protokolla.fi/feed/channel/UCmRlQIXsEllAym3BUk1joEQ" nil nil nil)
     ("Pink Siddid" "https://invidious.protokolla.fi/feed/channel/UCfvq4mya8MinrTRVj3krGjA" nil nil nil)
     ("El Mundo de la Bachata" "https://invidious.protokolla.fi/channel/UCOnKllYl7PVV2NlsMPV9_VA" nil nil nil)
     ("Academy of Ideas" "https://invidious.protokolla.fi/feed/channel/UCiRiQGCHGjDLT9FQXFW0I3A" nil nil nil)
     ("Pursuit of Wonder" "https://invidious.protokolla.fi/feed/channel/UC-tLyAaPbRZiYrOJxAGB7dQ" nil nil nil)
     ("Mr Forged" "https://invidious.protokolla.fi/feed/channel/UCBLNoRJ6mB26gcAN65ysuaA" nil nil nil)
     ("Einzelganger" "https://invidious.protokolla.fi/feed/channel/UCybBViio_TH_uiFFDJuz5tg" nil nil nil)
     ("DrossRotzank" "https://invidious.protokolla.fi/feed/channel/UCNYW2vfGrUE6R5mIJYzkRyQ" nil nil nil)
     ("Agujeros de Guion" "https://invidious.protokolla.fi/feed/channel/UCffvdhj3nA0s2uN3NoWDQFA" nil nil nil)
     ("Boulder Punch" "https://invidious.protokolla.fi/feed/channel/UCUe2AK0iirPfXcDkYu5dWow" nil nil nil)
     ("El Bandicoot" "https://invidious.protokolla.fi/feed/channel/UCKZszfRSW2jI5MD1kAmIuUw" nil nil nil)
     ("Archlinux News" "https://archlinux.org/feeds/news/" nil nil nil)
     ("Suckless News" "https://suckless.org/atom.xml" nil nil nil)
     ("Emacs News" "https://sachachua.com/blog/category/emacs-news/feed" nil nil nil)))
 '(org-agenda-files '("~/pu/org/agenda.org"))
 '(org-safe-remote-resources
   '("\\`https://github\\.com/fniessen/org-html-themes/blob/master/org/theme-readtheorg\\.setup\\'"))
 '(package-selected-packages
   '(standard-themes rainbow-delimiters svg-lib lsp-treemacs eglot lsp-mode kind-icon yasnippet-capf nerd-icons-corfu corfu-doc doom-themes org-auto-tangle magit embark-consult cdlatex auctex calfw-org solaire-mode ef-themes vundo evil-goggles org-roam-ui major-mode-hydra consult-org-roam avy consult-yasnippet org-download org-yaap nix-mode all-the-icons-dired org-roam highlight-indent-guides corfu cape modus-themes org-bullets dashboard unicode-fonts page-break-lines auto-complete no-littering olivetti rainbow-mode))
 '(simple-modeline-segments
   '((simple-modeline-segment-modified simple-modeline-segment-buffer-name simple-modeline-segment-position)
     (simple-modeline-segment-vc simple-modeline-segment-misc-info simple-modeline-segment-process simple-modeline-segment-major-mode)))
 '(telega-server-libs-prefix "/nix/store")
 '(toc-org-max-depth 3 t)
 '(warning-suppress-types '((use-package)))
 '(yas-snippet-dirs '("/home/toru/.emacs.d/snippets/")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed))))
 '(org-checkbox ((t :box (:line-width 2 :color "gray" :style released-button))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.0))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.0)))))
