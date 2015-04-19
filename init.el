(add-to-list 'load-path "~/.emacs.d")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

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
(setq indent-guide-char "|")

(require 'helm)
(require 'helm-config)

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
(define-key global-map (kbd "C-c m") 'iedit-mode)
(define-key global-map (kbd "C-c j") 'goto-line)


;; smart parens
(show-paren-mode 1)
