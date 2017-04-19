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

(defun uc-kill-or-cut (n)
  (interactive "p")
  (if (use-region-p)
      (kill-region (region-beginning) (region-end) t)
    (kill-line)
    )
  )

(defun uc-mark-till-end-of-line ()
  (interactive)
  (end-of-line)
  (setq mark-active t)
  )

(defun uc-drag-this (n)
  (interactive "p")
  (let (buff deactivate-mark start end)
    (if (not(use-region-p))
	(list
	 (end-of-line)
	 (push-mark (line-beginning-position))
	)
	)
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

(define-minor-mode uppercut-mode
  "My personal keybindings"
  :global t
  :lighter " uppercut"
  :keymap (let
	      ((map (make-keymap)))
	    (define-key map (kbd "H-o") 'Control-X-prefix)
	    (define-key map (kbd "H-i") (kbd "<up>"))
	    (define-key map (kbd "H-<tab>") (kbd "<tab>"))
	    (define-key map (kbd "H-j") (kbd "<left>"))
	    (define-key map (kbd "H-k") (kbd "<down>"))
	    (define-key map (kbd "H-l") (kbd "<right>"))
	    (define-key map (kbd "H-I") (kbd "S-<up>"))
	    (define-key map (kbd "H-J") (kbd "S-<left>"))
	    (define-key map (kbd "H-K") (kbd "S-<down>"))
	    (define-key map (kbd "H-L") (kbd "S-<right>"))
	    (define-key map (kbd "H-:") 'uc-mark-till-end-of-line)
	    (define-key map (kbd "C-H-i") (kbd "C-<up>"))
	    (define-key map (kbd "C-H-k") (kbd "C-<down>"))
	    (define-key map (kbd "C-H-j") (kbd "C-<left>"))
	    (define-key map (kbd "C-H-l") (kbd "C-<right>"))
	    (define-key map (kbd "M-H-i") 'backward-paragraph)
	    (define-key map (kbd "M-H-k") 'forward-paragraph)
	    (define-key map (kbd "M-H-l") (kbd "M-<right>"))
	    (define-key map (kbd "M-H-j") (kbd "M-<left>"))
	    (define-key map (kbd "C-M-H-i") (kbd "M-H-<up>"))
	    (define-key map (kbd "C-M-H-k") (kbd "M-H-<down>"))
	    (define-key map (kbd "C-M-H-j") (kbd "M-H-<left>"))
	    (define-key map (kbd "C-M-H-l") (kbd "M-H-<right>"))
	    (define-key map (kbd "H-u") 'undo-only)
	    (define-key map (kbd "H-x") 'uc-kill-or-cut)
	    (define-key map (kbd "H-M-x") 'kill-whole-line)
	    (define-key map (kbd "H-y") 'yank)
	    (define-key map (kbd "H-M-y") 'yank-pop)
	    (define-key map (kbd "H-SPC") 'set-mark-command)
	    (define-key map (kbd "H-s") 'uc-scroll-one-up)
	    (define-key map (kbd "H-w") 'uc-scroll-one-down)
	    (define-key map (kbd "H-M-s") 'uc-scroll-many-up)
	    (define-key map (kbd "H-M-w") 'uc-scroll-many-down)
	    ;; (define-key map (kbd "M-<up>") 'uc-scroll-one-down)
	    ;; (define-key map (kbd "M-<down>") 'uc-scroll-one-up)
	    (define-key map (kbd "M-H-<up>") 'uc-drag-this-up)
	    (define-key map (kbd "M-H-<down>") 'uc-drag-this-down)
	    (define-key map (kbd "M-H-I") 'uc-drag-this-up)
            (define-key map (kbd "M-H-K") 'uc-drag-this-down)
	    (define-key map (kbd "M-H-L") (kbd "M-S-<right>"))
	    (define-key map (kbd "M-H-J") (kbd "M-S-<left>"))
            (define-key map (kbd "H-<return>") 'uc-add-line-below)
	    (define-key map (kbd "H-h") 'move-beginning-of-line)
	    (define-key map (kbd "H-;") 'move-end-of-line)
	    map
	    )
  )

(add-hook 'prog-mode-hook 'uppercut-mode)

(provide 'foo-mode)
