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

;; 折叠代码
(add-hook 'prog-mode-hook 'hs-minor-mode)


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
  ;; :config
  ;; (keymap-global-unset (kbd "M-o M-o"))
  ;; 取消这个按键，避免冲突
  ;; (global-set-key (kbd "M-o M-o") nil)
  ;; 左侧显示窗口编号
  ;; (setq ace-window-display-mode t)
  :bind
  (("M-o" . 'ace-window)
   )
  )

;; iedit - edit same text in one buffer or region
;; (use-package iedit
;;   :bind ("C-;" . iedit-mode)
;; )

;; 块选择器
(use-package multiple-cursors
  :bind
  ("C-S-c C-S-c" . 'mc/edit-lines)
  ("C->"         . 'mc/mark-next-like-this)
  ("C-<"         . 'mc/mark-previous-like-this)
  ("C-M->"       . 'mc/skip-to-next-like-this)
  ("C-M-<"       . 'mc/skip-to-previous-like-this)
  ("C-c C-<"     . 'mc/mark-all-like-this)
  ("M-<mouse-1>" . 'mc/add-cursor-on-click)
  ;; 要关闭 Fcitx5 的 C-; clipboard 快捷键
  ("C-;"         . 'mc/mark-all-symbols-like-this)
  ("C-:"         . 'mc/mark-all-symbols-like-this-in-defun)
  )

(provide 'init-edit)

;; init-edit.el ends here
