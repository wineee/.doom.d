;;; lisp/init-better-defaults.el -*- lexical-binding: t; -*-

;; 设置一个别名将其简化为只输入 (y or n)
(fset 'yes-or-no-p 'y-or-n-p)

;; 其他编辑器修 改文件后，自动从硬盘加载
(global-auto-revert-mode t)

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
(set-frame-parameter nil 'alpha-background 90)
(defun rew/toggle-frame-transparency()
  "在 100（不透明）和 90（部分透明）之间切换背景透明度。"
  (interactive)
  (let ((current-alpha (frame-parameter nil 'alpha-background)))
    (set-frame-parameter nil 'alpha-background
                        (if (= (or current-alpha 100) 100) 90 100))))

;; 绑定到快捷键，例如 C-c t
(global-set-key (kbd "C-c t") 'toggle-transparency)

(provide 'init-better-defaults)
