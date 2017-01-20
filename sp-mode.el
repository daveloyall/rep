;;
(shell-command-to-string "./rep.image --eval '(progn (ql:quickload :donuts :SILENT t)
  (in-package :donuts)
(+ 1 1))'")


"(DONUTS)"






