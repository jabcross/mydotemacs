(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
(define-key input-decode-map (kbd "C-s-i") (kbd "C-<up>"))

(define-key key-translation-map (kbd "s-i") (kbd "<up>"))
(define-key key-translation-map (kbd "s-j") (kbd "<left>"))
(define-key key-translation-map (kbd "s-k") (kbd "<down>"))
(define-key key-translation-map (kbd "s-l") (kbd "<right>"))
(define-key key-translation-map (kbd "s-I") (kbd "S-<up>"))
(define-key key-translation-map (kbd "s-J") (kbd "S-<left>"))
(define-key key-translation-map (kbd "s-K") (kbd "S-<down>"))
(define-key key-translation-map (kbd "s-L") (kbd "S-<right>"))
(define-key key-translation-map (kbd "C-s-i") (kbd "C-<up>"))
(define-key key-translation-map (kbd "C-s-k") (kbd "C-<down>"))
(define-key key-translation-map (kbd "C-s-j") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-s-l") (kbd "C-<right>"))
(define-key key-translation-map (kbd "M-s-i") (kbd "M-<up>"))
(define-key key-translation-map (kbd "M-s-k") (kbd "M-<down>"))
(define-key key-translation-map (kbd "M-s-j") (kbd "M-<left>"))
(define-key key-translation-map (kbd "M-s-l") (kbd "M-<right>"))
(define-key key-translation-map (kbd "C-M-s-i") (kbd "M-s-<up>"))
(define-key key-translation-map (kbd "C-M-s-k") (kbd "M-s-<down>"))
(define-key key-translation-map (kbd "C-M-s-j") (kbd "M-s-<left>"))
(define-key key-translation-map (kbd "C-M-s-l") (kbd "M-s-<right>"))
(define-key key-translation-map (kbd "s-u") (kbd "DEL"))


(global-set-key [M-up] 'scroll-one-down)
(global-set-key [M-up] 'scroll-one-down)
(global-set-key [M-down] 'scroll-one-up)
(global-set-key [M-s-up] 'drag-this-up)
(global-set-key [M-s-down] 'drag-this-down)
(global-set-key [C-return] 'add-line-below)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)


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

(defun add-line-below ()
  (interactive)
  (list
   (move-end-of-line 1)
   (newline 1)
   (indent-for-tab-command)
   )
  )

(require 'fill-column-indicator)

(setq ring-bell-function 'ignore)

(setq-default c-basic-offset 4)

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
