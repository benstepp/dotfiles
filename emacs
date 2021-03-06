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
(evil-leader/set-key "p" 'helm-browse-project)

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
(define-key evil-normal-state-map "\C-u" 'evil-scroll-up)
(define-key evil-normal-state-map "\C-x" 'kill-this-buffer)

;line numbers
(global-linum-mode 1)
(setq linum-format "%d ")
(setq-default left-fringe-width 40)
(setq-default right-fringe-width 40)
(set-face-attribute 'fringe nil :background "black")

;bootyful colors
(require 'molokai-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-ls-git helm molokai-theme evil-rails evil-leader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;follow symlinks 
(setq vc-follow-symlinks nil)
(setq find-file-visit-truename t)

;ctrlp thing
(require 'helm-config)
(require 'helm-ls-git)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
