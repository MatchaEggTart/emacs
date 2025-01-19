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

(use-package web-mode
  :ensure t
  :mode
  (
   ;; ("\\.phtml\\'" . web-mode)
   ;; ("\\.php\\'" . web-mode)
   ;; ("\\.tpl\\'" . web-mode)
   ;; ("\\.[agj]sp\\'" . web-mode)
   ;; ("\\.as[cp]x\\'" . web-mode)
   ;; ("\\.erb\\'" . web-mode)
   ;; ("\\.mustache\\'" . web-mode)
   ;; ("\\.djhtml\\'" . web-mode)
   ("\\.html\\'" . web-mode)
   )
  :config
  (setq web-mode-markup-indent-offset 2)
  )

;; JSON
(use-package json-mode
  :ensure t
  :mode
  (
   ("\\.json\\'" . json-mode)
   ("\\.jsonc\\'" . json-mode)
   )
  :config
  (setq js-indent-level 2)
  )

;; CONF-MODE
(use-package nginx-mode
  :ensure t
  :mode
  (
   ("\config\\'" . nginx-mode)
   ("\\.conf\\'" . nginx-mode)
   )
  :config
  (setq nginx-indent-level 2)
  )

(provide 'init-web)
;;; init-web.el ends here

