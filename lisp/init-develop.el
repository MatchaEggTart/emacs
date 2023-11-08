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

;; 自带的查错神器喔
(use-package flymake
  :config
  ;; (require 'flymake-jslint)
  ;; (add-hook 'js-mode-hook 'flymake-jslint-load)
  ;; :hook (prog-mode . flymake-mode)
  :bind (("M-n" . #'flymake-goto-next-error)
	 ("M-p" . #'flymake-goto-prev-error))
  )

;; 快速运行代码
(use-package quickrun
  :commands (quickrun)
  :init
  (quickrun-add-command "c++/c1z"
    '((:command . "g++")
      (:exec . ("%c -std=c++1z %o -o %e %s"
		"%e %a"))
      (:remove . ("%e")))
    :default "c++")
  ;; You can override existing command
  (quickrun-add-command "c/gcc"
    '((:exec . ("%c -std=c++1z %o -o %e %s"
		"%e %a")))
    :override t)
  :config
  (global-set-key (kbd "<f5>") 'quickrun)
  )



(provide 'init-develop)

;;; init-develop.el ends here
