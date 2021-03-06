;;------------Set package archives---------------------
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;------------start server
(server-start)

;;enable clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;------------Set search paths
(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path)
  )


(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-yasnippet
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic))


;---------------------required packages
(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)


;---------------------add git wip
(load "~/clones/config_files/git-wip/emacs/git-wip.el")
(package-initialize)



(require 'reftex)
(require 'package)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-auctex)
(ac-config-default)
(require 'ac-math) 

;Auto complete from Andreas
(global-set-key "\M-/" (make-hippie-expand-function
                              '(try-expand-dabbrev-visible
                                try-expand-dabbrev
                                try-expand-dabbrev-all-buffers
                                try-complete-file-name-partially
                                try-complete-file-name) t))


(setq ispell-program-name "aspell")
(setq ispell-dictionary "british")
(setq ispell-personal-dictionary "~/.ispell-dict-peronal") 
(setq ac-math-unicode-in-math-p t)
(setq reftex-plug-into-AUCTeX t)





(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

;--------------------Set pdflatex options
(require 'tex)
(TeX-global-PDF-mode t)
(setq latex-run-command "pdflatex")
;;(setq TeX-PDF-mode t)
(setq TeX-view-program-selection
      '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "okular %o")))
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("XeLaTeX" "xelatex -interaction=nonstopmode %s"
		    TeX-run-command t t :help "Run xelatex") t))


(setq reftex-default-bibliography '("~/clones/references/ref_shared.bib"))
(defun get-bibtex-keys (file)
  (with-current-buffer (find-file-noselect file)
    (mapcar 'car (bibtex-parse-keys))))

(defun LaTeX-add-all-bibitems-from-bibtex ()
  (interactive)
  (mapc 'LaTeX-add-bibitems
        (apply 'append
               (mapcar 'get-bibtex-keys (reftex-get-bibfile-list)))))




(defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
  (setq ac-sources
	(append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
		ac-sources))
  )



(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`



(require 'python)

;; If you use tex-mode
(require 'tex-mode)`
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; android-mode
(add-to-list 'load-path "~/Programs/opt/android-mode")
(require 'android-mode)
(custom-set-variables '(android-mode-sdk-dir "~/Programs/opt/android-sdk-linux"))
;;(defcustom android-mode-sdk-dir "/home/david/Programs/opt/android-sdk-linux/")
;;(defcustom android-mode-sdk-dir "~/Programs/opt/android-sdk-linux"  :type 'string
;;  :group 'android-mod)
