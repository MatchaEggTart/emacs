(defun open-my-config ()
  (interactive)
  (dired "~/.config/emacs/lisp/"))

(global-set-key (kbd "<f6>") 'open-my-config)

(defun open-workspace()
  (interactive)
  (dired "~/Workspace/"))

(global-set-key (kbd "<f8>") 'open-workspace)

;; 快捷键查找函数
(global-set-key (kbd "C-h C-f") 'find-function)

;; 系统自带的提示功能
;;(setq tab-always-indent 'complete)
;; M-x 有补全
;; (icomplete-mode t)

;; 开启行号
(global-display-line-numbers-mode t)

;; 括号补全
(electric-pair-mode t)

;; 自动最大化
(toggle-frame-maximized)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode 0)

;; 关闭 menu-bar
(menu-bar-mode 0)

;; 关闭文件滑动控件
(scroll-bar-mode 0)

;; 改变光标模式
;; (setq cursor-type 'box)
(setq cursor-type 'bar)


(use-package keycast
  :ensure t
  :hook
  (after-init . keycast-mode)
  )



(provide 'init-temp)
