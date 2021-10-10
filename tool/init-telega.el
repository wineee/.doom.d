;;; tool/init-telega.el -*- lexical-binding: t; -*-

;; 请确保你安装了 tdlib 库。
;; yay -S libtd-git

;;https://zevlg.github.io/telega.el/

(use-package telega
  :load-path "~/.doom.d/site-lisp/telega.el"
  :commands (telega)
  :init (setq telega-proxies
	      '((:server "localhost"
			 :port "1089"
                         :enable t
                         :type (:@type "proxyTypeSocks5")))
              telega-chat-show-avatars nil)
  (setq telega-chat-fill-column 65)
  (setq telega-emoji-use-images t)
  ;;(setq telega-server-libs-prefix "/nix/store/8n54mnnizmzvi7b3bhv31fc3hr0fcl9i-tdlib-1.7.0/lib")
  :config
  (set-fontset-font t 'unicode (font-spec :family "Symbola") nil 'prepend)
  (with-eval-after-load 'company (add-hook 'telega-chat-mode-hook (lambda ()
                                                                    (make-local-variable 'company-backends)
                                                                    (dolist (it '(telega-company-botcmd telega-company-emoji))
                                                                      (push it company-backends)))))
  (with-eval-after-load 'all-the-icons (add-to-list 'all-the-icons-mode-icon-alist '(telega-root-mode all-the-icons-fileicon "telegram"
                                                                                                      :heigt 1.0
                                                                                                      :v-adjust -0.2
                                                                                                      :face all-the-icons-yellow))
                        (add-to-list 'all-the-icons-mode-icon-alist '(telega-chat-mode all-the-icons-fileicon "telegram"
                                                                                       :heigt 1.0
                                                                                       :v-adjust -0.2
                                                                                       :face all-the-icons-blue)))
  (telega-notifications-mode t)
  (telega-mode-line-mode 1)
  (add-hook 'telega-chat-mode-hook
            (lambda ()
              (toggle-truncate-lines +1)
              (display-line-numbers-mode -1)))
  (add-hook 'telega-root-mode-hook
            (lambda ()
              (toggle-truncate-lines +1)
              (display-line-numbers-mode -1)
              (toggle-truncate-lines -1)))
  (define-key telega-msg-button-map "k" nil))


(provide 'init-telega)
