;; http://markcox80.github.io/lisp-executable/#sec-2
(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:load-system "lisp-executable"))


(defsystem cl-rep
  :author "Dave Loyall"
  :description "Generic REPL without the Loop"
  :license "GPLv3"
  :serial t
  :depends-on (lisp-executable
	       donuts)
  :components ((:module ""
		:serial t
			:components ((:file "cl-rep")
				     (lisp-executable:executable "cl-rep.image" :program ("THE-GOOD-GUYS.CL-REP" "CL-REP"))))))









