(defun uc-scroll-one-down (n)
  (interactive "p")
  ;;(previous-line n)
  (scroll-down-line n)
  )

(defun uc-scroll-one-up (n)  
  (interactive "p")
  ;;  (next-line n)
  (scroll-up-line n)
  )

(defun uc-scroll-many-down (n)
  (interactive "p")
  ;;(previous-line n)
  (scroll-down-line 5)
  )


(defun uc-scroll-many-up (n)
  (interactive "p")
  ;;  (next-line n)
  (scroll-up-line 5)
  )

(defun uc-drag-this (n)
  (interactive "p")
  (if (use-region-p)
      (let (buff deactivate-mark start end)
	(if (< (point) (mark))
	    (list
	     (setq end (mark))
	     (setq start (point))
	     (push-mark start)
	     (goto-char end)
	     )
	  )
	(if (= (point) (line-beginning-position))
	    (left-char 1)
	  )
	(setq end (line-end-position))
	(goto-char (region-beginning))
	(push-mark (line-beginning-position))
	(goto-char end)
	(right-char 1)
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
	(beginning-of-line)
	(forward-line n)
	(beginning-of-line)
	(setq start (point))	 
	(insert buff)
	(left-char 1)
	(setq end (line-end-position))
	(indent-region start end)
	(push-mark start)
	(setq mark-active t)
	)
    (list
     (transpose-lines 1)
     (forward-line -2)))
  )

(defun uc-drag-this-up ()
  (interactive)
  (uc-drag-this -1)
  )

(defun uc-drag-this-down ()
  (interactive)
  (uc-drag-this 1)
  )


(defun uc-add-line-below ()
  (interactive)
  (list
   (move-end-of-line 1)
   (newline 1)
   (indent-for-tab-command)
   )
  )

(define-prefix-command 'uc-prefix)
(define-key uc-prefix (kbd "s-o") 'other-window)

(define-minor-mode uppercut-mode
  "My personal keybindings"
  :lighter " uppercut"
  :keymap (let
	      ((map (make-keymap)))
	    (define-key map (kbd "s-o") 'uc-prefix)
	    (define-key map (kbd "s-i") (kbd "<up>"))
	    (define-key map (kbd "s-<tab>") (kbd "<tab>"))
	    (define-key map (kbd "s-j") (kbd "<left>"))
	    (define-key map (kbd "s-k") (kbd "<down>"))
	    (define-key map (kbd "s-l") (kbd "<right>"))
	    (define-key map (kbd "s-I") (kbd "S-<up>"))
	    (define-key map (kbd "s-J") (kbd "S-<left>"))
	    (define-key map (kbd "s-K") (kbd "S-<down>"))
	    (define-key map (kbd "s-L") (kbd "S-<right>"))
	    (define-key map (kbd "C-s-i") (kbd "C-<up>"))
	    (define-key map (kbd "C-s-k") (kbd "C-<down>"))
	    (define-key map (kbd "C-s-j") (kbd "C-<left>"))
	    (define-key map (kbd "C-s-l") (kbd "C-<right>"))
	    (define-key map (kbd "M-s-i") 'backward-paragraph)
	    (define-key map (kbd "M-s-k") 'forward-paragraph)
	    (define-key map (kbd "M-s-l") (kbd "M-<right>"))
	    (define-key map (kbd "M-s-j") (kbd "M-<left>"))
	    (define-key map (kbd "C-M-s-i") (kbd "M-s-<up>"))
	    (define-key map (kbd "C-M-s-k") (kbd "M-s-<down>"))
	    (define-key map (kbd "C-M-s-j") (kbd "M-s-<left>"))
	    (define-key map (kbd "C-M-s-l") (kbd "M-s-<right>"))
	    (define-key map (kbd "s-u") 'undo-only)
	    (define-key map (kbd "s-x") 'kill-line)
	    (define-key map (kbd "s-M-x") 'kill-whole-line)
	    (define-key map (kbd "s-y") 'yank)
	    (define-key map (kbd "s-SPC") 'set-mark-command)
	    (define-key map (kbd "s-s") 'uc-scroll-one-up)
	    (define-key map (kbd "s-w") 'uc-scroll-one-down)
	    (define-key map (kbd "s-M-s") 'uc-scroll-many-up)
	    (define-key map (kbd "s-M-w") 'uc-scroll-many-down)
	    ;; (define-key map (kbd "M-<up>") 'uc-scroll-one-down)
	    ;; (define-key map (kbd "M-<down>") 'uc-scroll-one-up)
	    (define-key map (kbd "M-s-<up>") 'uc-drag-this-up)
	    (define-key map (kbd "M-s-<down>") 'uc-drag-this-down)
	    (define-key map (kbd "M-s-I") 'uc-drag-this-up)
	    (define-key map (kbd "M-s-K") 'uc-drag-this-down)
	    (define-key map (kbd "s-<return>") 'uc-add-line-below)
	    (define-key map (kbd "s-h") 'move-beginning-of-line)
	    (define-key map (kbd "s-;") 'move-end-of-line)
	    map
	    )
  )

(add-hook 'prog-mode-hook 'uppercut-mode)

(provide 'foo-mode)
