;;; tool/init-lsp-bridge.el -*- lexical-binding: t; -*-
;;; Code:

(add-subdirs-to-load-path "~/.doom.d/site-lisp/lsp-bridge")

(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(map! :map acm-mode-map
      [tab]           #'acm-select-next
      [backtab]       #'acm-select-prev)

(map! :map doom-leader-code-map
      :desc "LSP Rename"
      "r"             #'lsp-bridge-rename
      :desc "LSP Find declaration"
      "j"             #'lsp-bridge-find-def)

(setq lsp-bridge-enable-log 1)

(provide 'init-lsp-bridge)

;;; init-lsp-bridge.el ends here
