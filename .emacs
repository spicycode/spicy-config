(defun add-to-load-path (fn)
 "Add expanded file name to load path.
Trailing slashes are stripped and duplicate names are not added."
 (let ((ffn (expand-file-name fn)))
   (if (eq (substring ffn -1) "/")
       (setq ffn (substring ffn 0 -1)))
   (if (not (member ffn load-path))
       (setq load-path (cons ffn load-path)))))

(add-to-load-path "~/.emacs.d")

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defun find-next-tag ()
 (interactive)
 (find-tag (car find-tag-history) t))

(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
(require 'git)
(autoload 'git-blame-mode "git-blame" "Minor mode for incremental blame for Git." t)

(require 'ido)
(ido-mode t)

(defun ido-find-file-in-tag-files ()
 (interactive)
 (save-excursion
   ;; If we need to ask for the tag table, allow that.
   (let ((enable-recursive-minibuffers t))
     (visit-tags-table-buffer))
   (ido-completing-read "Project file: "
                               (tags-table-files)
                                      nil t)))

(eval-after-load "compile"
 '(progn
    (mapcar (lambda (defn) (add-to-list 'compilation-error-regexp-alist-alist defn))
            (list '(git-svn-updated "^\t[A-Z]\t\\(.*\\)$" 1 nil nil 0 1)
                  '(git-svn-needs-update "^\\(.*\\): needs update$" 1 nil nil 2 1)))
    (mapcar (lambda (defn) (add-to-list 'compilation-error-regexp-alist defn))
            (list 'git-svn-updated 'git-svn-needs-update))))
(defun git-svn (dir)
 (interactive "DSelect directory: ")
 (let* ((default-directory (git-get-top-dir dir))
        (compilation-buffer-name-function (lambda (major-mode-name) "*git-svn*")))
   (compile (concat "git-svn " (ido-completing-read "git-svn command: " (list "rebase" "dcommit" "log") nil t)))))

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)
(set-default 'truncate-lines t)


(global-set-key [(meta t)] 'ido-find-file-in-tag-files)
(global-set-key [(meta s)] 'shell)
(global-set-key [(hyper T)] 'find-tag)
;(global-set-key "\M-\C-t" 'find-next-tag) ; where should I put this?
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper g)] 'git-status)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper o)] 'find-file)
(global-set-key [(hyper f)] 'isearch-forward)
(global-set-key [(hyper g)] 'isearch-repeat-forward)
(global-set-key [(hyper \])] 'indent-rigidly)
(global-set-key [(hyper \[)] (lambda (start end arg) (interactive "r\np") (indent-rigidly start end (- arg))))
(global-set-key [(hyper w)]
               (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [(hyper right)] 'other-frame)
(global-set-key [(hyper left)] 'other-frame)
(global-set-key "\C-ct" 'toggle-buffer)

(fset 'yes-or-no-p 'y-or-n-p)

(add-to-load-path "~/.emacs.d/emacs-rails")
(require 'rails)

(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

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

 (require 'color-theme)
    (color-theme-initialize)
    (color-theme-billw)