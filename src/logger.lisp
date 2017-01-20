;;Thank you fukamachi
;;https://raw.githubusercontent.com/fukamachi/datafly/d2b753e7fdd0dbeada9721380cf410186a85535b/src/logger.lisp
(in-package :cl-user)
(defpackage rep.logger
  (:use :cl))
(in-package rep.logger)

(syntax:use-syntax :annot)

@export
(defvar *trace-rep* nil)

(defparameter *rep-logger-pattern*
  "[%D{%H:%M:%S}] <REP> %m%n")

@export
(defvar *rep-logger*
  (let ((logger (log:category '(rep))))
    (log:config logger :own :trace)
    (log4cl:add-appender logger
                         (make-instance 'log4cl:this-console-appender
                                        :layout (make-instance 'log4cl:pattern-layout
                                                               :conversion-pattern *rep-logger-pattern*)))
    logger))
