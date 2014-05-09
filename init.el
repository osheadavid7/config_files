;;------------Set package archives---------------------
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-yasnippet
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic))

;---------------------required packages
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(add-to-list 'load-path "~/clones/config_files/emacs_packages/")
(add-to-list 'load-path "~/clones/config_files/emacs_packages/auto-complete-1.3.1/")

;---------------------add git wip
(load "~/clones/config_files/git-wip/emacs/git-wip.el")
(package-initialize)


;For some reason, these have to go here. After loading more packages they get forgotten!!
(setq TeX-PDF-mode t)
(setq TeX-view-program-selection
      '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "okular %o")))
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

(require 'package)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-auctex)
(ac-config-default)
(require 'ac-math) 

(setq ac-math-unicode-in-math-p t)



(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

 (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)
;;(setq ispell-program-name "/usr/share/emacs/24.3/lisp/textmodes/ispell.el")
(require 'python)

;; If you use tex-mode
(require 'tex-mode)`
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
