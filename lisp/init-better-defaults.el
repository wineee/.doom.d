;;; lisp/init-better-defaults.el -*- lexical-binding: t; -*-

;; 设置一个别名将其简化为只输入 (y or n)
(fset 'yes-or-no-p 'y-or-n-p)

;; 其他编辑器修 改文件后，自动从硬盘加载
(global-auto-revert-mode t)

;; 开启全局 Company 补全
(global-company-mode 1)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(use-package! emacs
    :config
    (setq display-line-numbers-type 'relative)
    (global-display-line-numbers-mode t))


;; 关闭自动缩进
;; (electric-indent-mode -1)

;;=========================================
;; 分屏
;;=========================================
(global-set-key (kbd "S-<left>") 'split-window-horizontally)
(global-set-key (kbd "S-<down>") 'split-window-below)
(global-set-key (kbd "S-<right>") 'split-window-horizontally)
(global-set-key (kbd "S-<up>") 'split-window-below)

;;修改分屏大小
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; 自动切换透明度
(set-frame-parameter nil 'alpha '(90 . 85))
(defun rew/toggle-frame-transparency ()
  (interactive)
  (if (equal (frame-parameter nil 'alpha) 100)
      (set-frame-parameter nil 'alpha '(90 . 85))
    (set-frame-parameter nil'alpha 100)))

(provide 'init-better-defaults)
