;;; init-develop.el --- the configurations for devloper
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; 自动补全(新)
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq
   company-minimum-prefix-length 1
   ;; 补全时间等待
   company-idle-delay 0
   company-show-quick-access t)
  :bind (:map company-active-map
              ("C-n" . 'company-select-next)
	      ("C-p" . 'company-select-previous)))


(provide 'init-develop)

;;; init-develop.el ends here
