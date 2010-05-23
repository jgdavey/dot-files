;; Easier Window switching - Command + arrow key
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<left>") 'windmove-left)

;; Better mark setting shortcut
(global-set-key (kbd "M-SPC") 'set-mark-command) ;; was just-one-space