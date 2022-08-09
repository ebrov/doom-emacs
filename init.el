;;; init.el -*- lexical-binding: t; -*-
;;
;; Author:  Henrik Lissner <contact@henrik.io>
;; URL:     https://github.com/hlissner/doom-emacs
;;
;;   =================     ===============     ===============   ========  ========
;;   \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
;;   ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
;;   || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
;;   ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
;;   || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
;;   ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
;;   || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
;;   ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
;;   ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
;;   ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
;;   ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
;;   ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
;;   ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
;;   ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
;;   ||.=='    _-'                                                     `' |  /==.||
;;   =='    _-'                                                            \/   `==
;;   \   _-'                                                                `-_   /
;;    `''                                                                      ``'
;;
;; These demons are not part of GNU Emacs.
;;
;;; License: MIT

;; In the strange case that early-init.el wasn't loaded (e.g. you're using
;; Chemacs 1? Or you're loading this file directly?), we do it explicitly:
(unless (boundp 'doom-version)
  (load (concat (file-name-directory load-file-name) "early-init")
        nil t))

;; Ensure Doom's core libraries are properly initialized, autoloads file is
;; loaded, and hooks set up for an interactive session.
(doom-initialize)

;; Set swiper in place of incremental search
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x a") 'align)
(show-paren-mode)

;; Enable c++-mode for .cu files
(setq auto-mode-alist
  (append
    '(
      ;; File name ends in `.h'.
      ("\\.h\\'" . c++-mode)
      ;; File name ends in `.cu'.
      ("\\.cu\\'" . c++-mode)
      ;; File name ends in `.ino'.
      ("\\.ino\\'" . c++-mode)
      ;; File name ends in `.yy'.
      ("\\.yy\\'" . c++-mode)
      ;; File name end in `.CHF'
      ("\\.ChF\\'" . fortran-mode)
      ;; File name end in `.m'
      ("\\.m\\'" . octave-mode)
    )
    auto-mode-alist))

(defconst Chombo-style
  '((c-tab-always-indent               . t)
    (c-basic-offset                    . 2)
    (c-comment-only-line               . 0)
    (continued-statement-offset        . 2)
    (c-continued-brace-offset          . 0)
    (c-brace-offset                    . 2)
    (c-brace-imaginary-offset          . 0)
    (c-argdecl-indent                  . 2)
    (c-label-offset                    . -2)
    (c++-member-init-indent            . 2)
    (c++-continued-member-init-offset  . 0)
    (c++-empty-arglist-indent          . 2)
    (c++-friend-offset                 . 0)
    )
  "Chombo Style")





;; Now we load all enabled modules in the order dictated by your `doom!' block
;; in $DOOMDIR/init.el. `doom-initialize-modules' loads them (and hooks) in the
;; given order:
;;
;;   $DOOMDIR/init.el
;;   {$DOOMDIR,~/.emacs.d}/modules/*/*/init.el
;;   `doom-before-init-modules-hook'
;;   {$DOOMDIR,~/.emacs.d}/modules/*/*/config.el
;;   `doom-init-modules-hook'
;;   $DOOMDIR/config.el
;;   `doom-after-init-modules-hook'
;;   `after-init-hook'
;;   `emacs-startup-hook'
;;   `doom-init-ui-hook'
;;   `window-setup-hook'
;;
;; And then we're good to go!
(doom-initialize-modules)

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "Chombo" Chombo-style t))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq c-default-style "Chombo")
