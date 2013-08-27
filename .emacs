(set-background-color "LightBlue1")
(set-cursor-color "sienna")

(add-to-list 'load-path "~/.emacs.d/plugins/")   
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
(ac-config-default)

(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)

(defun my-c-mode-common-hook()
;;  (setq ac-auto-start nil)
  (setq ac-auto-start t)
;;  (setq ac-expand-on-auto-complete nil)
  (setq ac-expand-on-auto-complete t)
  (setq ac-quick-help-delay 0.3)
;;  (define-key c-mode-base-map (kbd "M-/") 'ac-complete-clang)
  (setq ac-clang-flags
	(mapr (lambda (item) (concat "-I" item))
	      (split-string
	       "
 /usr/include/c++/4.4
 /usr/include/c++/4.4/i486-linux-gnu
 /usr/include/c++/4.4/backward
 /usr/local/include
 /usr/lib/gcc/i486-linux-gnu/4.4.3/include
 /usr/lib/gcc/i486-linux-gnu/4.4.3/include-fixed
 /usr/include
")))
)



(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/plugins/auto-complete-clang")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)



























