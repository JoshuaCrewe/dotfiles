(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

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

(use-package helm
  :ensure t)

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
    (global-evil-surround-mode)))

(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

;; PACKAGES

;; Distraction Free Writing in emacs
;; https://github.com/joostkremers/writeroom-mode

;; Magit ?

;; Emmet

;; Asyncrounous Linting

;; Surround

;; ragtag

;; Hide highlights after search

;; Auto add comments to start of line

;; vim-lion - formatting text ?

;; Snippets

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
