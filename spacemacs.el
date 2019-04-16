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
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     python
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
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
   ;; dotspacemacs-check-for-update nil
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
   dotspacemacs-themes '(manoj-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
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
   dotspacemacs-line-numbers nil
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
(setq configuration-layer-elpa-archives
    '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
  )
(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/jianguo_sync/Nutstore/theNext.org")))
 '(package-selected-packages
   (quote
    (gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flyspell-correct-helm flyspell-correct flycheck magit magit-popup git-commit with-editor cython-mode auto-dictionary pythonic company-lsp lsp-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; 自动根据子项目的完成更改父项目的状态
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(defgroup org-gantt nil "Customization of org-gantt."
  :group 'org)

(defcustom org-gantt-default-hours-per-day 8
  "The default hours in a workday.
Use :hours-per-day to overwrite this value for individual gantt charts."
  :type '(integer)
  :group 'org-gantt)

(defcustom org-gantt-default-work-free-days '(0 6)
  "The default days on which no work is done.
Stored in a list of day-of-week numbers,
starting with sunday = 0, ending with saturday = 6.
Use :work-free-days to overwrite this value for individual gantt charts."
  :type '(repeat integer)
  :group 'org-gantt)

(defcustom org-gantt-default-weekend-style "{black}"
  "The default style for the weekend lines.
Use :weekend-style to overwrite this value for individual gantt charts."
  :type '(string)
  :group 'org-gantt)

(defcustom org-gantt-default-workday-style "{dashed}"
  "The default style for the workday lines.
Use :workday-style to overwrite this value for individual gantt charts."
  :type '(string)
  :group 'org-gantt)

(defcustom org-gantt-default-title-calendar "year, month=name, day"
  "The default style for the title calendar.
Use :title-calendar to overwrite this value for individual gantt charts."
  :type '(string)
  :group 'org-gantt)

(defcustom org-gantt-default-compressed-title-calendar "year, month"
  "The default style for the title calendar, if the chart is compressed.
Use :compressed-title-calendar to overwrite this value for individual gantt charts."
  :type '(string)
  :group 'org-gantt)

(defcustom org-gantt-default-show-progress nil
  "The default for showing a progress.
nil means progress is not shown.
always means progress is always shown (0, if no value exists).
if-exists means progress is only shown if a value exists."
  :type '(symbol)
  :options '(nil if-exists always)
  :group 'org-gantt)

(defcustom org-gantt-default-progress-source 'cookie-clocksum
  "The default source of the progress.
Determines how the progress is calculated.
clocksum means use clocksum values only.
cookie means use progress-cookies only
clocksum-cookie means prioritize clocksums,
but use progress cookie, if no clocksum exists.
cookie-clocksum means prioritize cookie,
but use clocksum value, if no progress cookie exists."
  :type '(symbol)
  :options '(clocksum cookie clocksum-cookie cookie-clocksum))

(defcustom org-gantt-default-incomplete-date-headlines 'inactive
  "The default treatment for headlines that have either deadline or schedule
\(also computed\), but not both.
'keep will place the headline normally, with a length of 0.
'inactive will place the headline, but distinguish it via inactive-style.
'ignore will not place the headline onto the chart."
  :type '(symbol)
  :options '(keep inactive ignore)
  :group 'org-gantt)

(defcustom org-gantt-default-no-date-headlines 'inactive
  "The default treatment for headlines that have neither deadline nor schedule.
'keep will place the headline at the first day, with a length of 0.
'inactive will place the headline, but distinguish it via
inactive-bar-style and inactive-group-style.
'ignore will not place the headline onto the chart."
  :type '(symbol)
  :options '(keep inactive ignore)
  :group 'org-gantt)

(defcustom org-gantt-default-inactive-bar-style "bar label font=\\color{black!50}"
  "The default styles for bars that are considered inactive by incomplete-date-headlines
or no-date-headlines."
  :type '(string)
  :group 'org-gantt)

(defcustom org-gantt-default-inactive-group-style "group label font=\\color{black!50}"
  "The default styles for groups that are considered inactive by incomplete-date-headlines
or no-date-headlines."
  :type '(string)
  :group 'org-gantt)

(defcustom org-gantt-default-tags-bar-style nil
  "An alist that associates tags to styles for bars in the form (tag . style)."
  :type '(alist :key-type string :value-type string)
  :group 'org-gantt)

(defcustom org-gantt-default-tags-group-style nil
  "An alist that associates tags to styles for groups in the form (tag . style)."
  :type '(alist :key-type string :value-type string)
  :group 'org-gantt)

(defcustom org-gantt-default-tag-style-effect 'subheadlines
  "The effect of tag styles.
If value is 'current, a tag style is only applied to headlines
with the appropriate tag.
If value is 'subheadlines, it applies to the headline and
all its subheadlines."
  :type '(symbol)
  :options '(subheadlines 'current)
  :group 'org-gantt)

(defcustom org-gantt-default-use-tags nil
  "A list of tags for which the bars/groups should be printed.
All headlines without those tags will not be printed.
nil means print all."
  :type '(repeat string)
  :group 'org-gantt)

(defcustom org-gantt-default-ignore-tags nil
  "A list of tags for which the bars/groups should not be printed.
All headlines with those tags will not be printed.
Can not be (sensibly) used in combination with org-gantt-default-use-tags.
nil means print all."
  :type '(repeat string)
  :group 'org-gantt)

(defcustom org-gantt-default-milestone-tags '("milestone")
  "A list of tags, for which a headline is printed as a milestone."
  :type '(repeat string)
  :group 'org-gantt)

(defcustom org-gantt-default-linked-to-property-keys '(:LINKED-TO)
  "A list of strings that are accepted as property keys for linked elements."
  :type '(repeat string)
  :group 'org-gantt)

(defcustom org-gantt-default-maxlevel nil
  "The default maximum levels used for org-gantt charts.
nil means the complete tree is used."
  :type '(choice integer (const nil))
  :group 'org-gantt)

(defcustom org-gantt-output-debug-dates nil
  "Decides whether to put out some extra information about the computed dates
as a latex comment after each gantt bar."
  :type '(boolean)
  :group 'org-gantt)

(defcustom org-gantt-default-hgrid nil
  "The option :hgrid decides whether hgrid lines are shown.
This is the default setting for :hgrid."
  :type '(boolean)
  :group 'org-gantt)

(defconst org-gantt-start-prop :startdate
  "What is used as the start property in the constructed property list.")

(defconst org-gantt-end-prop :enddate
  "What is used as the end property in the constructed property list.")

(defconst org-gantt-effort-prop :effort
  "What is used as the effort property in the constructed property list.")

(defconst org-gantt-clocksum-prop :clocksum
  "What is used as the effort property in the constructed property list.")

(defconst org-gantt-progress-prop :progress
  "What is used as the progress property in the constructed property list.")

(defconst org-gantt-stats-cookie-prop :stats-cookie
  "What is used as the statistics cooke, i.e. [X%], [X/Y]")

(defconst org-gantt-tags-prop :tags
  "What is used as the tags property in the constructed property list.")

(defconst org-gantt-parent-tags-prop :parent-tags
  "What is used as the property for propagated parent tags.")

(defconst org-gantt-id-prop :id
  "What is used as the the property for storing ids.")

(defconst org-gantt-blocker-prop :blocker
  "What is used as the property for the blocker property.")

(defconst org-gantt-trigger-prop :trigger
  "What is used as the property for the trigger property.")

(defconst org-gantt-linked-to-prop :linked-to
  "What is used as the property for the linked-to elements")

(defvar org-gant-hours-per-day-gv nil
  "Global variable for local hours-per-day.")

(defvar org-gantt-options nil
  "Global variable that keeps a plist of the current options.
Is filled with local or default options.")

(defvar *org-gantt-changed-in-propagation* nil
  "Global variable for checking if something was changed during propagation.")

(defvar *org-gantt-id-counter* 0
  "Global variable for creating ids.")

(defvar *org-gantt-link-hash* nil
  "Global variable for storing manually given links.
Is used to create the manual links between elements at the end.")

(defun org-gantt-hours-per-day ()
  "Get the hours per day."
  org-gantt-hours-per-day-gv)

(defun org-gantt-hours-per-day-time ()
  "Get hours per day as a time value."
  (seconds-to-time (* 3600 (org-gantt-hours-per-day))))

(defun org-gantt-chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
                                    (: (* (any " \t\n")) eos)))
                            ""
                            str))

(defun org-gantt-gethash (key table &optional dflt)
  "Works just as gethash, but works if hashtable is nil.
Look up KEY in TABLE and return its associated value.
If KEY is not found, or TABLE is nil, return DFLT which defaults to nil."
  (if table
      (gethash key table dflt)
    dflt))

(defun org-gantt-hashtable-equal (table1 table2)
  "Return true, iff table1 and table2 are hash tables with the same contents."
  (and (= (hash-table-count table1)
          (hash-table-count table2))
       (catch 'flag (maphash (lambda (x y)
                               (or (org-gantt-equal (gethash x table2) y)
                                   (throw 'flag nil)))
                             table1)
              (throw 'flag t))))

(defun org-gantt-equal (item1 item2)
  "Returns true, iff item1 is equal to item2, including hash tables"
  (if (and (hash-table-p item1) (hash-table-p item2))
      (org-gantt-hashtable-equal item1 item2)
    (equal item1 item2)))

(defun org-gantt-info-list-equal (il1 il2)
  "Returns true iff IL1 is equal to IL2, including hash tables."
  (or (and (not il1) (not il2))
      (and (org-gantt-equal (car il1) (car il2))
           (org-gantt-info-list-equal (cdr il1) (cdr il2)))))

(defun org-gantt-get-planning-time (element timestamp-type)
  "Get the time belonging to a first-order headline of the given ELEMENT.
TIMESTAMP-TYPE is either :scheduled or :deadline.
If it is :deadline, hours-per-day is added to it."
  (let* ((timestamp
          (org-element-map
              element '(planning headline)
            (lambda (subelement) (org-element-property timestamp-type subelement))
            nil t 'headline))
         (time (org-gantt-timestamp-to-time timestamp))
         (dt (decode-time time))
         (hours (nth 2 dt))
         (minutes (nth 1 dt)))
    (if (and (equal timestamp-type :deadline)
             (= 0 hours)
             (= 0 minutes))
        (time-add time (org-gantt-hours-per-day-time))
      time)))

(defun org-gantt-get-subheadlines (element)
  "Get all the headlines of ELEMENT."
  (org-element-map element 'headline (lambda (subelement) subelement)
                   nil nil 'headline))

(defun org-gantt-time-less-p (t1 t2)
  "Return non-nil, if T1 is before T2.
I.e. `time-less-p' working with nil.
Any time is less than nil."
  (and t1
       (or (not t2)
           (time-less-p t1 t2))))

(defun org-gantt-time-larger-p (t1 t2)
  "Return non-nil, if T1 is later than T2.
Works with nil.  Any time is lager than nil."
  (and t1
       (or (not t2)
           (time-less-p t2 t1))))

(defun org-gantt-subheadline-extreme (element comparator time-getter subheadline-getter)
  "Return smallest/largest timestamp of the subheadlines of ELEMENT.
Smallest or largest depends on COMPARATOR.
TIME-GETTER is the recursive function that needs to be called if
the subheadlines have no timestamp.
SUBHEADLINE-GETTER is the function that is used to get subheadlines."
  (and
   element
   (let ((subheadlines (funcall subheadline-getter element)))
     (funcall
      time-getter
      (car
       (sort
        subheadlines
        (lambda (hl1 hl2)
          (funcall comparator
                   (funcall time-getter hl1)
                   (funcall time-getter hl2)))))))))

(defun org-gantt-get-start-time (element)
  "Get the start time of ELEMENT.
This is either the :scheduled time, or the first start time of
ELEMENT's subelements."
  (or
   (org-gantt-get-planning-time element ':scheduled)
   (org-gantt-subheadline-extreme
    (cdr element)
    #'org-gantt-time-less-p
    #'org-gantt-get-start-time
    #'org-gantt-get-subheadlines)))

(defun org-gantt-get-end-time (element)
  "Get the end time of ELEMENT.
This is either the :deadline time, or the last end time of
ELEMENT's subelements."
  (or
   (org-gantt-get-planning-time element ':deadline)
   (org-gantt-subheadline-extreme
    (cdr element)
    #'org-gantt-time-larger-p
    #'org-gantt-get-end-time
    #'org-gantt-get-subheadlines)))

(defun org-gantt-subheadlines-effort (element effort-getter element-org-gantt-effort-prop)
  "Return the sum of the efforts of the subheadlines of ELEMENT.
EFFORT-GETTER is the recursive function that needs to be called if
the subheadlines have no effort.
ELEMENT-ORG-GANTT-EFFORT-PROP The property that stores the effort in the headline element."
  (and
   element
   (let ((subheadlines (org-gantt-get-subheadlines element))
         (time-sum (seconds-to-time 0)))
     (dolist (sh subheadlines (if (= 0 (apply '+ time-sum)) nil time-sum))
       (let ((subtime (funcall effort-getter sh element-org-gantt-effort-prop)))
         (when subtime
           (setq time-sum (time-add time-sum subtime))))))))


(defun org-gantt-get-effort (element element-org-gantt-effort-prop &optional use-subheadlines-effort)
  "Get the effort of the current ELEMENT.
If use-subheadlines-effort is non-nil and element has no effort,
use sum of the efforts of the subelements.
ELEMENT-ORG-GANTT-EFFORT-PROP is the property that stores the effort
in the headline element.
If USE-SUBHEADLINES-EFFORT is non-nil and element does not have a direct effort,
the combined effort of subheadlines is used."
  (let ((effort-time (org-gantt-effort-to-time (org-element-property element-org-gantt-effort-prop element))))
    (or effort-time
        (and use-subheadlines-effort
             (org-gantt-subheadlines-effort (cdr element) #'org-gantt-get-effort element-org-gantt-effort-prop)))))

(defun org-gantt-statistics-value (title)
  "Return the statistics value, if title contains it, else nil"
  (org-element-map (org-element-contents title) 'statistics-cookie
    (lambda (element) (org-element-property :value element))
    nil t t))

(defun org-gantt-get-flattened-properties (element property-key-list)
  "Return the properties in ELEMENT flattened into one list.
Return properties as defined by any key in PROPERTY-KEY-LIST."
                                        ;  (dbgmessage "PROP-KEY-LIST %s" property-key-list)
                                        ;  (dbgmessage "ELEMENT %s" (pp element))
  (let ((property-list nil))
    (dolist (key property-key-list property-list)
      (when (org-element-property key element)
        (setq property-list
              (append (split-string (org-element-property key element) "," t)
                      property-list))))))

(defun org-gantt-create-id ()
  "Create a unique id."
  (setq *org-gantt-id-counter*
        (+ 1 *org-gantt-id-counter*))
  (concat "uniqueid"
          (number-to-string *org-gantt-id-counter*)))

(defun org-gantt-create-gantt-info (element)
  "Create a gantt-info for ELEMENT.
A gantt-info is a plist containing :name org-gantt-start-prop org-gantt-end-prop org-gantt-effort-prop :subelements"
                                        ;  (dbgmessage "TITLEtype: %s" (type-of (cdr (org-element-property :title element))))
                                        ;  (dbgmessage "TITLE: %s" (car (org-element-contents (org-element-property :title element))))
  (let ((gantt-info-hash (make-hash-table)))
    (puthash
     :name (org-element-property :raw-value element)
     gantt-info-hash)
    (puthash :ordered (org-element-property :ORDERED element) gantt-info-hash)
    (puthash org-gantt-start-prop (org-gantt-get-start-time element) gantt-info-hash)
    (puthash org-gantt-end-prop (org-gantt-get-end-time element) gantt-info-hash)
    (puthash org-gantt-effort-prop (or (org-gantt-get-effort
                                        element :EFFORT)
                                       (and (org-gantt-is-in-tags
                                             (org-element-property :tags element)
                                             (plist-get org-gantt-options :milestone-tags))
                                            (seconds-to-time 0)))
             gantt-info-hash)
    (puthash org-gantt-stats-cookie-prop (org-gantt-statistics-value
                                          (org-element-property :title element))
             gantt-info-hash)
    (puthash org-gantt-clocksum-prop (org-gantt-effort-to-time (org-element-property :CLOCKSUM element) 24) gantt-info-hash) ;clocksum is computed automatically with 24 hours per day, therefore we use 24.
    (puthash org-gantt-tags-prop (org-element-property :tags element) gantt-info-hash)
    (puthash org-gantt-id-prop (or (org-element-property :ID element)
                                   (org-gantt-create-id))
             gantt-info-hash)
    (when (org-gantt-get-flattened-properties
           element (plist-get org-gantt-options
                              :linked-to-property-keys))
      (dbgmessage "FLATTENED: %s" (org-gantt-get-flattened-properties
                                element (plist-get org-gantt-options
                                                   :linked-to-property-keys))))
    (puthash org-gantt-linked-to-prop (org-gantt-get-flattened-properties
                                       element (plist-get org-gantt-options
                                                          :linked-to-property-keys))
             gantt-info-hash)
    (puthash org-gantt-trigger-prop (org-element-property :TRIGGER element) gantt-info-hash)
    (puthash org-gantt-blocker-prop (org-element-property :BLOCKER element) gantt-info-hash)
                                        ;        (org-gantt-get-effort element :CLOCKSUM)
    (puthash :subelements (org-gantt-crawl-headlines (cdr element)) gantt-info-hash)
    gantt-info-hash))

(defun org-gantt-crawl-headlines (data)
  "Crawl the parsed DATA and return a gantt-info-list from the headlines."
  (let ((gantt-info-list
         (org-element-map data 'headline #'org-gantt-create-gantt-info nil nil 'headline)))
    gantt-info-list))

(defun org-gantt-get-extreme-date-il (info-list time-getter time-comparer)
  "Get the first or last date in INFO-LIST.
TIME-GETTER is used to get the time in an info object.
TIME-COMPARER is used to compare times, i.e. determine first or last.
Returns the first element of the list `sort'ed according to TIME-COMPARER."
  (let ((reslist nil))
    (dolist (info info-list)
      (setq
       reslist
       (cons (funcall time-getter info)
             (cons
              (org-gantt-get-extreme-date-il
               (gethash :subelements info) time-getter time-comparer)
              reslist))))
    (car (sort reslist time-comparer))))

(defun org-gantt-timestamp-to-time (timestamp &optional use-end)
  "Convert a TIMESTAMP to an Emacs time.
If optional USE-END is non-nil use the ...-end values of the timestamp."
  (and timestamp
       (if use-end
           (encode-time 0
                        (or (org-element-property :minute-end timestamp) 0)
                        (or (org-element-property :hour-end timestamp) 0)
                        (org-element-property :day-end timestamp)
                        (org-element-property :month-end timestamp)
                        (org-element-property :year-end timestamp))
         (encode-time 0
                      (or (org-element-property :minute-start timestamp) 0)
                      (or (org-element-property :hour-start timestamp) 0)
                      (org-element-property :day-start timestamp)
                      (org-element-property :month-start timestamp)
                      (org-element-property :year-start timestamp)))))

(defun org-gantt-substring-if (string from to)
  "Return substring if STRING, FROM and TO are non-nil and from < to, otherwise nil."
  (and string from to (< from to) (substring string from to)))

(defun org-gantt-string-to-number (string)
  "Return a numberthat is `string-to-number' or 0 if STRING is nil."
  (if string (string-to-number string) 0))

(defun org-gantt-strings-to-time
    (seconds-string minutes-string &optional hours-string
                    days-string weeks-string months-string years-string hours-per-day)
  "Convert the given strings to time, taking into account HOURS-PER-DAY.
SECONDS-STRING MINUTES-STRING HOURS-STRING
   DAYS-STRING WEEKS-STRING MONTHS-STRING and YEARS-STRING are strings
that are converted to numbers. Then the time is calculated from the values."
  (let* ((ex-hours (+ (org-gantt-string-to-number seconds-string)
                      (* 60 (org-gantt-string-to-number minutes-string))
                      (* 3600 (org-gantt-string-to-number hours-string))))
         (calc-days (/ ex-hours (org-gantt-hours-per-day)))
         (rest-hours (% ex-hours (org-gantt-hours-per-day)))
         (work-free-days (plist-get org-gantt-options :work-free-days))
         (time
          (seconds-to-time
           (+ (org-gantt-string-to-number seconds-string)
              (* 60 (org-gantt-string-to-number minutes-string))
              (* 3600 (org-gantt-string-to-number hours-string))
              (* 3600 (or hours-per-day (org-gantt-hours-per-day)) (org-gantt-string-to-number days-string))
              (* 3600 (or hours-per-day (org-gantt-hours-per-day)) (- 7 (length work-free-days)))
              (* 3600 (or hours-per-day (org-gantt-hours-per-day)) 30 (org-gantt-string-to-number months-string))
              (* 3600 (or hours-per-day (org-gantt-hours-per-day)) 30 12 (org-gantt-string-to-number years-string))))))
    (if (= 0 (apply '+ time))
        nil
      time)))

(defun org-gantt-effort-to-time (effort &optional hours-per-day)
  "Parse EFFORT timestring and return it as Emacs time.
The returned time represents a time difference.
Optional HOURS-PER-DAY makes it possible to convert hour estimates into workdays."
  (and effort
       (let* ((years-string (org-gantt-substring-if effort 0 (string-match "y" effort)))
              (msp (if years-string (match-end 0) 0))
              (months-string (org-gantt-substring-if effort msp (string-match "m" effort)))
              (wsp (if months-string (match-end 0) msp))
              (weeks-string (org-gantt-substring-if effort wsp (string-match "w" effort)))
              (dsp (if weeks-string (match-end 0) wsp))
              (days-string (org-gantt-substring-if effort dsp (string-match "d" effort)))
              (hsp (if days-string (match-end 0) dsp))
              (hours-string (org-gantt-substring-if effort hsp (string-match ":" effort)))
              (minsp (if hours-string (match-end 0) hsp))
              (minutes-string (org-gantt-substring-if effort minsp (length effort))))
         (org-gantt-strings-to-time "0"
                                    minutes-string hours-string
                                    days-string weeks-string
                                    months-string years-string
                                    hours-per-day))))

(defun org-gantt-is-workday (time)
  "Return non-nil, iff TIME is a workday.  Currently does not consider holidays."
  (let ((dow (string-to-number (format-time-string "%w" time)))
        (work-free-days (plist-get org-gantt-options :work-free-days)))
    (not (member dow work-free-days))))

(defun org-gantt-change-workdays (time ndays change-function)
  "Add or subtract NDAYS workdays to the given TIME.
Add or subtract depends on change-function.
E.g. if time is on Friday, ndays is one, the result will be monday.
FIXME: Does not use holidays."
  (cl-assert (>= ndays 0) "trying to add negative days to timestamp.")
  (let ((oneday (days-to-time 1))
        (curtime time))
    (while (/= 0 ndays)
      (setq curtime (funcall change-function curtime oneday))
      (when (org-gantt-is-workday curtime)
        (setq ndays (- ndays 1))))
    curtime))

(defun org-gantt-day-end (time)
  "Get the end of the given workday TIME."
  (let ((dt (decode-time time)))
    (encode-time 0 0 (org-gantt-hours-per-day)
                 (nth 3 dt) (nth 4 dt) (nth 5 dt))))

(defun org-gantt-day-start (time)
  "Get the start of the given workday TIME."
  (let ((dt (decode-time time)))
    (encode-time 0 0 0 (nth 3 dt) (nth 4 dt) (nth 5 dt))))


(defun org-gantt-add-worktime (time change-time)
  "Add CHANGE-TIME to TIME, taking into account holidays and hours-per-day."
  (let* ((dt (decode-time time))
         (day-end (encode-time 0 0 (org-gantt-hours-per-day)
                               (nth 3 dt) (nth 4 dt) (nth 5 dt)))
         (rest-time (time-subtract day-end time))
         (one-day (days-to-time 1)))
    (if (time-less-p change-time rest-time)
        (time-add time change-time)
      (let*
          ((next-day-d (decode-time (org-gantt-change-workdays time 1 #'time-add)))
           (next-day (encode-time 0 0 0 (nth 3 next-day-d)
                                  (nth 4 next-day-d) (nth 5 next-day-d)))
           (rest-change (time-subtract change-time rest-time))
           (dc (decode-time rest-change))
           (rest-min (+ (nth 1 dc) (* 60 (nth 2 dc)))))
        (while (> rest-min (* 60 (org-gantt-hours-per-day)))
          (setq next-day (org-gantt-change-workdays next-day 1 #'time-add))
          (setq rest-change (time-subtract rest-change (seconds-to-time (* 3600 (org-gantt-hours-per-day)))))
          (setq dc (decode-time rest-change))
          (setq rest-min (+ (nth 1 dc) (* 60 (nth 2 dc)))))
        (while (time-less-p one-day rest-change)
          (setq next-day (org-gantt-change-workdays next-day 1 #'time-add))
          (setq rest-change (time-subtract rest-change one-day)))
        (time-add next-day rest-change)))))

(defun org-gantt-time-difference (t1 t2)
  "Calculate the difference between T1 and T2.
No matter which is larger, the resulting difference is always positive."
  (if (time-less-p t1 t2)
      (time-subtract t2 t1)
    (time-subtract t1 t2)))

(defun org-gantt-change-worktime (time change-time time-changer day-start-getter day-end-getter)
  "Add CHANGE-TIME to TIME, taking into account holidays and hours-per-day.
TIME-CHANGER determines wheter time is added or subtracted.
DAY-START-GETTER must return the day start, if TIME-CHANGER adds time,
otherwise the end.
DAY-END-GETTER must return the day end, if TIME-CHANGER adds time,
otherwise the start"
  (let* ((day-end (funcall day-end-getter time))
         (rest-time (org-gantt-time-difference day-end time))
         (one-day (days-to-time 1)))
                                        ;    (dbgmessage "Change Time: %s" (format-time-string "%Y-%m-%d:%T" change-time))
    (if (time-less-p change-time rest-time)
        (funcall time-changer time change-time)
      (let*
          ((next-day (funcall day-start-getter (org-gantt-change-workdays time 1 time-changer)))
           (rest-change (time-subtract change-time rest-time))
           (rest-sec (round (time-to-seconds rest-change))))
        (while (> rest-sec (* 3600 (org-gantt-hours-per-day)))
          (setq next-day (org-gantt-change-workdays next-day 1 time-changer))
          (setq rest-change (time-subtract rest-change (seconds-to-time (* 3600 (org-gantt-hours-per-day)))))
          (setq rest-sec (round (time-to-seconds rest-change))))
        (while (time-less-p one-day rest-change)
          (setq next-day (org-gantt-change-workdays next-day 1 time-changer))
          (setq rest-change (time-subtract rest-change one-day)))
        (funcall time-changer next-day rest-change)))))

(defun org-gantt-get-next-time (endtime)
  "Get the time where the next bar should start.
ENDTIME is the time where the previous bar ends."
  (let* ((dt (decode-time endtime))
         (hours (nth 3 dt))
         (minutes (nth 2 dt)))
    (if (and (= (org-gantt-hours-per-day) hours)
             (= 0 minutes))
        (org-gantt-change-worktime
         endtime (encode-time (* 3600 (- 24 (org-gantt-hours-per-day))) 0 0 0 0 0)
         #'time-add
         #'org-gantt-day-start #'org-gantt-day-end)
      endtime)))


(defun org-gantt-get-prev-time (starttime)
  "Get the time where the previous bar should end.
STARTTIME is the time where the next bar starts."
  (let* ((dt (decode-time starttime))
         (hours (nth 3 dt))
         (minutes (nth 2 dt)))
    (if (and (= (org-gantt-hours-per-day) hours)
             (= 0 minutes))
        (org-gantt-change-worktime
         starttime (seconds-to-time (* 3600 (- 24 (org-gantt-hours-per-day))))
         #'time-subtract
         #'org-gantt-day-end #'org-gantt-day-start)
      starttime)))


(defun org-gantt-propagate-order-timestamps (headline-list &optional is-ordered parent-start parent-end)
  "Propagate the times of headlines in HEADLINE-LIST that are ordered.
Recursively apply to subheadlines.
IS-ORDERED whether th(car headline-list) e current subheadlins are ordered.
PARENT-START start time of the parent of the current subheadlines.
PARENT-END end time of the parent of the current subheadlines.
The optional parameters ore only required for the recursive calls
from the function itself."
  (let ((next-start (or (org-gantt-gethash org-gantt-start-prop (car headline-list)) parent-start))
        (listitem headline-list)
        (headline nil)
        (is-changed nil))
    (while listitem
      (setq headline (car listitem))
      (when is-ordered
        (setq is-changed
              (or is-changed
                  (and next-start (not (org-gantt-gethash org-gantt-start-prop headline)))))
        (puthash org-gantt-start-prop
                 (or (org-gantt-gethash org-gantt-start-prop headline) next-start)
                 headline)
        (setq next-start (org-gantt-get-next-time (gethash org-gantt-end-prop headline)))
        (setq is-changed
              (or is-changed
                  (and (if (cdr listitem)
                           (org-gantt-get-prev-time
                            (gethash org-gantt-start-prop (cadr listitem)))
                         parent-end)
                       (not (org-gantt-gethash org-gantt-end-prop headline)))))
        (puthash org-gantt-end-prop
                 (or (org-gantt-gethash org-gantt-end-prop headline)
                     (if (cdr listitem)
                         (org-gantt-get-prev-time
                          (gethash org-gantt-start-prop (cadr listitem)))
                       parent-end))
                 headline))
      (setq is-changed
            (or
             (org-gantt-propagate-order-timestamps
              (gethash :subelements headline)
              (or is-ordered (gethash :ordered headline))
              (gethash org-gantt-start-prop headline)
              (gethash org-gantt-end-prop headline))
             is-changed))
      (setq listitem (cdr listitem)))
    is-changed))

(defun org-gantt-find-headline-with-id (headline-list id)
  "Return the first headline in HEADLINE-LIST with id ID.
Is applied to subheadlines (depth-first)."
  (and
   headline-list
   (let* ((headline (car headline-list))
          (cur-id (gethash org-gantt-id-prop headline))
          (subheadlines (gethash :subelements headline)))
     (if (equal cur-id id)
         headline
       (or (org-gantt-find-headline-with-id subheadlines id)
           (org-gantt-find-headline-with-id (cdr headline-list) id))))))

(defun org-gantt-propagate-linked-to-timestamps (headline-list complete-headline-list)
  "Propagate the end-times for linked-to headlines in HEADLINE-LIST.
Propagates endtime of a headline as start line of its linked-to headlines,
for all that do not already have start times.
FIXME this is not working."
  (dolist (headline headline-list headline-list)
    (let ((linked-ids (gethash org-gantt-linked-to-prop headline))
          (orig-id (gethash org-gantt-id-prop headline)))
      (when linked-ids
        (dbgmessage "FOUND ids %s" linked-ids))
      (dolist (linked-id linked-ids)
        (let ((found-headline
               (org-gantt-find-headline-with-id complete-headline-list linked-id)))
          (dbgmessage "FOUND headline %s" found-headline)
          (when (and found-headline
                     (not (gethash org-gantt-start-prop found-headline))
                     (gethash org-gantt-end-prop headline))
            (setq *org-gantt-changed-in-propagation* t)
            (dbgmessage "PROPAGATING linked-to %s" found-headline)
            (puthash
             orig-id
             (append (gethash orig-id *org-gantt-link-hash*) (list linked-id))
             *org-gantt-link-hash*)
            (puthash
             org-gantt-start-prop
             (org-gantt-get-next-time
              (gethash org-gantt-end-prop headline))
             found-headline))))
      (org-gantt-propagate-linked-to-timestamps
       (gethash :subelements headline) complete-headline-list))))

(defun org-gantt-calculate-ds-from-effort (headline-list)
  "Calculate deadline or schedule from effort in headlines of HEADLINE-LIST.
If a deadline or schedule conflicts with the effort, keep value and warn.
Recursively apply to subheadlines."
  (let ((is-changed nil))
    (dolist (headline headline-list is-changed)
      (let ((start (gethash org-gantt-start-prop headline))
            (end (gethash  org-gantt-end-prop headline))
            (effort (gethash org-gantt-effort-prop headline)))
        (cond ((and start end effort)
               effort) ;;FIXME: Calculate if start, end, effort conflict and warn.
              ((and start effort)
               (puthash org-gantt-end-prop
                        (org-gantt-change-worktime
                         start effort
                         #'time-add
                         #'org-gantt-day-start
                         #'org-gantt-day-end)
                        headline)
               (setq is-changed (or is-changed (gethash org-gantt-end-prop headline))))
              ((and effort end)
               (puthash org-gantt-start-prop
                        (org-gantt-change-worktime
                         end effort
                         #'time-subtract
                         #'org-gantt-day-end
                         #'org-gantt-day-start)
                        headline)
               (setq is-changed (or is-changed (gethash org-gantt-start-prop headline)))))
        (setq is-changed
              (or (org-gantt-calculate-ds-from-effort
                   (gethash :subelements headline))
                  is-changed))))))

(defun org-gantt-first-subheadline-start (headline)
  "Gets the start time of the first subelement of HEADLINE (or its subelement)."
  (and headline
       (let ((first-sub (car (gethash :subelements headline))))
         (or (org-gantt-gethash org-gantt-start-prop first-sub)
             (org-gantt-get-subheadline-start first-sub t)))))

(defun org-gantt-last-subheadline-end (headline)
  "Gets the end time of the last subelement of HEADLINE (or its subelement)."
  (and headline
       (let ((last-sub (car (last (gethash :subelements headline)))))
         (or (org-gantt-gethash org-gantt-end-prop last-sub)
             (org-gantt-get-subheadline-end last-sub t)))))

(defun org-gantt-get-subheadline-start (headline ordered)
  "Gets the start time of HEADLINE.
The start time is the start property iff it exists.
It is the start of the first subheadline, if ORDERED is true.
Otherwise it is the first start of all the subheadlines or their subheadlines."
  (or (org-gantt-gethash org-gantt-start-prop headline)
      (if ordered
          (org-gantt-first-subheadline-start headline)
        (org-gantt-subheadline-extreme
         headline
         #'org-gantt-time-less-p
         (lambda (hl) (org-gantt-get-subheadline-start hl ordered))
         (lambda (hl) (org-gantt-propagate-ds-up (gethash :subelements hl) ordered))))))

(defun org-gantt-get-subheadline-end (headline ordered)
  "Gets the end time of HEADLINE.
The end time is the end property iff it exists.
It is the end of the last subheadline, if ORDERED is true.
Otherwise it is the last end of all the subheadlines or their subheadlines."
  (or (org-gantt-gethash org-gantt-end-prop headline)
      (if ordered
          (org-gantt-last-subheadline-end headline)
        (org-gantt-subheadline-extreme
         headline
         #'org-gantt-time-larger-p
         (lambda (hl) (org-gantt-get-subheadline-end hl ordered))
         (lambda (hl) (org-gantt-propagate-ds-up (gethash :subelements hl) ordered))))))


(defun org-gantt-get-subheadline-effort-sum (headline)
  "Get the sum of efforts of the subheadlines of HEADLINE."
  (or (org-gantt-gethash org-gantt-effort-prop headline)
      (let ((subelements (gethash :subelements headline))
            (effort-sum (seconds-to-time 0)))
                                        ;        (org-gantt-propagate-effort-up subelements)
        (dolist (ch subelements effort-sum)
          (setq effort-sum
                (time-add effort-sum
                          (org-gantt-get-subheadline-effort-sum ch)))))))

(defun org-gantt-get-subheadline-progress-summation (headline calc-progress &optional prioritize-subsums)
  "Compute the summation of the progress of the subheadlines of HEADLINE.
The summation is weighted according to the effort of each subheadline.
If CALC-PROGRESS is 'use-larger-100,
subprogresses with an effort > 100 are used completely,
otherwise, a subprogress is used as having a max effort of 100.
If PRIORITIZE-SUBSUMS is non-nil, progress-summations are taken
from subheadlines, even if a headline has a progress."
  (let ((subelements (gethash :subelements headline))
        (progress (gethash org-gantt-progress-prop headline))
        (progress-sum nil)
        (count 0))
    (or (and (not prioritize-subsums)
             (equal calc-progress 'use-larger-100)
             progress)
        (and (not prioritize-subsums)
             progress
             (min 100 progress))
                                        ;        (org-gantt-propagate-summation-up subelements)
        (dolist (ch subelements (and progress-sum count (round (/ progress-sum count))))
          (let ((subsum (org-gantt-get-subheadline-progress-summation ch calc-progress prioritize-subsums))
                (subeffort (time-to-seconds (gethash :effort ch))))
            (setq count (+ count subeffort))
                                        ;            (dbgmessage "ps: %s, ss: %s" progress-sum subsum)
            (setq progress-sum
                  (cond
                   ((and progress-sum subsum)
                    (+ progress-sum (* subeffort subsum)))
                   (progress-sum progress-sum)
                   (subsum (* subeffort subsum))
                   (t nil)))))
        (and (equal calc-progress 'use-larger-100)
             progress)
        (and  progress
              (min 100 progress)))))

(defun org-gantt-propagate-ds-up (headline-list &optional ordered)
  "Propagate start and end time from subelements.
HEADLINE-LIST the list of headlines where the propagation takes place.
ORDERED determines whether the current list is ordered in recursive calls."
  (dolist (headline headline-list headline-list)
    (let* ((cur-ordered (or ordered (gethash :ordered headline)))
           (start (gethash org-gantt-start-prop headline))
           (end (gethash org-gantt-end-prop headline))
           (subheadline-start (org-gantt-get-subheadline-start headline cur-ordered))
           (subheadline-end (org-gantt-get-subheadline-end headline cur-ordered)))
      (puthash org-gantt-start-prop
               subheadline-start
               headline)
      (puthash org-gantt-end-prop
               subheadline-end
               headline)
      (setq *org-gantt-changed-in-propagation*
            (or *org-gantt-changed-in-propagation*
                (not (equal start subheadline-start))
                (not (equal end subheadline-end)))))))

(defun org-gantt-propagate-summation-up (headline-list property subsum-getter &optional prioritize-subsums)
  "Propagate summed efforts from subelements in HEADLINE-LIST.
Get the efforts via PROPERTY.
When the current headline does not have PROPERTY, or
PRIORITIZE-SUBSUMS is non-nil, use SUBSUM-GETTER to get
the summed effort from subelements."
  (dolist (headline headline-list headline-list)
    (let ((effort (gethash property headline)))
      (when (or prioritize-subsums (not effort))
        (puthash  property
                  (funcall subsum-getter headline)
                  headline)))))

(defun org-gantt-propagate-tags-down (headline-list parent-tags)
  "Propagate the tags of each headline into :parent-tag-prop of each subheadline
and their subheadlines."
  (dolist (headline headline-list headline-list)
    (puthash org-gantt-parent-tags-prop parent-tags headline)
    (org-gantt-propagate-tags-down
     (gethash :subelements headline)
     (append parent-tags (gethash org-gantt-tags-prop headline)))))

(defun org-gantt-compute-progress (headline-list)
  "Compute the progress (if possible) for the headlines in HEADLINE-LIST.
Is recursively applied to subelements."
  (dolist (headline headline-list headline-list)
    (let ((effort (gethash org-gantt-effort-prop headline))
          (clocksum (gethash org-gantt-clocksum-prop headline))
          (subelements (gethash :subelements headline)))
      (when (and effort clocksum)
        (puthash org-gantt-progress-prop
                 (org-gantt-get-completion-percent effort clocksum)
                 headline))
      (org-gantt-compute-progress subelements))))

(defun org-gantt-downcast-endtime (endtime)
  "Downcast ENDTIME to the previous day, if sensible.
If ENDTIME is at the beginning of a day, it is changed to being at
hours-per-day of the previous day."
  (let* ((dt (decode-time endtime))
         (hours (nth 2 dt))
         (minutes (nth 1 dt)))
    (if (and (= 0 hours)
             (= 0 minutes))
        (time-add (org-gantt-change-workdays endtime 1 #'time-subtract)
                  (org-gantt-hours-per-day-time))
      endtime)))

(defun org-gantt-upcast-starttime (starttime)
  "Upcast STARTTIME to the next day, if sensible.
If STARTTIME is at hours-per-day of a day, it is changed
to the start of the next day."
  (let* ((dt (decode-time starttime))
         (hours (nth 2 dt))
         (minutes (nth 1 dt)))
    (if (and (= 0 minutes)
             (= (org-gantt-hours-per-day) hours))
        (time-subtract (org-gantt-change-workdays starttime 1 #'time-add)
                       (org-gantt-hours-per-day-time))
      starttime)))

(defun org-gantt-get-day-ratio (time)
  "Return the ratio of a workday that is in the hour-minute part of TIME."
  (if time
      (progn
        (let* ((dt (decode-time time))
               (hours (nth 2 dt))
               (minutes (nth 1  dt))
               (minsum (+ minutes (* 60 hours))))
          (/ (float minsum) (* 60 (org-gantt-hours-per-day)))))
    0))

(defun org-gantt-get-month-ratio (time)
  "Return the ratio of the month that is passed in TIME."
  (if time
      (progn
        (let* ((dt (decode-time time))
               (day (nth 3 dt))
               (month (nth 4 dt))
               (year (nth 5 dt))
               (days-in-month (calendar-last-day-of-month month year)))
          (/ (float day) (float days-in-month))))
    0))

(defun org-gantt-get-completion-percent (effort clocksum)
  "Return the percentage of completion of EFFORT as measured by CLOCKSUM."
  (if (and clocksum effort)
      (let ((css (time-to-seconds clocksum))
            (es (time-to-seconds effort)))
        (if (> es 0) (round (* 100  (/ css es)))  0))
    0))

(defun org-gantt-get-shifts (up-start down-end compress &optional subelements)
  "Return the string describing the shift for pgf-gantt.
Calculate the shift from UP-START and DOWN-END.
If compress is non-nil calculate month shifts,
otherwise, calculate day shifts.
Use \"group left shift=\" instead of \"bar left shift=\" for SUBELEMENTS."
  (concat
   (if subelements "group left shift=" "bar left shift=")
   (number-to-string
    (if compress
        (org-gantt-get-month-ratio up-start)
      (org-gantt-get-day-ratio up-start)))
   (if subelements ", group right shift=" ", bar right shift=")
   (number-to-string
    (if compress
        (* -1.0 (- 1.0  (org-gantt-get-month-ratio down-end)))
      (if (>  (org-gantt-get-day-ratio down-end) 0)
          (* -1.0 (- 1.0 (org-gantt-get-day-ratio down-end)))
        0)))))

(defun org-gantt-get-tags-style (tags tags-styles)
  "Return the style appropriate for the given TAGS as noted by TAGS-STYLE.
i.e. the first found style."
  (let ((style nil))
    (dolist (tag tags style)
      (and (not style) (setq style (cdr (assoc tag tags-styles)))))))

(defun org-gantt-is-in-tags (tags taglist)
  "Return true iff any member of TAGLIST is in TAGS."
  (let ((ismember nil))
    (dolist (ct taglist ismember)
      (setq ismember (or ismember (member ct tags))))))

(defun org-gantt-stats-cookie-to-progress (stats-cookie)
  "Return a string between 0 and 100 representing the value of STATS-COOKIE.
Return nil, if stats-cookie is not readable."
  (let ((trimmed-cookie (substring stats-cookie 1 (- (length stats-cookie) 1))))
    (cond ((string-match "%" trimmed-cookie)
           (substring trimmed-cookie 0 (- (length trimmed-cookie) 1)))
          ((string-match "/" trimmed-cookie)
           (let* ((listy (split-string trimmed-cookie "/"))
                  (dividend (string-to-number (car listy)))
                  (divisor (string-to-number (cadr listy)))
                  (progress (* 100 (/ (float dividend) divisor))))
             (number-to-string progress)))
          (t nil))))

(defun org-gantt-info-to-pgfgantt (gi default-date level &optional prefix ordered linked last)
  "Create a pgfgantt string from gantt-info GI.
Prefix the created string with PREFIX.
ORDERED determines whether the current headaline is ordered
\(Required for correct linking of sub-subheadlines\).
Create a bar linked to the previous bar, if LINKED is non-nil.
LAST should be non-nil for the last gant-info in the Gant Chart."
  (when gi
    (let* ((subelements (gethash :subelements gi))
           (id (gethash org-gantt-id-prop gi))
           (start (gethash org-gantt-start-prop gi))
           (end (gethash org-gantt-end-prop gi))
           (up-start (org-gantt-upcast-starttime (gethash org-gantt-start-prop gi)))
           (down-end (org-gantt-downcast-endtime (gethash org-gantt-end-prop gi)))
           (effort (gethash org-gantt-effort-prop gi))
           (clocksum (gethash org-gantt-clocksum-prop gi))
           (progress (gethash org-gantt-progress-prop gi))
           (progress-str (and progress (number-to-string progress)))
           (stats-cookie (gethash org-gantt-stats-cookie-prop gi))
           (stats-cookie-str (and stats-cookie (org-gantt-stats-cookie-to-progress stats-cookie)))
           (tags (gethash org-gantt-tags-prop gi))
           (parent-tags (gethash org-gantt-parent-tags-prop gi))
           (compress (plist-get org-gantt-options :compress))
           (no-date-headlines (plist-get org-gantt-options :no-date-headlines))
           (incomplete-date-headlines (plist-get org-gantt-options :incomplete-date-headlines))
           (inactive-bar-style (plist-get org-gantt-options :inactive-bar-style))
           (inactive-group-style (plist-get org-gantt-options :inactive-group-style))
           (maxlevel (plist-get org-gantt-options :maxlevel))
           (tags-bar-style (plist-get org-gantt-options :tags-bar-style))
           (tags-group-style (plist-get org-gantt-options :tags-group-style))
           (tag-style-effect (plist-get org-gantt-options :tag-style-effect))
           (tag-style-to-subheadlines (equal tag-style-effect 'subheadlines))
           (ctag-group-style (or (org-gantt-get-tags-style tags tags-group-style)
                                 (and tag-style-to-subheadlines
                                      (org-gantt-get-tags-style parent-tags tags-group-style))))
           (ctag-bar-style (or (org-gantt-get-tags-style tags tags-bar-style)
                               (and tag-style-to-subheadlines
                                    (org-gantt-get-tags-style parent-tags tags-bar-style))))
           (ignore-tags (plist-get org-gantt-options :ignore-tags))
           (use-tags (plist-get org-gantt-options :use-tags))
           (is-milestone (org-gantt-is-in-tags tags (plist-get org-gantt-options :milestone-tags)))
           (show-progress (plist-get org-gantt-options :show-progress))
           (progress-source (plist-get org-gantt-options :progress-source))
           (inactive-style)
           (ignore-this nil) ;ignore everything sub-this
           (ignore-only-this nil) ;ignore this, but maybe allow sub-this
           )
      (cond ((and (not up-start) (not down-end))
             (when (equal no-date-headlines 'ignore)
               (setq ignore-this t))
             (setq up-start default-date)
             (setq down-end default-date))
            ((not down-end)
             (when (equal incomplete-date-headlines 'ignore)
               (setq ignore-this t))
             (setq down-end up-start))
            ((not up-start)
             (when (equal incomplete-date-headlines 'ignore)
               (setq ignore-this t))
             (setq up-start down-end)))
      (when (and ignore-tags (org-gantt-is-in-tags tags ignore-tags))
        (setq ignore-this t))
      (when (and use-tags
                 (not (org-gantt-is-in-tags tags use-tags))
                 (not (org-gantt-is-in-tags parent-tags use-tags)))
        (setq ignore-only-this t))
      (unless ignore-this
        (concat
         (unless ignore-only-this
           (concat
            prefix
            (cond (is-milestone
                   (if linked "\\ganttlinkedmilestone" "\\ganttmilestone"))
                  (subelements
                   (if linked "\\ganttlinkedgroup" "\\ganttgroup"))
                  (t
                   (if linked "\\ganttlinkedbar" "\\ganttbar")))
            "["
            (org-gantt-get-shifts up-start down-end compress subelements)
            (when id (concat ", name=" id))
            (cond
             ((equal show-progress 'always)
              (concat
               ", progress="
               (cond
                ((equal progress-source 'clocksum) progress-str)
                ((equal progress-source 'cookie) stats-cookie-str)
                ((equal progress-source 'clocksum-cookie) (or progress-str stats-cookie-str))
                ((equal progress-source 'cookie-clocksum) (or stats-cookie-str progress-str))
                (t nil))))
             ((and (equal show-progress 'if-exists)
                   (equal progress-source 'clocksum)
                   clocksum)
              (concat ",progress=" progress-str))
             ((and (equal show-progress 'if-exists)
                   (equal progress-source 'cookie)
                   stats-cookie)
              (concat ",progress=" stats-cookie-str))
             ((and (equal show-progress 'if-exists)
                   (equal progress-source 'clocksum-cookie)
                   (or clocksum stats-cookie))
              (concat ",progress=" (or progress-str stats-cookie-str)))
             ((and (equal show-progress 'if-exists)
                   (equal progress-source 'cookie-clocksum)
                   (or stats-cookie clocksum))
              (concat ",progress=" (or stats-cookie-str progress-str)))
             (t nil))

            ;; (when (or (equal show-progress 'always)
            ;;      (and (equal show-progress 'if-exists)
            ;;       (or (and (equal progress-source 'clocksum)
            ;;            clocksum)
            ;;           (and (equal progress-source 'clocksum)))))
            ;;              ;FIXME : use progress-prop here
            ;;   (concat
            ;;    ", progress="
            ;;    (if progress (number-to-string progress)
            ;;      (if stats-cookie stats-cookie "NIX") "0")))

            (cond ((or (and (not up-start) (not down-end) (equal no-date-headlines 'inactive))
                       (and (or (not up-start) (not down-end)) (equal incomplete-date-headlines 'inactive)))
                   (if subelements
                       (concat ", " inactive-group-style)
                     (concat ", " inactive-bar-style)))
                  ((and subelements ctag-group-style)
                   (concat ", " ctag-group-style))
                  ((and (not subelements) ctag-bar-style)
                   (concat ", " ctag-bar-style)))
            "]"
            "{"
            (apply #'concat (split-string (gethash :name gi) "%" t))
            "}"
            "{"
            (if is-milestone
                (format-time-string "%Y-%m-%d" start)
              (if up-start
                  (format-time-string "%Y-%m-%d" up-start)
                (if (not (equal no-date-headlines 'ignore))
                    (format-time-string "%Y-%m-%d" default-date))))
            "}"
            (unless is-milestone
              (concat
               "{"
               (if down-end
                   (format-time-string "%Y-%m-%d" down-end)
                 (if (not (equal no-date-headlines 'ignore))
                     (format-time-string "%Y-%m-%d" default-date)))
               "}"))
            (and (or subelements (null last)) "\\\\")
            (when org-gantt-output-debug-dates
              (concat
               "%"
               (when start
                 (format-time-string "%Y-%m-%d,%H:%M" start))
               " -- "
               (when effort
                 (concat
                  (number-to-string (floor (time-to-number-of-days effort)))
                  "d "
                  (format-time-string "%H:%M" effort)))
               (when clocksum
                 (concat
                  " -("
                  (number-to-string (floor (time-to-number-of-days clocksum)))
                  "d "
                  (format-time-string "%H:%M" effort)
                  ")- "))
               " -- "
               (when end
                 (format-time-string "%Y-%m-%d,%H:%M" end))))
            "\n"))
         (when (and subelements (or (not maxlevel) (< level maxlevel)))
           (org-gantt-info-list-to-pgfgantt
            subelements
            default-date
            (+ level 1)
            (concat prefix "  ")
            (or ordered (gethash :ordered gi)) last)))))))

(defun org-gantt-info-list-to-pgfgantt (data default-date level &optional prefix ordered last)
  "Return a pgfgantt string representing DATA.
Prefix each line of the created representation with PREFIX.
Create correctly linked representation, if ORDERED is non-nil."
  (apply #'concat
	 (org-gantt-info-to-pgfgantt (car data) default-date level prefix ordered nil (and last (null (cdr data))))
	 (cl-loop for datum on (cdr data)
		  collect
		  (org-gantt-info-to-pgfgantt (car datum) default-date level prefix ordered ordered (and last (null (cdr datum)))))))

(defun org-gantt-linkhash-to-pgfgantt (linkhash)
  "Return a pgfgantt string representing the links in LINKHASH."
  (dbgmessage "LINKED-HASH: %s" linkhash)
  (let ((retstring ""))
    (maphash
     (lambda (from tolist)
       (dolist (to tolist)
         (setq retstring
               (concat retstring "\\ganttlink{" from "}{" to "}\n"))))
     linkhash)
    retstring))

(defun org-gantt-days-to-vgrid-style (weekend workday weekend-style workday-style)
  "Return a vgrid-style for either WEEKEND or WORKDAY (whichever is non-nil).
Use WEEKEND-STYLE or WORKDAY-STYLE, resp., for as the style string."
  (or
   (when weekend
     (concat "*" (number-to-string weekend) weekend-style))
   (when workday
     (concat "*" (number-to-string workday) workday-style))))

(defun org-gantt-get-vgrid-style (start-time weekend-style workday-style)
  "Compute a vgrid style from the START-TIME, marking weekends.
Use WEEKEND-STYLE and WORKDAY-STYLE as templates for the style."
  (let* ((dow (string-to-number (format-time-string "%w" start-time)))
         (weekend-start (and (or (= 0 dow) (> dow 4)) (% (- 8 dow) 7)))
         (work-start (and (> dow 0) (< dow 5) (- 5 dow)))
         (weekend-middle (and (not weekend-start) 3))
         (work-middle (and (not work-start) 4))
         (weekend-end (and weekend-start (< weekend-start 3) (- 3 weekend-start)))
         (work-end (and work-start (< work-start 4) (- 4 work-start))))
    (concat
     "{"
     (org-gantt-days-to-vgrid-style weekend-start work-start weekend-style workday-style)
     ","
     (org-gantt-days-to-vgrid-style weekend-middle work-middle weekend-style workday-style)
     (when (or weekend-end work-end) ",")
     (org-gantt-days-to-vgrid-style weekend-end work-end weekend-style workday-style)
     "}")))

;; Used to pass params to org-babel:
(defun org-gantt-plist-to-alist (pl)
  "Transform property list PL into an association list."
  (let (al)
    (cl-loop for p on pl by #'cddr
	     collect (cons (car p) (cadr p))
	     )))

(defun dbgmessage (format-string &rest args)
  "FIXME: get rid of after debugging"
  (apply #'message format-string args))
;;  (let ((print-length nil) (print-level nil))
;;  (insert (apply #'format (concat format-string "\n") args))))

(defun org-dblock-write:org-gantt-chart (params)
  "The function that is called for updating gantt chart code.
PARAMS determine several options of the gantt chart."
  (setq *org-gantt-changed-in-propagation* t)
  (setq *org-gantt-id-counter* 0)
  (setq *org-gantt-link-hash* (make-hash-table))
  (let (id idpos id-as-string view-file view-pos)
    (when (setq id (plist-get params :id))
      (setq id-as-string (cond ((numberp id) (number-to-string id))
                               ((symbolp id) (symbol-name id))
                               ((stringp id) id)
                               (t "")))
      (cond ((not id) nil)
            ((eq id 'global) (setq view-pos (point-min)))
            ((eq id 'local))
            ((string-match "^file:\\(.*\\)" id-as-string)
             (setq view-file (match-string 1 id-as-string)
                   view-pos 1)
             (unless (file-exists-p view-file)
               (error "No such file: \"%s\"" id-as-string)))))
    (with-current-buffer
        (if view-file
            (get-file-buffer view-file)
          (current-buffer))
      (org-clock-sum)
      (setq org-gantt-hours-per-day-gv (or (plist-get params :hours-per-day) org-gantt-default-hours-per-day))
      (let* ((titlecalendar (or (plist-get params :title-calendar) org-gantt-default-title-calendar))
             (compressed-titlecalendar (or (plist-get params :compressed-title-calendar) org-gantt-default-compressed-title-calendar))
             (hgrid (if (plist-member params :hgrid) (plist-get params :hgrid) org-gantt-default-hgrid))
             (start-date (plist-get params :start-date))
             (end-date (plist-get params :end-date))
             (start-date-list (and start-date (org-parse-time-string start-date)))
             (end-date-list (and end-date (org-parse-time-string end-date)))
             (start-date-time (and start-date-list (apply 'encode-time start-date-list)))
             (end-date-time (and end-date-list (apply 'encode-time end-date-list)))
             (additional-parameters (plist-get params :parameters))
             (weekend-style (or (plist-get params :weekend-style) org-gantt-default-weekend-style))
             (workday-style (or (plist-get params :workday-style) org-gantt-default-workday-style))
             (today-value (plist-get params :today))
             (calc-progress (plist-get params :calc-progress))
             (id-subelements (plist-get params :use-id-subheadlines))
             (compress (plist-get params :compress))
             (tikz-options (plist-get params :tikz-options))
             (parsed-buffer (org-element-parse-buffer))
             (parsed-data
              (cond ((or (not id) (eq id 'global) view-file) parsed-buffer)
                    ((eq id 'local) (error "Local id handling not yet implemented"))
                    (t (org-element-map parsed-buffer 'headline
                         (lambda (element)
                           (if (equal (org-element-property :ID element) id)
                               (if id-subelements
                                   (cdr element)
                                 element)
                             nil))  nil t))))
             (org-gantt-info-list (org-gantt-crawl-headlines parsed-data))
             (org-gantt-check-info-list nil))
        (setq org-gantt-options
              (list :work-free-days
                    (or (plist-get params :work-free-days) org-gantt-default-work-free-days)
                    :no-date-headlines
                    (or (plist-get params :no-date-headlines) org-gantt-default-no-date-headlines)
                    :incomplete-date-headlines
                    (or (plist-get params :incomplete-date-headlines) org-gantt-default-incomplete-date-headlines)
                    :inactive-bar-style
                    (or (plist-get params :inactive-bar-style) org-gantt-default-inactive-bar-style)
                    :inactive-group-style
                    (or (plist-get params :inactive-group-style) org-gantt-default-inactive-group-style)
                    :tags-bar-style
                    (or (plist-get params :tags-bar-style) org-gantt-default-tags-bar-style)
                    :tags-group-style
                    (or (plist-get params :tags-group-style) org-gantt-default-tags-group-style)
                    :tag-style-effect
                    (or (plist-get params :tag-style-effect) org-gantt-default-tag-style-effect)
                    :use-tags
                    (or (plist-get params :use-tags) org-gantt-default-use-tags)
                    :ignore-tags
                    (or (plist-get params :ignore-tags) org-gantt-default-ignore-tags)
                    :milestone-tags
                    (or (plist-get params :milestone-tags) org-gantt-default-milestone-tags)
                    :linked-to-property-keys
                    (or (plist-get params :linked-to-property-keys) org-gantt-default-linked-to-property-keys)
                    :show-progress
                    (or (plist-get params :show-progress) org-gantt-default-show-progress)
                    :progress-source
                    (or (plist-get params :progress-source) org-gantt-default-progress-source)
                    :compress
                    compress
                    :maxlevel
                    (or (plist-get params :maxlevel) org-gantt-default-maxlevel)))
        (when (not parsed-data)
          (error "Could not find element with :ID: %s" id))
        (while *org-gantt-changed-in-propagation*
          (setq *org-gantt-changed-in-propagation* nil)
          (setq *org-gantt-changed-in-propagation*
                (org-gantt-calculate-ds-from-effort org-gantt-info-list))
          (setq *org-gantt-changed-in-propagation*
                (or (org-gantt-propagate-order-timestamps org-gantt-info-list)
                    *org-gantt-changed-in-propagation*))
          (org-gantt-propagate-ds-up org-gantt-info-list)
          (org-gantt-propagate-linked-to-timestamps
           org-gantt-info-list org-gantt-info-list))
                                        ;        (dbgmessage "IL2 %s" (pp org-gantt-info-list))
        (org-gantt-propagate-summation-up
         org-gantt-info-list
         org-gantt-effort-prop
         #'org-gantt-get-subheadline-effort-sum)
        (org-gantt-compute-progress org-gantt-info-list)
                                        ;        (dbgmessage "%s" (pp org-gantt-info-list))
        (org-gantt-propagate-summation-up
         org-gantt-info-list
         org-gantt-progress-prop
         (lambda (hl) (org-gantt-get-subheadline-progress-summation hl calc-progress t))
         t)
        (org-gantt-propagate-tags-down org-gantt-info-list nil)
                                        ;	(dbgmessage "%s" (pp org-gantt-info-list))
        (setq start-date-time
              (or start-date-time
                  (org-gantt-get-extreme-date-il
                   org-gantt-info-list
                   (lambda (info) (gethash org-gantt-start-prop info))
                   #'org-gantt-time-less-p)))
        (setq end-date-time
              (or end-date-time
                  (org-gantt-get-extreme-date-il
                   org-gantt-info-list
                   (lambda (info) (gethash org-gantt-end-prop info))
                   #'org-gantt-time-larger-p)))
        (let ((body (concat
                     (when tikz-options
                       (concat
                        "\\begin{tikzpicture}["
                        tikz-options
                        "]\n"))
                     "\\begin{ganttchart}[time slot format=isodate, "
                     "vgrid="
                     (org-gantt-get-vgrid-style start-date-time weekend-style workday-style)
                     (when hgrid
                       ", hgrid")
                     (when compress
                       ", compress calendar")
                     (when today-value
                       (concat
                        ", today="
                        (format-time-string
                         "%Y-%m-%d"
                         (if (equal t today-value)
                             (current-time)
                           (org-gantt-timestamp-to-time (org-parse-time-string today-value))))))
                     (when additional-parameters
                       (concat ", " additional-parameters))
                     "]{"
                     (format-time-string "%Y-%m-%d" start-date-time)
                     "}{"
                     (format-time-string "%Y-%m-%d" end-date-time)
                     "}\n"
                     "\\gantttitlecalendar{"
                     (if compress
                         compressed-titlecalendar
                       titlecalendar)
                     "}\\\\\n"
                     (org-gantt-info-list-to-pgfgantt org-gantt-info-list start-date-time 1 nil nil t)
                     (org-gantt-linkhash-to-pgfgantt *org-gantt-link-hash*)
                     "\\end{ganttchart}"
                     (when tikz-options
                       "\n\\end{tikzpicture}"))))
          (if (plist-get params :file)
              (progn
                (dbgmessage "%s" (org-gantt-plist-to-alist (append params (list :fit t :headers "\\usepackage{pgfgantt}\n"))))
                (dbgmessage "%s" body)
                (dbgmessage "%s" (org-babel-merge-params (org-gantt-plist-to-alist (append params (list :fit t :headers "\\usepackage{pgfgantt}\n")))))
                (org-babel-execute:latex body
                                         (org-babel-merge-params (org-gantt-plist-to-alist (append params (list :fit t :headers "\\usepackage{pgfgantt}\n")))))
                (insert (org-babel-result-to-file (plist-get params :file)))
                (org-redisplay-inline-images))
            (insert body))
          )))))

(provide 'org-gantt)

;;; org-gantt.el ends here
