;;; tool/init-reveal.el -*- lexical-binding: t; -*-

;; in NixOS
;; nix-shell -p gcc librime cmake rime-data

(use-package! rime
  :custom
  (rime-emacs-module-header-root "/nix/store/vvxcs4f8x14gyahw50ssff3sk2dij2b3-emacs-27.2/include/")
  (rime-user-data-dir "~/.doom.d/rime")
  (rime-share-data-dir "/nix/store/hnv0fx8sfrbrw1mj559x61vrvk7qidv5-rime-data-0.38.20210628/share/rime-data/")
  )


;; 设置哪些组合键将发送至 Rime 。可以用来配合方案中的设置完成光标移动和选字等功能
(setq rime-translate-keybindings
      '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))

(setq rime-posframe-properties
 (list :font "sarasa ui sc"
       :internal-border-width 10))

;； 临时英文模式
(setq rime-disable-predicates
      '(rime-predicate-after-alphabet-char-p ;；在英文字符串之后（必须为以字母开头的英文字符串）
        rime-predicate-prog-in-code-p ;； 在代码的字符串中，不含注释的字符串
	meow-normal-mode-p
	meow-motion-mode-p
	meow-keypad-mode-p
	))

(autoload #'toggle-input-method "rime" nil t)

(global-set-key (kbd "S-SPC") 'toggle-input-method)

(setq default-input-method "rime"
      rime-show-candidate 'posframe)


(with-eval-after-load "rime"
  (define-key rime-active-mode-map [tab] 'rime-inline-ascii)
  (define-key rime-mode-map (kbd "C-`") 'rime-send-keybinding)
  (define-key rime-mode-map (kbd "M-j") 'rime-force-enable))
