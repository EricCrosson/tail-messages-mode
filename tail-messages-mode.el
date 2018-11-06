;;; tail-messages-mode.el --- Tail *Messages* buffer when visible
;;
;;; Copyright (C) 2018  Free Software Foundation, Inc.
;;
;; Author: Eric Crosson <eric.s.crosson@utexas.com>
;; Version: 0.0.3
;; Keywords: convenience
;; URL: https://github.com/EricCrosson/tail-messages-mode
;; Package-Requires: ((emacs "24"))
;;
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;
;;
;;; Commentary:
;;
;; This package provides a minor-mode to tail the end of the
;; *Messages* buffer when visible.

;;; Code:

;;;###autoload
(define-minor-mode tail-messages-mode
  "Tail the end of the *Messages* buffer when visible."
  :init-value nil
  :lighter " tail"
  :keymap (make-sparse-keymap)
  :global t
  :group 'tail-messages
  :require 'tail-messages-mode)

(defun tail-messages (format-string &rest args)
  "Move point to bottom of *Messages* buffer, ignoring FORMAT-STRING
and ARGS."
  (with-current-buffer "*Messages*"
    (goto-char (point-max))
    (walk-windows (lambda (window)
                    (if (string-equal (buffer-name (window-buffer window)) "*Messages*")
                        (set-window-point window (point-max))))
                  nil
                  t)))

(defun tail-messages-add-or-remove-advice ()
  "Add or remove advice from `message'."
  (if tail-messages-mode
      (advice-add 'message :after 'tail-messages)
    (advice-remove 'message 'tail-messages)))

(add-hook 'tail-messages-mode-hook 'tail-messages-add-or-remove-advice)


(provide 'tail-messages-mode)

;;; tail-messages-mode.el ends here
