(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" default))
 '(doom-modeline-github t)
 '(doom-modeline-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(meghanada spacemacs-theme org-evil aggressive-indent flycheck lsp-ui helm-company helm-projectile counsel-projectile evil-nerd-commenter counsel ivy-searcher evil-org ivy-fuz dashboard ivy-explorer evil-collection git-gutter lsp-java javap-mode projectile lsp-mode company evil-magit magit helm-icons helm god-mode which-key centaur-tabs treemacs-all-the-icons all-the-icons-ivy treemacs-evil evil doom-modeline doom dracula-theme gnu-elpa)))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "UbuntuMono Nerd Font Mono-12" nil t)


(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)

(require 'doom-modeline)
(require 'treemacs-evil)
(require 'evil)
(require 'which-key)
(require 'centaur-tabs)
(require 'evil-magit)
(require 'company)
(require 'projectile)
(require 'lsp-mode)
(require 'lsp-java)
(require 'git-gutter)
(require 'dashboard)
(require 'org-evil)
;(require 'jdee)
(require 'evil-collection)
(require 'helm-mode)

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (pos) 'read-face-name)
                  (get-char-property (pos) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(with-eval-after-load 'helm
	(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
	(define-key helm-map (kbd "C-z") #'helm-select-action))

(add-hook 'java-mode-hook #'lsp)

(treemacs-git-mode 'deferred)
(helm-projectile-on)
(evil-collection-init)
(dashboard-setup-startup-hook)
(global-git-gutter-mode +1)
(projectile-mode +1)
(doom-modeline-mode 1)
(evil-mode 1)
 (show-paren-mode 1)
(which-key-mode)
(which-key-setup-side-window-bottom)
(helm-icons-enable)
(centaur-tabs-mode t)
(centaur-tabs-headline-match)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'java-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes '(vterm-mode treemacs-mode eshell-mode shell-mode term-mode ansi-term-mode)
  "Major modes on which to disable the linum mode, exempts them from global requirement"
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "turn on line numbers but excempting certain majore modes defined in `display-line-numbers-exempt-modes'"
  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))

(global-display-line-numbers-mode)

(setq centaur-tabs-style "rounded")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-height 38)
(setq centaur-tabs-set-modified-marker t)

(setq-default tab-width 4)

(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)))

(setq projectile-completion-system 'helm)

(centaur-tabs-change-fonts "UbuntuMono Nerd Font Mono" 116)

(define-prefix-command 'my-leader-map)
(evil-define-key 'normal global-map (kbd "SPC") 'my-leader-map)

(electric-indent-mode +1)

(defun my-newline-and-indent-mode-hook ()
  (local-set-key (kbd "RET") (key-binding (kbd "M-j")))
  (local-set-key (kbd "<C-return>") #'electric-indent-just-newline))

(add-hook 'prog-mode-hook #'my-newline-and-indent-mode-hook)


(load "~/.emacs.d/keys.el")
(require 'keys)


(add-hook 'after-init-hook 'global-company-mode)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-type-face ((t (:foreground "#bd93f9" :slant italic)))))
