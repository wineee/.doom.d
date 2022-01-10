;;; private/blog/config.el -*- lexical-binding: t; -*-

;; https://github.com/masasam/emacs-easy-hugo
(use-package easy-hugo
  :init
  (setq easy-hugo-basedir "~/HUGO_blog/")
  (setq easy-hugo-url "https://wineee.github.io")
  ;(setq easy-hugo-sshdomain "blogdomain")
  (setq easy-hugo-root "/home/blog/")
  (setq easy-hugo-previewtime "300")
  :bind ("C-c C-e" . easy-hugo))
