

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x <down>") 'other-window)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)	

(defun scroll-one-down (n)
  (interactive "p")
  (previous-line n)
  (scroll-down-line n)
  )

(defun scroll-one-up (n)
  (interactive "p")
  (next-line n)
  (scroll-up-line n)
  )

(defun drag-this-up ()
  (interactive)
  (if (use-region-p)
      (let (buff deactivate-mark)
	(setq buff
	      (buffer-substring-no-properties
	       (region-beginning)
	       (region-end)
	       )
	      )
	(delete-region
	 (region-beginning)
	 (region-end)
	 )
	(forward-line -1)
	(push-mark (point))
	(insert buff)
	(setq mark-active t)
	
	)
    (list
     (transpose-lines 1)
     (forward-line -2)))
  )


(defun drag-this-down ()
  (interactive)
  (if (use-region-p)
      (let (buff deactivate-mark)
	(setq buff
	      (buffer-substring-no-properties
	       (region-beginning)
	       (region-end)
	       )
	      )
	(delete-region
	 (region-beginning)
	 (region-end)
	 )
	(forward-line 1)
	(push-mark (point))
	(insert buff)
	(setq mark-active t)
	
	)
    (list
     (forward-line 1)
     (transpose-lines 1)
     (forward-line -1)))
  )



(global-set-key [M-up] 'scroll-one-down)
(global-set-key [M-down] 'scroll-one-up)
(global-set-key [M-s-up] 'drag-this-up)
(global-set-key [M-s-down] 'drag-this-down)

(global-set-key [C-return] (lambda ()
			     (interactive)
			     (list
			      (move-end-of-line 1)
			      (newline 1)
			      (indent-for-tab-command)
			      )
			     )
		)





(require 'fill-column-indicator)

(setq ring-bell-function 'ignore)

(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

(load-theme 'misterioso t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
