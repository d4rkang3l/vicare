;;;Ikarus Scheme -- A compiler for R6RS Scheme.
;;;Copyright (C) 2006,2007,2008  Abdulaziz Ghuloum
;;;Modified by Marco Maggi <marco.maggi-ipsu@poste.it>
;;;
;;;This program is free software:  you can redistribute it and/or modify
;;;it under  the terms of  the GNU General  Public License version  3 as
;;;published by the Free Software Foundation.
;;;
;;;This program is  distributed in the hope that it  will be useful, but
;;;WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
;;;MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;General Public License for more details.
;;;
;;;You should  have received  a copy of  the GNU General  Public License
;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.


(library (psyntax compat)
  (export
    define*				define-constant
    case-define				define-record
    define-inline			define-syntax-rule
    define-auxiliary-syntaxes
    receive				receive-and-return
    module				import
    begin0				define-values
    debug-print

    make-struct-type			struct?
    struct-type-descriptor?		struct-type-field-names

    make-parameter			parametrise
    format				gensym
    symbol-value			set-symbol-value!
    keyword?				pretty-print
    would-block-object?
    pretty-print*			bignum?
    vector-exists
    real-pathname			file-modification-time
    vector-append
    add1				sub1

    ;; compiler related operations
    eval-core

    ;; runtime options
    report-errors-at-runtime		strict-r6rs
    enable-arguments-validation?

    ;; reading source code and interpreting the resule
    get-annotated-datum			read-library-source-file
    annotation?				annotation-expression
    annotation-stripped			annotation-source
    annotation-textual-position

    ;; source position condition objects
    make-source-position-condition	source-position-condition?
    source-position-byte		source-position-character
    source-position-line		source-position-column
    source-position-port-id

    label-binding			set-label-binding!
    remove-location

    ;; symbol property lists
    putprop				getprop
    remprop				property-list

    ;; error handlers
    library-version-mismatch-warning
    library-stale-warning
    file-locator-resolution-error
    procedure-argument-violation
    warning

    ;; unsafe bindings
    $car $cdr
    $fx= $fx< $fx> $fx<= $fx>= $fxadd1
    $fxzero? $fxpositive? $fxnonnegative?
    $vector-ref $vector-set! $vector-length)
  (import (except (ikarus)
		  ;;FIXME This except is to  be removed at the next boot
		  ;;image rotation.  (Marco Maggi; Fri Jan 31, 2014)
		  struct-type-descriptor?)
    (only (ikarus structs)
	  struct-type-descriptor?)
    (only (ikarus.reader)
	  ;;this is not in makefile.sps
	  read-library-source-file)
    (only (ikarus.compiler)
	  eval-core)
    (only (ikarus system $symbols)
	  $unintern-gensym)
    (only (vicare $posix)
	  real-pathname
	  file-modification-time)
    (only (vicare options)
	  report-errors-at-runtime
	  strict-r6rs)
    (only (vicare unsafe operations)
	  $fx= $fx< $fx> $fx<= $fx>= $fxadd1
	  $fxzero? $fxpositive? $fxnonnegative?
	  $car $cdr
	  $vector-ref $vector-set! $vector-length))


(define (library-version-mismatch-warning name depname filename)
  (fprintf (current-error-port)
	   "*** Vicare warning: library ~s has an inconsistent dependency \
            on library ~s; file ~s will be recompiled from source.\n"
	   name depname filename))

(define (library-stale-warning name filename)
  (fprintf (current-error-port)
	   "*** Vicare warning: library ~s is stale; file ~s will be \
            recompiled from source.\n"
	   name filename))

(define (file-locator-resolution-error libname failed-list pending-list)
  (define-condition-type &library-resolution &condition
    make-library-resolution-condition
    library-resolution-condition?
    (library condition-library)
    (files condition-files))
  (define-condition-type &imported-from &condition
    make-imported-from-condition imported-from-condition?
    (importing-library importing-library))
  (raise
   (apply condition (make-error)
	  (make-who-condition 'expander)
	  (make-message-condition "cannot locate library in library-path")
	  (make-library-resolution-condition libname failed-list)
	  (map make-imported-from-condition pending-list))))

(define-syntax define-record
  (syntax-rules ()
    [(_ name (field* ...) printer)
     (begin
       (define-struct name (field* ...))
       (module ()
	 (set-rtd-printer! (type-descriptor name)
			   printer)))]
    [(_ name (field* ...))
     (define-struct name (field* ...))]))

(define (set-label-binding! label binding)
  (set-symbol-value! label binding))

(define (label-binding label)
  (and (symbol-bound? label) (symbol-value label)))

(define (remove-location x)
  ($unintern-gensym x))


;;;; configuration

(module (enable-arguments-validation?)
  (module (arguments-validation)
    (include "ikarus.config.ss" #t))
  (define (enable-arguments-validation?)
    arguments-validation)
  #| end of module |# )


;;;; done

)

;;; end of file
