(defun add-to-load-path (fn)
 "Add expanded file name to load path.
Trailing slashes are stripped and duplicate names are not added."
 (let ((ffn (expand-file-name fn)))
   (if (eq (substring ffn -1) "/")
       (setq ffn (substring ffn 0 -1)))
   (if (not (member ffn load-path))
       (setq load-path (cons ffn load-path)))))

(add-to-load-path "~/.emacs.d")
(add-to-load-path "~/.emacs.d/emacs-rails")
(add-to-load-path "~/.emacs.d/clojure-mode")

(autoload 'js2-mode "js2" nil t)

(require 'rails)
(require 'erlang)
(require 'yaml-mode)
(require 'textile-mode)
(require 'cheat)
(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
(require 'git)
(autoload 'git-blame-mode "git-blame" "Minor mode for incremental blame for Git." t)
(require 'ido)
(ido-mode t)
(require 'linum)
(global-linum-mode 1)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.erl\\'" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl\\'" . erlang-mode))

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)

(global-set-key [(meta s)] 'shell)
(global-set-key [(hyper T)] 'find-tag)
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper g)] 'git-status)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper o)] 'find-file)
(global-set-key [(hyper f)] 'find-grep-dired)
(global-set-key [(hyper \])] 'indent-rigidly)
(global-set-key [(hyper \[)] (lambda (start end arg) (interactive "r\np") (indent-rigidly start end (- arg))))
(global-set-key [(hyper w)] (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [(hyper right)] 'other-frame)
(global-set-key [(hyper left)] 'other-frame)

(fset 'yes-or-no-p 'y-or-n-p)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;; Clojure Mode
(setq inferior-lisp-program
      (let* ((java-path "java")               ; Path to java implementation
             (java-options "")                ; Extra command-line options to java.
             (clojure-path "/usr/local/clojure/target/")  ; Base directory to Clojure.
             (class-path-delimiter ";")       ; The character between  elements of your classpath.
             (class-path (mapconcat (lambda (s) s)
                                    (list (concat clojure-path "clojure-lang-1.0-SNAPSHOT.jar"))
                                    class-path-delimiter)))
        (concat java-path
                " " java-options
                " -cp " class-path
                " clojure.lang.Repl")))

;; Require clojure-mode to load and associate it to all .clj files.
(setq load-path (cons "insert path to folder with clojure-mode stuff" load-path))
(require 'clojure-mode)
(setq auto-mode-alist
      (cons '("\\.clj$" . clojure-mode)
            auto-mode-alist))

;; These are extra key defines because I kept typing them.
;; Within clojure-mode, have Ctrl-x Ctrl-e evaluate the last
;; expression.
;; Ctrl-c Ctrl-e is also there, because I kept typoing it.
(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map "\C-c\C-e" 'lisp-eval-last-sexp)
             (define-key clojure-mode-map "\C-x\C-e" 'lisp-eval-last-sexp)))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/emacs.backups"))))
 '(ido-enable-flex-matching t)
 '(inhibit-startup-screen t)
 '(standard-indent 2))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
