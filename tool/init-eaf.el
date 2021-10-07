(use-package eaf
  :load-path "~/.doom.d/site-lisp/emacs-application-framework"
  :config
  ;;(use-package eaf-video-player)
  (require 'eaf-file-manager)
  (require 'eaf-browser)
  (require 'eaf-netease-cloud-music)
  (require 'eaf-music-player)
  (require 'eaf-system-monitor)
  ;;(require 'eaf-rss-reader)
  (require 'eaf-image-viewer)
  (require 'eaf-pdf-viewer)
  ;; (require 'eaf-mermaid)
  ;;(require 'eaf-markdown-previewer)
  ;;(require 'eaf-org-previewer)
  (require 'eaf-video-player)
  (require 'eaf-demo)

  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding) ;; unbind, see more in the Wiki

  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
)

(provide 'init-eaf)
