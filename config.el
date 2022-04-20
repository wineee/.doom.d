;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq-default tab-width 4) ;; 表示一个 tab 4个字符宽
(setq-default indent-tabs-mode nil) ;; nil 表示将 tab 替换成空格

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
(setq
 doom-font (font-spec :family "JetBrains Mono" :size 16 :weight 'regular)
 doom-big-font (font-spec :family "JetBrains Mono" :size 19)
 doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 16)
 doom-serif-font (font-spec :family "JetBrains Mono" :size 16))

;; (push '(doom-big-font-mode) graphic-only-plugins-setting)

;; You can either set `doom-theme' or `load-theme' function
;; (setq doom-theme 'doom-one)
(use-package! dracula-theme
  :config
  (load-theme 'dracula t))

;; It must be set before org loads!
(setq org-directory "~/org/")

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

(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)
    (dolist (path load-path)
      (when (or (string-match-p "/node_modules" path)
                (string-match-p "/dist" path))
        (setq load-path (delete path load-path))))))

;; (add-subdirs-to-load-path "~/.doom.d/site-lisp")

(add-load-path! (expand-file-name "~/.doom.d/lisp"))
;;(require 'init-better-defaults)

(add-load-path! (expand-file-name "~/.doom.d/tool"))
(push '(progn (require 'init-eaf)
	      (require 'init-popweb))
      graphic-only-plugins-setting)
;; (require 'init-ncm)

;; 图形化插件特殊设置
(if (not (display-graphic-p))
    (add-hook 'after-make-frame-functions
              (lambda (new-frame)
                (select-frame new-frame)
                (dolist (elisp-code graphic-only-plugins-setting)
                  (eval elisp-code))))
  (dolist (elisp-code graphic-only-plugins-setting)
    (eval elisp-code)))
