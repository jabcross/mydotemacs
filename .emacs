(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(load-file "~/mydotemacs/uppercut.el")
(load-file "~/.emacs.d/google-c-style.el")


(load-file "/usr/share/emacs/site-lisp/git/git.el")
(load-file "/usr/share/emacs/site-lisp/git/git-blame.el")
(require 'git)
(require 'git-blame)

(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "M-x") 'helm-M-x)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)

(setq-default default-tab-width 4
			  c-default-style "linux"
			  c-basic-offset 4)

(global-subword-mode 1)
(column-number-mode 1)
(helm-mode 1)

(put 'flycheck-gcc-args 'safe-local-variabe (lambda (xx) t))

;;(require 'fill-column-indicator)

(setq ring-bell-function 'ignore)

(load-theme 'misterioso t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("bb4733b81d2c2b5cdec9d89c111ef28a0a8462a167d411ced00a77cfd858def1" "bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" default)))
 '(flycheck-gcc-args nil)
 '(flycheck-gcc-include-path
   (quote
	("/home/pedro/tecban/bios/src/include" "/home/pedro/tecban/bios/src")))
 '(flycheck-gcc-includes nil)
 '(global-flycheck-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
	(powerline anti-zenburn-theme zenburn-theme flycheck-rtags flycheck dumb-jump helm-gtags ggtags helm auto-complete sublimity rust-mode rainbow-delimiters python-mode multiple-cursors minimap list-packages-ext jedi helm-mode-manager helm-make fill-column-indicator auto-indent-mode auto-complete-auctex auctex anaconda-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
