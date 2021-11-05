;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq graphic-only-plugins-setting ())

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "rewine"
      user-mail-address "lhongxu@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrains Mono" :size 12 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Sarasa Mono Slab SC" :size 13))

(push '(doom-big-font-mode) graphic-only-plugins-setting)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-load-path! (expand-file-name "~/.doom.d/lisp"))
(require 'init-better-defaults)

(add-load-path! (expand-file-name "~/.doom.d/tool"))
(push '(progn (require 'init-eaf)
              (require 'init-telega))
      graphic-only-plugins-setting)


(defun graphic-p ()
  "判断当前环境是否为图形环境"
  (if (display-graphic-p)
      t))
;; 图形化插件特殊设置
(if (not (graphic-p))
    (add-hook 'after-make-frame-functions
              (lambda (new-frame)
                (select-frame new-frame)
                (dolist (elisp-code graphic-only-plugins-setting)
                  (eval elisp-code))))
  (dolist (elisp-code graphic-only-plugins-setting)
    (eval elisp-code)))
