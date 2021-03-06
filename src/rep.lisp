(defpackage "THE-GOOD-GUYS.REP"
  (:use "COMMON-LISP"
        "LISP-EXECUTABLE"))
(in-package "THE-GOOD-GUYS.REP")


					;We could take arguents like this (&options help)
					;cause lisp-executable handles command line args
;It's like a REPL with no Loop.
(define-program rep (&options eval &others sexp)
  (ql:quickload :log4slime :silent t)
  (log:config (log::logger '(REP)) :own :daily "log_rep.txt" :trace :nopretty :noadditive)
  (cond (eval
	 (let ((the-input (read-from-string (apply 'values sexp))))
	   (log:trace the-input)
	   (format t "~A" (eval the-input))))
	(t
	 (format t "~A" (eval (read))))))

