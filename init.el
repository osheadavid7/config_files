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

(load "auctex.el" nil t t)
(add-to-list 'load-path "/home/david/clones/config_files/emacs_packages/")
;(add-to-list 'load-path "/home/david/clones/config_files/emacs_packages/auto-complete-auctex.el")
(add-to-list 'load-path "/home/david/clones/config_files/emacs_packages/auto-complete-1.3.1/")
(load "preview-latex.el" nil t t)
(setq TeX-PDF-mode t)
(setq TeX-view-program-selection
      '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "okular %o")))
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)


(require 'package)
(package-initialize)

(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-auctex)

(ac-config-default)

(require 'ac-math) 
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

 (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)
 
(setq ac-math-unicode-in-math-p t)

