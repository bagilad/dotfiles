;====================================================
;; Package management
;;=====================================================

; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; Initializes the package infrastructure
(package-initialize)
(package-refresh-contents)

;; Install packages that aren't already installed
(defun maybe-install (package)
  "Install PACKAGE if not already installed."
  (unless (package-installed-p package)
    (package-install package)))
;;=====================================================
;; Evil
;;=====================================================
(maybe-install 'evil)
(require 'evil)
(evil-mode 1)

(maybe-install 'evil-collection)
(evil-collectioninit)
;;=====================================================
;; Key bindings
;;=====================================================
(global-set-key (kbd "C-c l") "λ")

;;=====================================================
;; Appearance
;;=====================================================

(maybe-install 'gruvbox-theme)
(load-theme 'gruvbox t)

;; Disable toolbar, menubar and scrollbar
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(setq default-frame-alist '((font . "Menlo-15")
			    (width . 120)
			    (height . 60)
			    (vertical-scroll-bars . nil)
			    (horizontal-scroll-bars . nil)))

(setq-default show-trailing-whitespace t)

;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-14"))

;; Disable startup message window
(setq inhibit-startup-message t)

(global-display-line-numbers-mode)
(setq column-number-mode t)
(setq visible-bell t)

;; Turn blinking cursurs off
(blink-cursor-mode -1)

;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Ensure environment variables inside Emacs look the same as in the shell
(maybe-install 'exec-path-from-shell)
(when (or (daemonp) (memq window-system '(mac ns x)))
  (exec-path-from-shell-initialize))

;; Show matching paren
(show-paren-mode 1)

;; Default is 8
(setq-default tab-width 4)

;; Code completion
(maybe-install 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Ivy
(maybe-install 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; Projectile
(maybe-install 'projectile)
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-completion-system 'ivy)
(projectile-mode +1)

;; Flycheck (syntax checking)
(maybe-install 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Which-key?
(maybe-install 'which-key)
(add-hook 'after-init-hook 'which-key-mode)

;; Rainbow delimiters
(maybe-install 'rainbow-delimiters)
;; Start rainbow delimeters mode automatically in most programming modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Go to definition and back in Elisp
(maybe-install 'elisp-slime-nav)
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))
;;=====================================================
;; Markdown
;;=====================================================
(maybe-install 'markdown-mode)

;;=====================================================
;; Clojure
;;=====================================================

;; clj-kondo (syntax checking via flycheck)
(maybe-install 'flycheck-clj-kondo)
(require 'flycheck-clj-kondo)

;; Cider
(maybe-install 'cider)

(maybe-install 'clj-refactor)
(require 'clj-refactor)
(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

;;=====================================================
;; Python
;;=====================================================
(maybe-install 'elpy)
(elpy-enable)

;; Tell customize to write only to this file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; init.el ends here

