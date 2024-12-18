;;; init-web.el --- the configurations for completion
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; emmet
(use-package emmet-mode
  :hook ((
	  ;;sgml-mode-hook
	  html-mode-hook
	  ;; web-mode-hook
	  css-mode-hook
	  tsx-ts-mode-hook) . emmet-mode)
  :bind (("C-j" . emmet-expand-line))
  )

;; JSONRPC
;; (use-package jsonrpc
;;   :ensure t)

(provide 'init-web)
;;; init-web.el ends here
