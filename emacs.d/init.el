(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

(require 'cl)

(progn (cd "~/.emacs.d") (normal-top-level-add-subdirs-to-load-path))

(defvar autosave-dir
   (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
  (make-directory autosave-dir t)
  (setq auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat
  autosave-dir "\\1") t)))

(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
  (setq backup-directory-alist (list (cons "." backup-dir)))

(autoload 'run-ruby "inf-ruby"
      "Run an inferior Ruby process")
    (autoload 'inf-ruby-keys "inf-ruby"
      "Set local key defs for inf-ruby in ruby-mode")
    (auto-fill-mode)
    (add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)))

(global-set-key "\C-x !" 'shell)
(global-set-key "\C-x x" 'send-to-buffer) ;; copies from top buffer to bottom
(fset 'send-to-buffer "\C-@\C-[\C-f\C-e\C-[w\C-xo\C-y\C-m\C-xo\C-e\C-[OC")