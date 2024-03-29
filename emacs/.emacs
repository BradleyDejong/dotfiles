(setq gc-cons-threshold (* 50 1000 1000))

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

; Make sure use-package is installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose t)

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package no-littering
  :config
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(set-face-attribute 'default nil :font "Fira Mono" :height 120)

(use-package doom-themes)
(use-package modus-themes
  :config
  (setq modus-themes-mode-line '(accented borderless padded))
  (setq modus-themes-region '(bg-only))
  (setq modus-themes-completions '(opinionated))
  (setq modus-themes-bold-constructs t)
  (setq modus-themes-italic-constructs t)
  (setq modus-themes-paren-match '(bold intense underline))
  (setq modus-themes-syntax '(alt-syntax))
  (setq modus-themes-org-blocks 'tinted-background)
  (setq modus-themes-headings
        '(( 1 . (rainbow 1.4))
          ( 2 . (rainbow 1.25))
          ( 3 . (rainbow 1.1))
          ( 4 . (rainbow 1))))
  (load-theme 'modus-vivendi t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 12)))

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                vterm-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package evil
  :after
  undo-tree
  :init
  (setq evil-undo-system 'undo-tree)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
                                        ;  :hook (evil-mode . partiallypractical/evil-hook)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(defun partiallypractical/org-mode-setup ()
  (org-indent-mode nil)
  (variable-pitch-mode 0)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)

  (add-to-list 'org-latex-classes '("simplepdf" "\\documentclass{article}
    \\usepackage[left=1in,top=1in,right=1in,bottom=1.5in]{geometry}
    \\usepackage{palatino}
    \\usepackage{fancyhdr}
    \\usepackage{sectsty}
    \\usepackage{engord}
    \\usepackage{cite}
    \\usepackage{graphicx}
    \\usepackage{setspace}
    \\usepackage[compact]{titlesec}
    \\usepackage[center]{caption}
    \\usepackage{multirow}
    \\usepackage{ifthen}
    \\usepackage{longtable}
    \\usepackage{color}
    \\usepackage{amsmath}
    \\usepackage{listings}
    \\usepackage{pdfpages}
    \\usepackage{nomencl}	% For glossary
    \\usepackage{pdflscape}	% For landscape pictures and environment
    \\usepackage{verbatim} 	% For multiline comment environments
    \\usepackage[T1]{fontenc}
    \\usepackage[bitstream-charter]{mathdesign}
    \\usepackage[scaled=.9]{helvet}
    \\usepackage{courier} % tt
    \\usepackage[table]{xcolor}"
                                    ("\\section{%s}" . "\\section*{%s}")
                                    ("\\subsection{%s}" . "\\subsection*{%s}")
                                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                    ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'exec-path "/Library/TeX/texbin"))

(use-package org
  :hook (org-mode . partiallypractical/org-mode-setup)
  :config
  (setq org-ellipsis "  <more>"
        org-hide-emphasis-markers nil)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)))

  (require 'org-tempo))

(use-package htmlize
  :after org)

(use-package org-present
  :after org
  :config
  (autoload 'org-present "org-present" nil t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "◉" "○" "◉" "○")))

(defun partiallypractical/org-babel-tangle-config ()
    (when (string-equal (buffer-file-name)
                        (expand-file-name "~/dotfiles/emacs/emacs.org"))
      (let ((org-confirm-babel-evaluate nil))
        (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'partiallypractical/org-babel-tangle-config)))

(use-package org-roam
  :config
  (setq org-roam-directory (file-truename "~/org/roam"))
  (setq org-roam-link-title-format "R:%s")
  (setq org-roam-encrypt-files t)
  (setq org-download-screenshot-method "screencapture -i %s")
  ;;(setq org-roam-completion-system 'helm)
  (add-hook 'after-init-hook 'org-roam-mode))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 ("C-w" . evil-delete-backward-word)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  :custom
  ((projectile-completion-system 'ivy)
   (setq projectile-per-project-compilation-buffer t))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (defun partiallypractical/projectile-run-project (&optional prompt)
    (interactive "P")
    (let ((compilation-read-command
           (or (not (projectile-run-command (projectile-compilation-dir)))
               prompt)))
      (projectile-run-project prompt))))

(use-package counsel-projectile
  :after projectile)

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(use-package helpful
  :ensure t
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package general
  :defer 0
  :config
  (general-evil-setup t)

  (general-create-definer partiallypractical/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (partiallypractical/leader-keys
    "-" '(dired-jump :which-key "dired")
    "b" '(:ignore t :which-key "buffers")
    "bb" '(counsel-ibuffer :which-key "counsel ibuffer")
    "bd" '(kill-buffer :which-key "delete buffer")
    "bk" '(kill-buffer-and-window :which-key "kill buffer and window")
    "f" '(:ignore t :which-key "files")
    "ff" '(counsel-recentf :which-key "recent files")
    "g" '(:ignore t :which-key "git")
    "gs" '(magit-status :which-key "git status")
    "l" '(:ignore t :which-key "lsp")
    "ld" '(lsp-find-definition :which-key "go to definition")
    "le" '(flycheck-next-error :which-key "next error")
    "li" '(lsp-find-implementation :which-key "go to implementation")
    "lr" '(lsp-find-references :which-key "find references")
    "o" '(:ignore t :which-key "org")
    "or" '(:ignore t :which-key "roam")
    "orf" '(org-roam-node-find :which-key "find")
    "ori" '(org-roam-node-insert :which-key "insert")
    "oo" '(org-roam-buffer-visit-thing :which-key "open")
    "p" '(:ignore t :which-key "projectile")
    ;"p" '(projectile-command-map :which-key "projectile")
    "pp" '(projectile-switch-project :which-key "switch project")
    "pf" '(projectile-find-file :which-key "file")
    "pg" '(counsel-projectile-rg :which-key "grep")
    "px" '(partiallypractical/projectile-run-project :which-key "execute")
    "pt" '(partiallypractical/projectile-terminal :which-key "vterm")
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package hydra
  :after general
  :config
  (defhydra hydra-text-scale (:timeout 4)
    "scale text"
    ("j" text-scale-increase "in")
    ("k" text-scale-decrease "out")
    ("f" nil "finished" :exit t))

  (partiallypractical/leader-keys
    "ts" '(hydra-text-scale/body :which-key "scale-text")))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho"))
  :config
  (when (string= system-type "darwin")
    (setq dired-use-ls-dired nil)))

(use-package dired-single
  :commands (dired dired-jump)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package dired-open
  :commands (dired dired-jump)
  :config
  (setq dired-open-extensions '(("png" . "feh")
                                ("mp4" . "vlc"))))

(use-package ripgrep
  :after projectile)

(use-package editorconfig
  :hook (prog-mode . editorconfig-mode)
  :config
  (editorconfig-mode 1))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred))

(use-package js2-mode
  :mode "\\.js\\'")

(use-package jest
  :after (js2-mode)
  :hook (js2-mode . jest-minor-mode))

(use-package dhall-mode
  :mode "\\.dhall\\'"
  :config
  (setq
   dhall-format-arguments (\` ("--ascii"))
   dhall-use-header-line nil))

(use-package web-mode
  :mode "\\.html\\'")

(use-package purescript-mode
  :mode "\\.purs\\'")

(use-package feature-mode
  :mode "\\.feature\\'")

(defun partiallypractical/lsp-mode-setup ()
  (setq display-line-numbers 'relative))

(use-package lsp-mode
  :after flycheck
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  :hook

  ((lsp-mode . partiallypractical/lsp-mode-setup)
   (js2-mode . lsp-deferred)
   (dhall-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-treemacs
  :after lsp-mode
  :config
  (lsp-treemacs-sync-mode 1))

(use-package flycheck
  :defer 0)

;(use-package company
  ;:after lsp-mode
  ;:hook (lsp-mode . company-mode)
  ;:bind
  ;(:map company-active-map
        ;("<tab>" . company-complete-selection))
  ;(:map lsp-mode-map
        ;("<tab>" . company-indent-or-complete-common))
  ;:custom
  ;(company-minimum-prefix-length 1)
  ;(company-idle-delay 0.0))

;(use-package company-box
  ;:hook (company-mode . company-box-mode))

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package term
  :defer 0
  :config
  (setq explicit-shell-file-name "zsh")
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%] *"))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

(use-package prettier-js
  :hook (js2-mode . prettier-js-mode))

(use-package docker
  :defer 0
  :config
  (partiallypractical/leader-keys
    "d" '(docker :which-key "docker")))

(use-package yasnippet
  :defer 0
  :init
  (yas-global-mode 1)
  :config
                                        ;(add-to-list 'yas-snippets-dirs (locate-user-emacs-file "snippets"))
  (define-key evil-insert-state-map (kbd "C-<tab>") 'yas-expand)

  (partiallypractical/leader-keys
    "TAB" 'yas-expand))

(defun partiallypractical/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'partiallypractical/display-startup-time)
(setq gc-cons-threshold (* 2 1000 1000))

(recentf-mode 1)

(setq display-buffer-base-action
      '((display-buffer-reuse-window
         display-buffer-reuse-mode-window
         display-buffer-same-window
         display-buffer-in-previous-window)
        . ((mode . (org-mode helpful-mode help-mode vterm-mode)))))

(defun partiallypractical/projectile-terminal (&optional arg)
  (interactive)
  (let* ((old-buffer (current-buffer))
         (project (projectile-acquire-root))
         (buffer (projectile-generate-process-name "vterm" arg project)))
    (let ((window (if (buffer-live-p (get-buffer buffer))
                      (display-buffer buffer '(display-buffer-in-side-window . ((side . bottom))))
                    (projectile-with-default-dir project
                      (vterm buffer))
                    (display-buffer old-buffer '(display-buffer-same-window . ()))
                    (display-buffer buffer '(display-buffer-in-side-window . ((side . bottom)))))))
      (select-window window))))
