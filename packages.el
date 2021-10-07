;; -*- nob :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("org"   . "http://elpa.emacs-china.org/org/")))

(package! hungry-delete)


(when (package! eaf :recipe (:host github
                       :repo "emacs-eaf/emacs-application-framework"
                       :files ("*.el" "*.py" "core" "extension" "*.json")
                       :build (:not compile)))

    (package! epc)
    (package! ctable)
    (package! deferred)

    ;;(package! eaf-browser :recipe (:host github :repo "emacs-eaf/eaf-browser" :files ("*")))
    ;;(package! eaf-pdf-viewer :recipe (:host github :repo "emacs-eaf/eaf-pdf-viewer" :files ("*")))
    ;;(package! eaf-video-player :recipe (:host github :repo "emacs-eaf/eaf-video-player" :files ("*")))
    ;;(package! eaf-image-viewer :recipe (:host github :repo "emacs-eaf/eaf-image-viewer" :files ("*")))
    ;;(package! eaf-netease-cloud-music :recipe (:host github :repo "emacs-eaf/eaf-netease-cloud-music" :files ("*")))
)
