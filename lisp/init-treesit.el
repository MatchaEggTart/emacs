;;; init-treesit.el --- the configurations for treesit
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; (use-package tree-sitter
;;   :config
;;   ;; (global-tree-sitter-mode)
;;   (tree-sitter-require 'c)
;;   (tree-sitter-require 'typescript)
;;   
;;   )
;;  
;; (use-package tree-sitter-langs
;;   )
(use-package treesit-auto
  :demand t
  :mode
  ("\\.ts\\'" . typescript-ts-mode)
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode)
  (add-to-list 'treesit-extra-load-path "~/.emacs.d/tree-sitter/tree-sitter-module")
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
  ;; 更多高亮
  (setq treesit-font-lock-level 4)
  )


(provide 'init-treesit)

;;; init-treesit.el ends here
