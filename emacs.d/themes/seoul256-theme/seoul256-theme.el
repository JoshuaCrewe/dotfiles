;;; seoul256-theme.el --- Low-contrast color scheme based on Seoul Colors.

;; Copyright (C) 2016 Anand Iyer

;; Author: Anand Iyer <anand.ucb@gmail.com>
;; Maintainer: Anand Iyer <anand.ucb@gmail.com>
;; URL: http://github.com/anandpiyer/seoul256-emacs
;; Package-Version: 20170320.1311
;; Created: 21 October 2016
;; Version: 0.3.2
;; Keywords: theme
;; Package-Requires: ((emacs "24.3"))

;;; MIT License
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Commentary:

;; A port of the Seoul256 color scheme to Emacs.
;;
;; This port contains some modifications, partly due to the differences
;; ih customization flexibility offered by Emacs and Vim.  However, I have
;; tried to stay true to the original as much as possible.

;;; Credits:

;; Junegunn Choi created the original theme for Vim on which this port is based.

;;; Code:

(require 'cl-lib)

(when (version< emacs-version "24.3")
  (error "Requires Emacs 24.3 or later"))

(defgroup seoul256 nil
  "seoul256 theme"
  :group 'faces)

(defcustom seoul256-background 237
  "Background color for seoul256 scheme."
  :type 'number
  :group 'seoul256)

(defcustom seoul256-alternate-background 253
  "Alternate background color for seoul256 scheme."
  :type 'number
  :group 'seoul256)

(deftheme seoul256 "Low-contrast color scheme based on Seoul Colors")

(defvar seoul256-default-colors-alist
  '(
          ( 16 . "#000000" )  ( 17 . "#00005f" )  ( 18 . "#000087" )
          ( 19 . "#0000af" )  ( 20 . "#0000d7" )  ( 21 . "#0000ff" )
          ( 22 . "#005f00" )  ( 23 . "#005f5f" )  ( 24 . "#005f87" )
          ( 25 . "#005faf" )  ( 26 . "#005fd7" )  ( 27 . "#005fff" )
          ( 28 . "#008700" )  ( 29 . "#00875f" )  ( 30 . "#008787" )
          ( 31 . "#0087af" )  ( 32 . "#0087d7" )  ( 33 . "#0087ff" )
          ( 34 . "#00af00" )  ( 35 . "#00af5f" )  ( 36 . "#00af87" )
          ( 37 . "#00afaf" )  ( 38 . "#00afd7" )  ( 39 . "#00afff" )
          ( 40 . "#00d700" )  ( 41 . "#00d75f" )  ( 42 . "#00d787" )
          ( 43 . "#00d7af" )  ( 44 . "#00d7d7" )  ( 45 . "#00d7ff" )
          ( 46 . "#00ff00" )  ( 47 . "#00ff5f" )  ( 48 . "#00ff87" )
          ( 49 . "#00ffaf" )  ( 50 . "#00ffd7" )  ( 51 . "#00ffff" )
          ( 52 . "#5f0000" )  ( 53 . "#5f005f" )  ( 54 . "#5f0087" )
          ( 55 . "#5f00af" )  ( 56 . "#5f00d7" )  ( 57 . "#5f00ff" )
          ( 58 . "#5f5f00" )  ( 59 . "#5f5f5f" )  ( 60 . "#5f5f87" )
          ( 61 . "#5f5faf" )  ( 62 . "#5f5fd7" )  ( 63 . "#5f5fff" )
          ( 64 . "#5f8700" )  ( 65 . "#5f875f" )  ( 66 . "#5f8787" )
          ( 67 . "#5f87af" )  ( 68 . "#5f87d7" )  ( 69 . "#5f87ff" )
          ( 70 . "#5faf00" )  ( 71 . "#5faf5f" )  ( 72 . "#5faf87" )
          ( 73 . "#5fafaf" )  ( 74 . "#5fafd7" )  ( 75 . "#5fafff" )
          ( 76 . "#5fd700" )  ( 77 . "#5fd75f" )  ( 78 . "#5fd787" )
          ( 79 . "#5fd7af" )  ( 80 . "#5fd7d7" )  ( 81 . "#5fd7ff" )
          ( 82 . "#5fff00" )  ( 83 . "#5fff5f" )  ( 84 . "#5fff87" )
          ( 85 . "#5fffaf" )  ( 86 . "#5fffd7" )  ( 87 . "#5fffff" )
          ( 88 . "#870000" )  ( 89 . "#87005f" )  ( 90 . "#870087" )
          ( 91 . "#8700af" )  ( 92 . "#8700d7" )  ( 93 . "#8700ff" )
          ( 94 . "#875f00" )  ( 95 . "#875f5f" )  ( 96 . "#875f87" )
          ( 97 . "#875faf" )  ( 98 . "#875fd7" )  ( 99 . "#875fff" )
         ( 100 . "#878700" ) ( 101 . "#87875f" ) ( 102 . "#878787" )
         ( 103 . "#8787af" ) ( 104 . "#8787d7" ) ( 105 . "#8787ff" )
         ( 106 . "#87af00" ) ( 107 . "#87af5f" ) ( 108 . "#87af87" )
         ( 109 . "#87afaf" ) ( 110 . "#87afd7" ) ( 111 . "#87afff" )
         ( 112 . "#87d700" ) ( 113 . "#87d75f" ) ( 114 . "#87d787" )
         ( 115 . "#87d7af" ) ( 116 . "#87d7d7" ) ( 117 . "#87d7ff" )
         ( 118 . "#87ff00" ) ( 119 . "#87ff5f" ) ( 120 . "#87ff87" )
         ( 121 . "#87ffaf" ) ( 122 . "#87ffd7" ) ( 123 . "#87ffff" )
         ( 124 . "#af0000" ) ( 125 . "#af005f" ) ( 126 . "#af0087" )
         ( 127 . "#af00af" ) ( 128 . "#af00d7" ) ( 129 . "#af00ff" )
         ( 130 . "#af5f00" ) ( 131 . "#af5f5f" ) ( 132 . "#af5f87" )
         ( 133 . "#af5faf" ) ( 134 . "#af5fd7" ) ( 135 . "#af5fff" )
         ( 136 . "#af8700" ) ( 137 . "#af875f" ) ( 138 . "#af8787" )
         ( 139 . "#af87af" ) ( 140 . "#af87d7" ) ( 141 . "#af87ff" )
         ( 142 . "#afaf00" ) ( 143 . "#afaf5f" ) ( 144 . "#afaf87" )
         ( 145 . "#afafaf" ) ( 146 . "#afafd7" ) ( 147 . "#afafff" )
         ( 148 . "#afd700" ) ( 149 . "#afd75f" ) ( 150 . "#afd787" )
         ( 151 . "#afd7af" ) ( 152 . "#afd7d7" ) ( 153 . "#afd7ff" )
         ( 154 . "#afff00" ) ( 155 . "#afff5f" ) ( 156 . "#afff87" )
         ( 157 . "#afffaf" ) ( 158 . "#afffd7" ) ( 159 . "#afffff" )
         ( 160 . "#d70000" ) ( 161 . "#d7005f" ) ( 162 . "#d70087" )
         ( 163 . "#d700af" ) ( 164 . "#d700d7" ) ( 165 . "#d700ff" )
         ( 166 . "#d75f00" ) ( 167 . "#d75f5f" ) ( 168 . "#d75f87" )
         ( 169 . "#d75faf" ) ( 170 . "#d75fd7" ) ( 171 . "#d75fff" )
         ( 172 . "#d78700" ) ( 173 . "#d7875f" ) ( 174 . "#d78787" )
         ( 175 . "#d787af" ) ( 176 . "#d787d7" ) ( 177 . "#d787ff" )
         ( 178 . "#d7af00" ) ( 179 . "#d7af5f" ) ( 180 . "#d7af87" )
         ( 181 . "#d7afaf" ) ( 182 . "#d7afd7" ) ( 183 . "#d7afff" )
         ( 184 . "#d7d700" ) ( 185 . "#d7d75f" ) ( 186 . "#d7d787" )
         ( 187 . "#d7d7af" ) ( 188 . "#d7d7d7" ) ( 189 . "#d7d7ff" )
         ( 190 . "#d7ff00" ) ( 191 . "#d7ff5f" ) ( 192 . "#d7ff87" )
         ( 193 . "#d7ffaf" ) ( 194 . "#d7ffd7" ) ( 195 . "#d7ffff" )
         ( 196 . "#ff0000" ) ( 197 . "#ff005f" ) ( 198 . "#ff0087" )
         ( 199 . "#ff00af" ) ( 200 . "#ff00d7" ) ( 201 . "#ff00ff" )
         ( 202 . "#ff5f00" ) ( 203 . "#ff5f5f" ) ( 204 . "#ff5f87" )
         ( 205 . "#ff5faf" ) ( 206 . "#ff5fd7" ) ( 207 . "#ff5fff" )
         ( 208 . "#ff8700" ) ( 209 . "#ff875f" ) ( 210 . "#ff8787" )
         ( 211 . "#ff87af" ) ( 212 . "#ff87d7" ) ( 213 . "#ff87ff" )
         ( 214 . "#ffaf00" ) ( 215 . "#ffaf5f" ) ( 216 . "#ffaf87" )
         ( 217 . "#ffafaf" ) ( 218 . "#ffafd7" ) ( 219 . "#ffafff" )
         ( 220 . "#ffd700" ) ( 221 . "#ffd75f" ) ( 222 . "#ffd787" )
         ( 223 . "#ffd7af" ) ( 224 . "#ffd7d7" ) ( 225 . "#ffd7ff" )
         ( 226 . "#ffff00" ) ( 227 . "#ffff5f" ) ( 228 . "#ffff87" )
         ( 229 . "#ffffaf" ) ( 230 . "#ffffd7" ) ( 231 . "#ffffff" )
         ( 232 . "#080808" ) ( 233 . "#121212" ) ( 234 . "#1c1c1c" )
         ( 235 . "#262626" ) ( 236 . "#303030" ) ( 237 . "#3a3a3a" )
         ( 238 . "#444444" ) ( 239 . "#4e4e4e" ) ( 240 . "#585858" )
         ( 241 . "#626262" ) ( 242 . "#6c6c6c" ) ( 243 . "#767676" )
         ( 244 . "#808080" ) ( 245 . "#8a8a8a" ) ( 246 . "#949494" )
         ( 247 . "#9e9e9e" ) ( 248 . "#a8a8a8" ) ( 249 . "#b2b2b2" )
         ( 250 . "#bcbcbc" ) ( 251 . "#c6c6c6" ) ( 252 . "#d0d0d0" )
         ( 253 . "#dadada" ) ( 254 . "#e4e4e4" ) ( 255 . "#eeeeee" ) 
  ))

(defvar seoul256-override-colors-alist
  '()
  "Use this alist to override the theme's default colors.")

(defvar seoul256-colors-alist
  (append seoul256-default-colors-alist seoul256-override-colors-alist))

(defvar seoul256-current-bg nil
  "Current background used by seoul256 theme.")

(defun seoul256-apply (theme style dark-fg light-fg dark-bg light-bg)
  "Apply theme THEME, a STYLE variant of seoul256 theme using DARK-FG, LIGHT-FG, DARK-BG and LIGHT-BG as main colors."
  (cl-flet ((hex (dark light)
                 (let ((color-id dark))
                   (when (string= style "light")
                     (setq color-id light))
                   (cdr (assoc color-id seoul256-colors-alist)))))

    (custom-theme-set-faces
     theme

     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;;;; in-built
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;; basic ui
     '(button                       ((t (:underline t))))
     `(cursor                       ((t (:background ,(hex light-bg dark-bg)))))
     `(default                      ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(fringe                       ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex (- dark-bg 1) (- light-bg 1))))))
     `(header-line                  ((t (:foreground ,(hex 256 16)))))
     `(highlight                    ((t (:background ,(hex (- dark-bg 1) (- light-bg 1))))))
     `(hl-line                      ((t (:background ,(hex (- dark-bg 1) (- light-bg 1))))))
     `(isearch                      ((t (:foreground ,(hex 220 125) :background ,(hex (+ dark-bg 1) 238)))))
     `(isearch-lazy-highlight-face  ((t (:inherit match))))
     `(isearch-fail                 ((t (:foreground ,(hex 196 196) :background ,(hex (+ dark-bg 3) 253)))))
     `(link                         ((t (:foreground ,(hex 73 23)))))
     `(link-visited                 ((t (:foreground ,(hex 72 22)))))
     `(linum                        ((t (:foreground ,(hex 101 101) :background ,(hex (+ dark-bg 1) (- light-bg 2))))))
     `(match                        ((t (:foreground ,(hex dark-fg 255) :background ,(hex 24 74)))))
     `(minibuffer-prompt            ((t (:foreground ,(hex 74 24) :weight bold))))
     `(region                       ((t (:background ,(hex 23 152)))))

     ;; font-lock
     `(font-lock-builtin-face            ((t (:foreground ,(hex 179 94)))))
     `(font-lock-comment-delimiter-face  ((t (:foreground ,(hex 65 65)))))
     `(font-lock-comment-face            ((t (:foreground ,(hex 65 65)))))
     `(font-lock-constant-face           ((t (:foreground ,(hex 255 255)))))
     `(font-lock-doc-face                ((t (:inherit font-lock-comment-face))))
     `(font-lock-function-name-face      ((t (:foreground ,(hex 187 58)))))
     `(font-lock-keyword-face            ((t (:foreground ,(hex 179 94)))))
     `(font-lock-preprocessor-face       ((t (:foreground ,(hex 143 58)))))
     `(font-lock-string-face             ((t (:foreground ,(hex 109 30)))))
     `(font-lock-type-face               ((t (:foreground ,(hex 217 96)))))
     `(font-lock-variable-name-face      ((t (:foreground ,(hex 173 131)))))
     `(font-lock-warning-face            ((t (:foreground ,(hex 52 174) :weight bold))))

     ; `(css-selector            ((t (:foreground ,(hex 73 23)))))
     `(css-property            ((t (:foreground ,(hex 179 94)))))
     `(web-mode-css-property-name-face            ((t (:foreground ,(hex 179 94)))))
     `(web-mode-css-selector-face            ((t (:foreground ,(hex 108 66)))))

     ;; ido-mode
     `(ido-first-match  ((t (:inherit isearch))))

     ;; mode-line
     `(mode-line            ((t (:foreground ,(hex 187 187) :background ,(hex 95 95) :height 0.95))))
     `(mode-line-buffer-id  ((t (:foreground ,(hex 230 230)))))
     `(mode-line-emphasis   ((t (:foreground ,(hex 256 256) :slant italic))))
     `(mode-line-highlight  ((t (:foreground ,(hex 228 228)))))
     `(mode-line-inactive   ((t (:foreground ,(hex (+ dark-bg 2) (- light-bg 2)) :background ,(hex 238 238)))))

     ;; show-paren
     `(show-paren-match     ((t (:foreground ,(hex 226 200) :background ,(hex (+ dark-bg 1) (- light-bg 3)) :weight bold :underline t))))
     `(show-paren-mismatch  ((t (:foreground ,(hex 226 226) :background ,(hex 196 196)) :weight bold)))

     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;;;; package-specific
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;; company
     `(company-preview                       ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(company-preview-common                ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(company-preview-search                ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(company-scrollbar-bg                  ((t (:background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(company-scrollbar-fg                  ((t (:background ,(hex (- dark-bg 2) (- light-bg 6))))))
     `(company-tooltip                       ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(company-tooltip-annotation            ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(company-tooltip-annotation-selection  ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(company-tooltip-common                ((t (:foreground ,(hex 226 32)))))
     `(company-tooltip-common-selection      ((t (:inherit company-tooltip-common))))
     `(company-tooltip-mouse                 ((t (:foreground ,(hex 226 32)))))
     `(company-tooltip-search                ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(company-tooltip-search-selection      ((t (:inherit company-tooltip-search))))
     `(company-tooltip-selection             ((t (:foreground ,(hex 226 32) :background ,(hex 23 152)))))

     ;; git-gutter
     `(git-gutter:added     ((t (:foreground ,(hex 108 65) :background ,(hex (+ dark-bg 1) (- light-bg 2)) :weight bold))))
     `(git-gutter:deleted   ((t (:foreground ,(hex 161 161) :background ,(hex (+ dark-bg 1) (- light-bg 2)) :weight bold))))
     `(git-gutter:modified  ((t (:foreground ,(hex 68 68) :background ,(hex (+ dark-bg 1) (- light-bg 2)) :weight bold))))

     ;; helm
     `(helm-buffer-directory    ((t (:foreground ,(hex 66 116)))))
     `(helm-buffer-file         ((t (:foreground ,(hex 108 66)))))
     `(helm-buffer-not-saved    ((t (:foreground ,(hex 16 16)))))
     `(helm-buffer-process      ((t (:foreground ,(hex (+ dark-bg 9) (- light-bg 9))))))
     `(helm-buffer-saved-out    ((t (:foreground ,(hex 16 16)))))
     `(helm-buffer-size         ((t (:inherit helm-buffer-process))))
     `(helm-candidate-number    ((t (:background unspecified))))
     `(helm-ff-directory        ((t (:foreground ,(hex 66 116)))))
     `(helm-ff-file             ((t (:foreground ,(hex 108 66)))))
     `(helm-ff-symlink          ((t (:foreground ,(hex 73 23)))))
     `(helm-ff-invalid-symlink  ((t (:inherit helm-ff-symlink :underline (:style wave)))))
     `(helm-ff-prefix           ((t (:foreground ,(hex 66 16)))))
     ;;`(helm-match               ((t (:inherit isearch))))
     ;;`(helm-match               ((t (:foreground ,(hex 65 65)))))
     ;;`(helm-match-item          ((t (:foreground ,(hex 108 66) :weight bold))))
     `(helm-source-header       ((t (:foreground ,(hex 168 168) :weight bold))))
     `(helm-selection           ((t (:inherit hl-line))))
     `(helm-selection-line      ((t (:inherit helm-selection))))

     ;; highlight-indent-guides
     `(highlight-indent-guides-odd-face  ((t (:background ,(hex (- dark-bg 1) (+ light-bg 1))))))
     `(highlight-indent-guides-even-face ((t (:background ,(hex (+ dark-bg 1) (- light-bg 1))))))

     ;; ivy
     `(ivy-current-match            ((t (:inherit hl-line))))
     `(ivy-minibuffer-match-face-1  ((t (:inherit ivy-current-match))))
     `(ivy-minibuffer-match-face-2  ((t (:inherit isearch))))
     `(ivy-minibuffer-match-face-3  ((t (:inherit isearch))))
     `(ivy-minibuffer-match-face-4  ((t (:inherit isearch))))

     ;; linum-relative
     `(linum-relative-current-face   ((t (:foreground ,(hex 131 131) :background ,(hex (- dark-bg 1) (- light-bg 1)) :weight bold))))

     ;; smart-mode-line
     `(sml/filename ((t (:foreground ,(hex 187 230) :weight bold))))

     ;; smart-parens
     `(sp-pair-overlay-face        ((t (:background ,(hex (+ dark-bg 3) (- light-bg 3))))))
     `(sp-wrap-overlay-face        ((t (:background ,(hex (+ dark-bg 3) (- light-bg 3))))))
     `(sp-wrap-tag-overlay-face    ((t (:background ,(hex (+ dark-bg 3) (- light-bg 3))))))
     `(sp-show-pair-match-face     ((t (:foreground ,(hex 226 200) :background ,(hex (+ dark-bg 1) (- light-bg 3)) :weight bold))))
     `(sp-show-pair-mismatch-face  ((t (:foreground ,(hex 226 226) :background ,(hex 196 196) :weight bold)))))))

(defun seoul256-create (theme background)
  "Create a seoul256 theme THEME using a given BACKGROUND."
  (let ((dark-bg 237)
        (light-bg 253)
        (dark-fg 252)
        (light-fg 239)
        (style "dark"))

    (when (and (>= background 233)
               (<= background 239))
      (setq style "dark"
            dark-bg background))

    (when (and (>= background 252)
               (<= background 256))
      (setq style "light"
            light-bg background))

    (if (string= style "dark")
        (setq seoul256-current-bg dark-bg)
      (setq seoul256-current-bg light-bg))

    (seoul256-apply theme style dark-fg light-fg dark-bg light-bg)))

(defun seoul256-switch-background ()
  "Switch the background of the current seoul256 theme."
  (interactive)
  (if (= seoul256-current-bg seoul256-alternate-background)
      (seoul256-create 'seoul256 seoul256-background)
    (seoul256-create 'seoul256 seoul256-alternate-background)))

(seoul256-create 'seoul256 seoul256-background)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'seoul256)
;; Local Variables:
;; fill-column: 99
;; End:

;;; seoul256-theme.el ends here
