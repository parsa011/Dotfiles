(menu-bar-mode -1)
(if window-system
    tool-bar-mode -1)
)
(setq-default tab-width 4)
(setq inhibit-startup-message t
        initial-scratch-message "Hello world"
        cursor-type 'bar)

(setq c-default-style "linux"
      c-basic-offset 4
	  indent-tab-mode t)
;; (add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#d3b58d" :background "#041818"))))
 '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:foreground "#3fdflf"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
 '(font-lock-keyword-face ((t (:foreground "white"))))
 '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))
 '(font-lock-warning-face ((t (:foreground "#504038"))))
 '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(widget-field-face ((t (:foreground "white"))) t)
 '(widget-single-line-field-face ((t (:background "darkgray"))) t))

(global-font-lock-mode 1)
(set-cursor-color "lightgreen")
(set-background-color "#072626")
(global-set-key [C-return] 'save-buffer)

(set-face-foreground 'font-lock-builtin-face         "lightgreen")
(setq make-backup-files nil) ; disable emacs backup file

; highlight matching parenthesises
(show-paren-mode 1)
(setq show-paren-delay 0)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)

(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(2048-game omnisharp auto-complete-c-headers auto-complete-clang c-eldoc rust-mode csharp-mode magit)))

