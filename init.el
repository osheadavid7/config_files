(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(load "/media/progs/git-wip/emacs/git-wip.el")
(setq TeX-PDF-mode t)
(setq TeX-view-program-selection
      '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Viewer" "okular %o")))
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

