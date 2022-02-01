;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
    '(
       prettier
       csv
       syntax-checking
       (lsp
         :variables lsp-ui-doc-position 'bottom)
       (vue :variables vue-backend 'lsp)
       (node :variables node-add-modules-path t)
       yaml
       treemacs
       sql
       selectric
       graphviz
       dhall
       pandoc
       (dap
         )
       (mu4e :variables
         mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu/mu4e"
         mu4e-update-interval 300
         mu4e-get-mail-command  "mbsync -a"
         mu4e-maildir           "~/.mail"
         mu4e-drafts-folder     "/Drafts"
         mu4e-refile-folder     "/Archive"
         mu4e-sent-folder       "/Sent Items"
         mu4e-change-filenames-when-moving t
         mu4e-trash-folder      "/Deleted Items"
         mu4e-maildir-shortcuts
         '( ("/Inbox" . ?i)
            ("/Archive" . ?a)
            ("/Drafts" . ?d)
            ("/Deleted Items" . ?t)
            ("/Sent Items" . ?s)))
       emoji
       html
       (typescript :variables
         typescript-backend 'lsp)
       (purescript :variables
         purescript-backend 'lsp)
       search-engine
       (unicode-fonts :variables unicode-fonts-force-multi-color-on-mac t)
       import-js
       (javascript :variables
           javascript-repl `skewer
           javascript-import-tool 'import-js
           javascript-fmt-tool 'prettier
           javascript-fmt-on-save t
           javascript-backend 'tern
           javascript-lsp-linter nil)
       tern
       (java :variables java-backend 'lsp)
       csharp
       epub
       fsharp
       docker
       clojure
       games
       racket
       helm
       auto-completion
       evil-commentary
       emacs-lisp
       git
       markdown
       (org :variables
            org-enable-reveal-js-support t
            org-enable-org-journal-support t
            org-enable-roam-support t)
       ;; org-roam
       ;; themes-megapack
       dash
       colors
       ;; (colors :variables
       ;;   colors-enable-nyan-cat-progress-bar (display-graphic-p))
       slack
       (shell :variables
         shell-default-height 30
         shell-default-position 'bottom
         shell-default-shell 'vterm)
       (vinegar :variables
         vinegar-dired-hide-details nil)
                                        ; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(pollen-mode company-pollen format-all)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-palenight
                        gruvbox-light-soft
                        gruvbox-dark-soft)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Mono"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
    dotspacemacs-line-numbers '(:disabled-for-modes
                                 org-mode
                                 text-mode
                                 :relative t)

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default git-magit-status-fullscreen t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (defun brad/org-mode-visual-fill ()
    (setq visual-fill-column-width 140
      visual-fill-column-center-text t)
    (visual-line-mode)
    (visual-fill-column-mode 1)
    (variable-pitch-mode 1)
    (message "hook ran for org mode 2"))

  (setq dap-auto-configure-features
    '(sessions locals tooltip expressions))

  (setq org-mime-export-options '(:section-numbers nil
                                   :with-author nil
                                   :with-toc nil))

  (setq
    message-send-mail-function 'smtpmail-send-it
    user-mail-address      "DeJong.Bradley@mayo.edu"
    user-full-name         "Bradley DeJong"
    smtpmail-smtp-server   "smtp.office365.com"
    smtpmail-smtp-service  587
    smtpmail-stream-type   'starttls
    smtpmail-debug-info    t)

  (add-hook 'org-mode-hook (lambda ()
                             (brad/org-mode-visual-fill)))
  (add-hook 'org-mode-hook 'variable-pitch-mode)
  ;; (use-package visual-fill-column
  ;;   :hook (org-mode . brad/org-mode-visual-fill))
  (use-package org-mime
    :ensure t

    :config (add-hook 'message-send-hook 'org-mime-confirm-when-no-multipart))

  (use-package dired
    :ensure nil
    :custom ((dired-listing-switches "-agho")))

  (require 'dap-chrome)
  (require 'dap-java)

  (use-package ox-report
    :ensure t)

  (defun brad-ramda-search (v)
    (interactive "sterm:")
    (if v
      (eww (concat "https://ramdajs.com/docs/#" v))
      (eww "https://ramdajs.com/docs/")))

  ;; (setq-default dotspacemacs-configuration-layers
  ;;   '((javascript :variables javascript-repl `nodejs)))

  (add-to-list 'exec-path "/Users/m161475/.npm-global/bin")
  (add-to-list 'exec-path "/Library/TeX/texbin")
  (setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))

  (add-hook 'purescript-mode-hook 'format-all-mode)

  (set-face-attribute 'fixed-pitch nil :font "Fira Mono" :height 120)
  (set-face-attribute 'variable-pitch nil :font "Charter" :height 130)
  (set-face-attribute 'variable-pitch nil :font "Garamond" :height 140)

  (with-eval-after-load 'org
    (dolist (face '((org-level-1 . 1.2)
                     (org-level-2 . 1.1)
                     (org-level-3 . 1.1)
                     (org-level-4 . 1.1)
                     (org-level-5 . 1.1)
                     (org-level-6 . 1.1)
                     (org-level-7 . 1.1)
                     (org-level-8 . 1.1)))
      (set-face-attribute (car face) nil :font "Cooper Hewitt" :weight 'regular :height (cdr face)))

    (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-link nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-verbatim nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
    ;; (set-face-attribute 'org-indent nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-ellipsis nil :inherit 'variable-pitch)

    (set-face-attribute 'org-footnote nil :inherit 'fixed-pitch)
    (setq org-ellipsis " ⤵"
      org-hide-emphasis-markers nil)
    )

  ;; (use-package prettier-js
  ;;   :ensure t
  ;;   :config
  ;;   (add-hook 'js2-mode-hook 'prettier-js-mode)
  ;;   (add-hook 'web-mode-hook 'prettier-js-mode)
  ;;   ;;(add-hook 'vue-mode-hook 'prettier-js-mode)
  ;;   (add-hook 'scss-mode-hook 'prettier-js-mode)
  ;;   (add-hook 'typescript-mode-hook 'prettier-js-mode))

  ;; (linum-relative-global-mode)

  (setq projectile-use-git-grep t)

  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))

  (use-package ox-gfm
    :after org
    :ensure t)

  (setq org-directory "~/org")
  (setq org-agenda-skip-deadline-prewarning-if-scheduled t)
  (setq org-default-notes-file (concat org-directory "/inbox.org"))
  (unless (string-match-p "\\.gpg" org-agenda-file-regexp)
    (setq org-agenda-file-regexp
      (replace-regexp-in-string "\\\\\\.org" "\\\\.org\\\\(\\\\.gpg\\\\)?"
        org-agenda-file-regexp)))
  (setq org-agenda-files '("~/org"))
  (setq org-agenda-files '("~/org/inbox.org"
                            "~/org/projects.org"
                            "~/org/tickler.org"
                            "~/org/journal.org.gpg"))

  (defun org-journal-find-location ()
    ;; Open today's journal, but specify a non-nil prefix argument in order to
    ;; inhibit inserting the heading; org-capture will insert the heading.
    (org-journal-new-entry t)
    ;; Position point on the journal's top-level heading so that org-capture
    ;; will add the new entry as a child entry.
    (goto-char (point-min)))

  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                  (file+headline "~/org/inbox.org" "Tasks")
                                  "* TODO %i%?")
                                ("i" "Information/article to file" entry
                                    (file+headline "~/org/inbox.org" "Articles and references")
                                    "* %i%?")
                                 ("w" "Sprint task" entry
                                   (file+headline "~/org/journal.org.gpg" "Sprint work")
                                   "* %i%? :@work:")
                                 ("i" "Interruption" entry (function org-journal-find-location)
                                  "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?" :clock-in t :clock-resume t)
                                 ("j" "Journal entry" entry (function org-journal-find-location)
                                  "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")
                                 ("e" "Event" entry
                                   (file+headline "~/org/journal.org.gpg" "Event")
                                   "** %? \n %^T \n")
                                 ("T" "Tickler" entry
                                   (file+headline "~/org/tickler.org" "Tickler")
                                   "* %i%? \n %U")))
  (setq org-refile-targets '(("~/org/projects.org" :maxlevel . 3)
                              ("~/org/someday.org" :level . 1)
                              ("~/org/tickler.org" :maxlevel . 2)))

  (setq org-agenda-text-search-extra-files (directory-files-recursively "~/org/" "\.org$"))

  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  (setq org-agenda-clockreport-parameter-plist
        '(:link t :maxlevel 6 :fileskip0 t :compact t :narrow 60 :score0))

  (setq org-agenda-custom-commands
        '(("o" "At work, next actions" tags-todo "@work"
           ((org-agenda-overriding-header "Work")
            (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
          ("j" "At home, next actions" tags-todo "@home"
           ((org-agenda-overriding-header "Home")
            (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
          ("h" "Home Spike" ((agenda ""
            ((org-agenda-skip-function '(my/org-agenda-skip-tag "@home" 't))))
            (tags-todo "@home"))
            ((org-agenda-compact-blocks nil)))
          ("s" "Spike" ((agenda ""
            ((org-agenda-skip-function '(my/org-agenda-skip-tag "@work" 't))))
            (tags-todo "@work"))
            ((org-agenda-compact-blocks nil)))))

          (defun my/org-agenda-skip-tag (tag &optional others)
  "Skip all entries that correspond to TAG.

If OTHERS is true, skip all entries that do not correspond to TAG."
  (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
        (current-headline (or (and (org-at-heading-p)
                                   (point))
                              (save-excursion (org-back-to-heading)))))
    (if others
        (if (not (member tag (org-get-tags-at current-headline)))
            next-headline
          nil)
      (if (member tag (org-get-tags-at current-headline))
          next-headline
        nil))))

  (defun org-current-is-todo ()
    (string= "TODO" (org-get-todo-state)))

  (defun current-is-work ()
    (member "@work" (org-get-tags)))

  (defun my-org-agenda-skip-all-siblings-but-first ()
    "Skip all but the first non-done entry."
    (let (should-skip-entry)
      (unless (org-current-is-todo)
        (setq should-skip-entry t))
      (save-excursion
        (while (and (not should-skip-entry) (org-goto-sibling t))
          (when (org-current-is-todo)
            (setq should-skip-entry t))))
      (when should-skip-entry
        (or (outline-next-heading)
            (goto-char (point-max))))))
  (defun only-work-tags ()
    "Skip all but the first non-done entry."
    (let (should-skip-entry)
      (unless (current-is-work)
        (setq should-skip-entry t))
      (save-excursion
        (while (and (not should-skip-entry) (org-goto-sibling t))
          (when (current-is-work)
            (setq should-skip-entry t))))
      (when should-skip-entry
        (or (outline-next-heading)
          (goto-char (point-max))))))

  (evil-leader/set-key
    "q q" 'spacemacs/frame-killer)
  ;;(add-hook 'auto-save-hook 'org-save-all-org-buffers)

  (add-to-list 'display-buffer-alist
    (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

  (defun my-org-sync ()
    (async-shell-command "~/scripts/sync-org.sh"))

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

  (setq epg-gpg-program "usr/local/bin/gpg")
  (require 'epa-file)
  (epa-file-enable)
  (setq epa-pinentry-mode 'loopback)

  ;;(add-hook 'org-mode-hook
    ;;(lambda ()
      ;;(add-hook 'after-save-hook 'my-org-sync nil 'make-it-local)))

  (setq org-roam-directory (file-truename "~/org/roam"))
  (setq org-roam-link-title-format "R:%s")
  (setq org-roam-encrypt-files t)
  ;;(setq org-roam-completion-system 'helm)
  (add-hook 'after-init-hook 'org-roam-mode)

  (setq org-journal-dir "~/org/journal")
  (setq org-journal-file-type 'weekly)
  (setq org-journal-encrypt-journal t)
  (setq org-journal-enable-agenda-integration t))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (edit-indirect ssass-mode csv-mode eglot flymake engine-mode command-log-mode jsonrpc company-pollen pollen-mode psci purescript-mode psc-ide dockerfile-mode docker tablist docker-tramp clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a racket-mode faceup ox-gfm fsharp-mode company-quickhelp prettier-js typit mmt sudoku pacmacs 2048-game ox-reveal yaml-mode pandoc-mode ox-pandoc graphviz-dot-mode selectric-mode sql-indent emoji-cheat-sheet-plus company-emoji omnisharp csharp-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data xterm-color shell-pop multi-term flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip eshell-z eshell-prompt-extras esh-help auto-dictionary editorconfig tide typescript-mode flycheck web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slack emojify circe oauth2 websocket ht seti-theme reverse-theme rebecca-theme rainbow-mode rainbow-identifiers railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme smeargle orgit org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit transient git-commit with-editor evil-commentary company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width ultra-condensed :foundry "nil" :family "Fira Mono")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#525252")
 '(golden-ratio-mode nil)
 '(helm-completion-style 'emacs)
  '(hl-todo-keyword-faces
     '(("TODO" . "#dc752f")
        ("NEXT" . "#dc752f")
        ("THEM" . "#2d9574")
        ("PROG" . "#4f97d7")
        ("OKAY" . "#4f97d7")
        ("DONT" . "#f2241f")
        ("FAIL" . "#f2241f")
        ("DONE" . "#86dc2f")
        ("NOTE" . "#b1951d")
        ("KLUDGE" . "#b1951d")
        ("HACK" . "#b1951d")
        ("TEMP" . "#b1951d")
        ("FIXME" . "#dc752f")
        ("XXX+" . "#dc752f")
        ("\\?\\?\\?+" . "#dc752f")))
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#80A0C2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#A2BF8A"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#3f3f3f"))
 '(objed-cursor-color "#C16069")
  '(org-agenda-files
     '("/Users/m161475/org/inbox.org" "/Users/m161475/org/projects.org" "/Users/m161475/org/tickler.org" "/Users/m161475/org/journal.org.gpg" "/Users/m161475/org/journal/20220110.gpg"))
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
  '(package-selected-packages
     '(ox-report true helm-dash dash-docs dash-at-point edit-indirect ssass-mode csv-mode eglot flymake engine-mode command-log-mode jsonrpc company-pollen pollen-mode psci purescript-mode psc-ide dockerfile-mode docker tablist docker-tramp clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a racket-mode faceup ox-gfm fsharp-mode company-quickhelp prettier-js typit mmt sudoku pacmacs 2048-game ox-reveal yaml-mode pandoc-mode ox-pandoc graphviz-dot-mode selectric-mode sql-indent emoji-cheat-sheet-plus company-emoji omnisharp csharp-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data xterm-color shell-pop multi-term flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip eshell-z eshell-prompt-extras esh-help auto-dictionary editorconfig tide typescript-mode flycheck web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slack emojify circe oauth2 websocket ht seti-theme reverse-theme rebecca-theme rainbow-mode rainbow-identifiers railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit transient git-commit with-editor evil-commentary company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
  '(rustic-ansi-faces
     ["#323334" "#C16069" "#A2BF8A" "#ECCC87" "#80A0C2" "#B58DAE" "#86C0D1" "#eceff4"])
 '(treemacs-follow-mode t)
 '(vc-annotate-background "#323334")
  '(vc-annotate-color-map
     (list
       (cons 20 "#A2BF8A")
       (cons 40 "#bac389")
       (cons 60 "#d3c788")
       (cons 80 "#ECCC87")
       (cons 100 "#e3b57e")
       (cons 120 "#da9e75")
       (cons 140 "#D2876D")
       (cons 160 "#c88982")
       (cons 180 "#be8b98")
       (cons 200 "#B58DAE")
       (cons 220 "#b97e97")
       (cons 240 "#bd6f80")
       (cons 260 "#C16069")
       (cons 280 "#a0575e")
       (cons 300 "#804f54")
       (cons 320 "#5f4749")
       (cons 340 "#525252")
       (cons 360 "#525252")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width ultra-condensed :foundry "nil" :family "Fira Mono")))))
)
