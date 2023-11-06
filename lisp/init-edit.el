;;; init-edit.el --- the configurations for editor
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; 括号补全
(electric-pair-mode t)

;; 是否自动缩进
;; (electric-indent-mode nil)

;; 选中内容可以直接被输入内容取代
(delete-selection-mode t)

;;让鼠标滚动更好用
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;; (setq mouse-wheel-progressive-speed nil)

;; evil-nerd-commenter
;; 增强注释
;; (use-package evil-nerd-commenter
;;   :bind ("C-c C-/" . evilnc-comment-or-uncomment-lines))

;; crux
(use-package crux
  :bind(
	;; 回到第一个字符
	;; ("C-a" . crux-move-beginning-of-line)
	;; ("C-^" . crux-top-join-line)
	;; ("C-c I" . crux-find-user-init-file)
	;; 智能删除键
	("C-k" . crux-smart-kill-line)))

;; 删除自动清除空白位置(新)
(use-package hungry-delete
  ;; :init (global-hungry-delete-mode))
  :hook (after-init . global-hungry-delete-mode))

;; 文本编辑之行/区域上下移动(新)
(use-package move-dup
  :hook (after-init . global-move-dup-mode))


;; 快速切换窗格
(use-package ace-window
  :bind (("M-o" . 'ace-window)))


(provide 'init-edit)

;; init-edit.el ends here
