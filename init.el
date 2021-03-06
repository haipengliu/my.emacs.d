(add-to-list 'load-path "~/.emacs.d")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-org" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(require 'cc-mode)
(setq c-default-style "gnu")
(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET
;; whitespace-cleanup when startup
;;(whitespace-global-modes nil)
;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; use space to indent by default
(setq-default indent-tabs-mode nil)
;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 2)


(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(require 'window-numbering)
(window-numbering-mode 1)

(require 'flymake)
(flymake-mode-on)

(require 'autopair)
(autopair-global-mode)

(require 'buffer-stack)
(require 'buffer-utils)

(require 'indent-guide)
(indent-guide-global-mode)
(set-face-background 'indent-guide-face "dimgray")
(setq indent-guide-char ".")

(require 'helm)
(require 'helm-config)
(helm-mode 1)
;; helm-projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; helm-semantic-or-imenu
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

;; helm-mini
;;(global-set-key (kbd "C-x b") 'helm-mini)
(global-unset-key (kbd "C-x b"))
(global-set-key (kbd "C-x b") 'helm-mini)
(global-unset-key (kbd "C-x C-f"))
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
	helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))


(require 'expand-region)
(define-key global-map (kbd "C-=") 'er/expand-region)

(require 'ido)
(ido-mode 1)

(require 'ace-jump-buffer)

(require 'flycheck)
(flycheck-mode 1)

;;(require 'helm-gtags)
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; customized personal global key bindings
(define-key global-map (kbd "C-c m") 'iedit-mode)
(define-key global-map (kbd "C-c j") 'goto-line)


;; smart parens
(show-paren-mode 1)

(require 'save-visited-files)
(turn-on-save-visited-files-mode)

(desktop-save-mode 1)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(package-selected-packages
   (quote
    (multiple-cursors comment-dwim-2 atom-one-dark-theme dracula-theme web-mode yasnippet smex smartparens save-visited-files rebox2 readline-complete indent-guide iedit helm-projectile helm-gtags helm-dictionary ggtags function-args flymake-cppcheck flycheck expand-region color-theme-solarized color-theme-sanityinc-solarized buffer-utils buffer-stack autopair auto-complete ace-jump-buffer))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(contrl tab)] 'moo-complete)
;; (define-key c++-mode-map  [(control tab)] 'moo-complete)
;; (define-key c-mode-map (kbd "M-o")  'fa-show)
;; (define-key c++-mode-map (kbd "M-o")  'fa-show)

;;folding
;;C-c @ C-c   hs-toggle-hiding
;;C-c @ C-h   hs-hide-block
;;C-c @ C-l   hs-hide-level
;;C-c @ C-s   hs-show-block
;;C-c @ C-M-h hs-hide-all
;;C-c @ C-M-s hs-show-all
(add-hook 'c-mode-common-hook   'hs-minor-mode)

;; turn on semantic
;;(semantic-mode t)
;; (defun my:add-semantic-to-autocomplete()
;;   (add-to-list 'ac-sources 'ac-sources-semantic)
;;  )
;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;;rebox2
(require 'rebox2)
(setq rebox-style-loop '(24 16))
(define-key global-map (kbd "M-q") 'rebox-dwim)
(define-key global-map (kbd "M-u") 'rebox-cycle)
;;(global-set-key (kbd "M-m m") 'rebox-dwim)
;;(global-set-key (kbd "M-m u") 'rebox-cycle)
;;sets comments to use "/* ... */" style in c++-mode
;;adds Doxygen box style for C++
(defun my-rebox-setup ()
  (setq comment-start "/* "
        comment-end " */")
        (unless (memq 46 rebox-style-loop)
         (make-local-variable 'rebox-style-loop)
         (nconc rebox-style-loop '(46))))
(add-hook 'c++-mode-common-hook 'my-rebox-setup)
(add-hook 'c-mode-common-hook 'my-rebox-setup)

(require 'readline-complete)
(add-to-list 'ac-modes 'shell-mode)
(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)

;; (setq
;;   ;; use gdb-many-windows by default
;;   gdb-many-windows t

;;    ;; Non-nil means display source file containing the main routine at startup
;;    gdb-show-main t
;; )

(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
(setq comint-process-echoes t)

;;(require 'company)
;;(add-hook 'after-init-hook 'global-company-mode)

(require 'eldoc)
(eldoc-mode 1)

;; org mode auto-newline
(add-hook `org-mode-hook ( lambda () (setq truncate-lines nil)))


;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; customize

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)


