(eval-when (:compile-toplevel :load-toplevel :execute)
  (ql:quickload :lisp-unit)
  (ql:quickload :lisp-executable))


(pushnew "./" asdf:*central-registry*)


(asdf:load-system "lisp-unit")

(setf lisp-unit:*print-errors* t
      lisp-unit:*print-failures* t)
(asdf:test-system "lisp-executable")
(unwind-protect
     (asdf:oos 'lisp-executable:create-executables-op "rep")
  #+:ecl (ext:quit 0)
  #+:sbcl (sb-ext:exit :code 0)
  #+:ccl (ccl::quit 0)
  #+:cmucl (extensions:quit)
  #+:clisp (ext:quit))
