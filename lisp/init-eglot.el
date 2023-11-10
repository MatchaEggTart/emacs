;;; init-eglot.el --- the configurations for completion
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

(use-package eglot
  ;; :hook (prog-mode . eglot-ensure)
  :hook ((
          elisp-mode
          c-mode
	  c-ts-mode
          c++-mode
	  c++-ts-mode
          js-mode
	  js-ts-mode
          typescript-ts-mode
          ) . eglot-ensure)
  :bind ("C-c e f" . eglot-format)
  :config
  (progn
    ;; (advice-add 'eglot-code-action-organize-imports :before #'eglot-format)
    ;; https://wiki.archlinux.org/title/Language_Server_Protocol

    ;; sudo pacman -S clang
    (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))

    ;; sudo npm install -g typescrip typescript-language-server
    ;; 别装最新版的 typescript-language-server
    ;; sudo npm install -D -g typescript typescript-language-server@4.0.0
    (add-to-list 'eglot-server-programs '(js-mode js-ts-mode typescript-ts-mode "typescript-language-server" "--stdio"))
    )
  )

(provide 'init-eglot)
  ;;; init-eglot.el ends here
