(use-package! eaf
  :load-path "~/.doom.d/site-lisp/emacs-application-framework"
  :config
  ;;(use-package eaf-video-player)
  ;;(require 'eaf-file-manager)
  (require 'eaf-browser nil t)
  ;;(require 'eaf-netease-cloud-music)
  (require 'eaf-music-player)
  ;;(require 'eaf-system-monitor)
  ;;(require 'eaf-rss-reader)
  (require 'eaf-image-viewer)
  (require 'eaf-pdf-viewer)
  ;; (require 'eaf-mermaid)
  ;;(require 'eaf-markdown-previewer)
  ;;(require 'eaf-org-previewer)
  (require 'eaf-video-player)
  (require 'eaf-demo)
  (require 'eaf-evil)

  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding) ;; unbind, see more in the Wiki

  :custom
  (browse-url-browser-function #'eaf-open-browser) ;; Make EAF Browser my default browser
  (eaf-browser-continue-where-left-off t)
  (eaf-start-python-process-when-require t)
  (eaf-browser-default-zoom 1.25)
  (eaf-browser-enable-adblocker t)
  (eaf-browser-enable-autofill t)
  (eaf-file-manager-show-preview t)
  (eaf-pdf-dark-mode "ignore")
  (eaf-browser-dark-mode "follow")
)


(define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC"))))


(provide 'init-eaf)
