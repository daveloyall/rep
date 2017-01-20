;; http://markcox80.github.io/lisp-executable/#sec-2
(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:load-system "lisp-executable"))


(defsystem rep
  :author "Dave Loyall"
  :description "Generic REPL without the Loop"
  :license "GPLv3"
  :serial t
  :depends-on (lisp-executable
	       donuts
	       cl-syntax-annot)
  :components ((:module "src"
		:serial t
		:components ((:file "logger")
			     (:file "rep")
				     (lisp-executable:executable "rep.image" :program ("THE-GOOD-GUYS.REP" "REP"))))))









