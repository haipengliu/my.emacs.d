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

(define-key global-map (kbd "C-c m") 'iedit-mode)
(define-key global-map (kbd "C-c j") 'goto-line)

(show-paren-mode 1)
