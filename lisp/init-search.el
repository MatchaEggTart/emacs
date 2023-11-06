;;; init-search.el --- the configurations for search, minibuffer, buffer
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; 搜索功能
(use-package vertico
  :init
  (vertico-mode)
  )

;; 保存搜索历史
;; Persist history over Emacs restarts. Vertico sorts by history position.
;; 记住指令跟文件，下次使用优先，不过 28好像默认开启了
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

;; 模糊搜索
;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

;; 增强 minibuffer， 可以显示各种值跟其他数据
;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle' globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
	 :map minibuffer-local-map
	 ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

;; C-s C-r 搜索增强
;; sudo dnf install ripgrep || sudo pacman -S ripgrep
(use-package consult
  ;; :ensure t
  :bind
  ("C-s" . consult-line)
  ;; ("C-x b" . consult-buffer)
  ("M-s r" . consult-ripgrep)
  )

;; 在 函数 使用 embark-act (C-.) 可以看到函数的详细信息
(use-package embark
  :ensure t
  ;; :after (consult)
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; 可以不用记快捷键， 按 C-x C-h， 然后输入快捷键大概内容
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc.  You may adjust the Eldoc
  ;; strategy, if you want to see the documentation from multiple providers.
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none))))
  (progn
    (setq
     consult-narrow-key "<"
     consult-line-numbers-widen t
     consult-async-min-input 2
     consult-async-refresh-delay  0.15
     consult-async-input-throttle 0.2
     consult-async-input-debounce 0.1)
    )
  )

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :after (consult embark)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package wgrep
  :config
  (setq wgrep-auto-save-buffer t)
  )

;; doom emacs 设置修改
(defun embark-export-write ()
  "Export the current vertico results to a writable buffer if possible.
  Supports exporting consult-grep to wgrep, file to wdeired, and consult-location to occur-edit"
  (interactive)
  (require 'embark)
  (require 'wgrep)
  (pcase-let ((`(,type . ,candidates)
	       (run-hook-with-args-until-success 'embark-candidate-collectors)))
    (pcase type
      ('consult-grep (let ((embark-after-export-hook #'wgrep-change-to-wgrep-mode))
		       (embark-export)))
      ('file (let ((embark-after-export-hook #'wdired-change-to-wdired-mode))
	       (embark-export)))
      ('consult-location (let ((embark-after-export-hook #'occur-edit-mode))
			   (embark-export)))
      (x (user-error "embark category %S doesn't support writable export" x)))))

(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)  

;; 批量替换
;; 先使用 M-x consult-ripgrep，输入字符串
;; 然后 C-c C-e
;; 然后 M-x，选择 query-replace-regrep(C-M-%)， 进行递归替换
;; 最后 C-c C-c 保存



;;; init-search.el ends here

(provide 'init-search)
