;need packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;vim is best
(require 'evil)
(evil-mode 1)
(evil-ex-define-cmd "Q" 'evil-quit)
(evil-ex-define-cmd "WQ" 'evil-save-and-quit)
(evil-ex-define-cmd "Wq" 'evil-save-and-quit)
(evil-ex-define-cmd "wQ" 'evil-save-and-quit)

;biggest key on the fucking keyboard needs to be used
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "h" 'split-window-below)
(evil-leader/set-key "v" 'split-window-right)

;are these real fucking vim bindings?
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)

;line numbers
(global-linum-mode 1)
(setq linum-format "%d ")
(setq-default left-fringe-width 40)
(setq-default right-fringe-width 40)
(set-face-attribute 'fringe nil :background "black")

;bootyful colors
(require 'molokai-theme)

;fast find stuff
(require 'ido)
(require 'ido-better-flex)
(require 'ido-vertical-mode)
(ido-mode 1)
(setq ido-everywhere 1)
(setq ido-enable-flex-matching 1)
