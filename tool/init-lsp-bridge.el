;;; tool/init-lsp-bridge.el -*- lexical-binding: t; -*-
;;; Code:

(add-subdirs-to-load-path "~/.doom.d/site-lisp/lsp-bridge")

(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(provide 'init-lsp-bridge)

;;; init-lsp-bridge.el ends here
