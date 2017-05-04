(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(load-file "~/mydotemacs/uppercut.el")
(load-file "~/.emacs.d/google-c-style.el")

(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)
 
(global-subword-mode 1)

;;(require 'fill-column-indicator)

(setq ring-bell-function 'ignore)

(setq-default c-basic-offset 4)

(load-theme 'misterioso t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (egg dumb-jump helm-gtags ggtags helm auto-complete sublimity rust-mode rainbow-delimiters python-mode multiple-cursors minimap list-packages-ext jedi helm-mode-manager helm-make fill-column-indicator auto-indent-mode auto-complete-auctex auctex anaconda-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
