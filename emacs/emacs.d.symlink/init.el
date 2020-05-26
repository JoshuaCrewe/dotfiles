;; For reference https://github.com/aaronbieber/dotfiles/blob/master/configs/emacs.d/init.el
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Essential settings.
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

 (unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))

(eval-when-compile
   (require 'use-package))

;; (use-package doom-themes
  ;; :ensure t
  ;; :config
  ;; (load-theme 'doom-one t)
  ;; )

(use-package seoul256-theme
  :config
  (setq seoul256-background 236)
  :ensure t)

(use-package helm
  :ensure t)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

    (require 'evil-unimpaired)
  )


 (use-package org
   :ensure t
   :config
   (setq org-agenda-files '("~/Downloads/org/"))
   (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED"))))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme))))
(use-package php-mode
  :ensure t)

(local-set-key (kbd "C-c C-f") 'org-table-calc-current-TBLFM)

(defun air-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(define-key global-map (kbd "C-c t a") 'air-pop-to-org-agenda)

(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

(define-key evil-normal-state-map (kbd "C-s") 'save-buffer)
(define-key evil-insert-state-map (kbd "C-s") 'save-buffer)

;; PACKAGES

;; Distraction Free Writing in emacs
;; https://github.com/joostkremers/writeroom-mode

(use-package writeroom-mode
  :ensure t
  :defer t
  )

;; Magit ?
(use-package magit
  :ensure t
  :defer t
  )
(use-package evil-magit
  :ensure t
  )

;; Emmet
(use-package emmet-mode
  :ensure t
  :commands emmet-mode)

;; Asyncrounous Linting

;; Surround
(use-package evil-surround
  :ensure t
  )

;; ragtag

;; Hide highlights after search

;; Auto add comments to start of line
;; (use-package evil-nerd-commenter
  ;; :ensure t
  ;; :config
  ;; (evilnc-default-hotkeys)
  ;; )

;; vim-lion - formatting text ?

;; Snippets
;; yasnippet -  https://github.com/joaotavora/yasnippet

;; Relative line numbers ?
;; https://github.com/coldnew/linum-relative

;; Rainbow mode

;; Git gutter

;; Syntax highlighting - scss, css3, javascript, html5, php, twig, blade, handlebars, ruby

;; SETTINGS

;; Relative numbers

;; Highlight search results

;; BINDINGS

;; Open file explorer with -

;; Copy Paste with leader p

;; Switch between emacs splits and tmux panes with <c-hjkl>
;; https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode?utm_content=buffer73792&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer

;; Save with <c-s>

;; Switch buffers with <space><space>

;; Create text objects
;; - af ( A File )
;; - av ( A Value )

;; Quick load / edit init.el <leader>init <leader>r

;; Update plugins globally

;; Search files with <RET>
;; Search project with Ag <leader>ag
;; Search buffers with <leader><RET>

;; Zero will go to the start of the content first and then the very start

;; Give an indication when a line is more than 80 coumns long

;; auto close brakcets on return sometimes

;; Make Ctrl-e jump to the end of the line in the insert mode.

;; Stay in visual mode when indenting.

;; Quickly select the text I just pasted. gV

;; Copy the selected text into the clipboard. <leader>y

;; Move visual block J K

;; Cursor on word and use cn to change and the dot command to repeat. `cn
;; Visually select, cn to change and dot to repeat.

(font-lock-add-keywords 'javascript-mode
  '(("console" . font-lock-comment-face)))
(add-hook 'c-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\)." 1
                    font-lock-warning-face t)))))


(defun windmove-emacs-or-tmux(dir tmux-cmd)
  (interactive)
  (if (ignore-errors (funcall (intern (concat "windmove-" dir))))
     nil                       ;; Moving within emacs
     (shell-command tmux-cmd)) ;; At edges, send command to tmux
)

; Move between windows with custom keybindings
; https://gist.github.com/nathanlippi/5923326
(global-set-key (kbd "C-k") 
  '(lambda () (interactive) (windmove-emacs-or-tmux "up"  "tmux select-pane -U")))
(global-set-key (kbd "C-j") 
  '(lambda () (interactive) (windmove-emacs-or-tmux "down"  "tmux select-pane -D")))
(global-set-key (kbd "C-l") 
  '(lambda () (interactive) (windmove-emacs-or-tmux "right" "tmux next-window")))
(global-set-key (kbd "C-h") 
'(lambda () (interactive) (windmove-emacs-or-tmux "left" "tmux previous-window")))
