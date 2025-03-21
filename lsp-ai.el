;;; lsp-ai.el --- lsp-ai settings             -*- lexical-binding: t; -*-

;;; Commentary:

;; lsp-ai client

;;; Code:

(require 'lsp-mode)
(require 'lsp-semantic-tokens)
(defvar lsp-ai-repo "https://github.com/SilasMarvin/lsp-ai")

(defgroup lsp-ai nil
  "LSP support for ai, using lsp-ai."
  :group 'lsp-mode
  :link '(url-link lsp-ai-repo)
  :package-version '(lsp-mode . "9.0.0"))

(defcustom lsp-ai-server-command "lsp-ai"
  "Command to run the lsp-ai executable."
  :type 'boolean
  :group 'lsp-ai
  :package-version '(lsp-mode . "9.0.0"))

(defcustom lsp-ai-completion-model "model1"
  "Command to run the lsp-ai executable."
  :type 'string
  :group 'lsp-ai
  :package-version '(lsp-mode . "9.0.0"))

(defcustom lsp-ai-completion-messages "model1"
  "Command to run the lsp-ai executable."
  :type 'lsp-string-vector
  :group 'lsp-ai
  :package-version '(lsp-mode . "9.0.0"))


(defcustom lsp-ai-server 'lsp-ai
  "Choose LSP server."
  :type '(const :tag "lsp-ai" lsp-ai)
  :group 'lsp-ai
  :package-version '(lsp-mode . "6.2"))


(lsp-dependency 'lsp-ai
                `(:system lsp-ai-server-command)
                '(:cargo :package "lsp_ai"
                         :path "lsp_ai"
                         :git lsp-ai-repo))

(defun lsp-ai-init-options ()
  "Init options for lsp-ai."
  (list
   (list :model lsp-ai-completion-model
         :parameters (list :messages lsp-ai-completion-messages :maxContext)
          ))
  )
(lsp-register-client
 (make-lsp-client
                  :priority -2
                  :completion-in-comments? t
                  :add-on? t
                  :initialization-options 'lsp-ai-init-options
                  :server-id 'lsp-ai
                  :multi-root? t))

(provide 'lsp-ai)
;;; lsp-ai.el ends here
