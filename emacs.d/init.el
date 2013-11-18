(require 'package)
(require 'cl)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(ac-nrepl
                      auto-complete
                      autopair
                      clojure-mode
                      clojure-test-mode
                      clojurescript-mode
                      color-theme
                      color-theme-sanityinc-tomorrow
                      ctags
                      exec-path-from-shell
                      evil
                      evil-paredit
                      markdown-mode
                      paredit
                      rainbow-delimiters
                      starter-kit
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-lisp
                      starter-kit-ruby
                      ruby-end
                      surround
                      undo-tree)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))

(load-theme 'sanityinc-tomorrow-night t nil)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

(remove-hook 'prog-mode-hook 'idle-highlight-mode)
