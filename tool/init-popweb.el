(add-subdirs-to-load-path "~/.doom.d/site-lisp/popweb")

(require 'popweb-dict-bing)
(require 'popweb-dict-youdao)

(map! :prefix "t"
      :desc "input youdao dict" :nv ";" #'popweb-dict-youdao-input
      :desc "pointer bing dict" :nv "y" #'popweb-dict-bing-pointer)

(provide 'init-popweb)
