;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Vicare Scheme
;;;Contents: tests for (vicare platform words)
;;;Date: Wed Feb 15, 2012
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (C) 2012, 2013, 2015 Marco Maggi <marco.maggi-ipsu@poste.it>
;;;
;;;This program is free software:  you can redistribute it and/or modify
;;;it under the terms of the  GNU General Public License as published by
;;;the Free Software Foundation, either version 3 of the License, or (at
;;;your option) any later version.
;;;
;;;This program is  distributed in the hope that it  will be useful, but
;;;WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
;;;MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;General Public License for more details.
;;;
;;;You should  have received  a copy of  the GNU General  Public License
;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;


#!r6rs
(import (vicare)
  (prefix (vicare platform words) words.)
  (vicare platform constants)
  (vicare checks))

(check-set-mode! 'report-failed)
(check-display "*** testing (vicare platform words) library\n")


(parametrise ((check-test-name	'clang))

  (check (words.unsigned-char? (+ +1 UCHAR_MAX))	=> #f)
  (check (words.unsigned-char? UCHAR_MAX)		=> #t)
  (check (words.unsigned-char? 0)			=> #t)
  (check (words.unsigned-char? -1)			=> #f)

  (check (words.signed-char? (+ +1 CHAR_MAX))		=> #f)
  (check (words.signed-char? CHAR_MAX)			=> #t)
  (check (words.signed-char? CHAR_MIN)			=> #t)
  (check (words.signed-char? (+ -1 CHAR_MIN))		=> #f)

  (check (words.signed-char? (+ +1 SCHAR_MAX))		=> #f)
  (check (words.signed-char? SCHAR_MAX)			=> #t)
  (check (words.signed-char? SCHAR_MIN)			=> #t)
  (check (words.signed-char? (+ -1 SCHAR_MIN))		=> #f)

;;; --------------------------------------------------------------------

  (check (words.unsigned-short? (+ +1 USHRT_MAX))	=> #f)
  (check (words.unsigned-short? USHRT_MAX)		=> #t)
  (check (words.unsigned-short? 0)			=> #t)
  (check (words.unsigned-short? -1)			=> #f)

  (check (words.signed-short? (+ +1 SHRT_MAX))		=> #f)
  (check (words.signed-short? SHRT_MAX)			=> #t)
  (check (words.signed-short? SHRT_MIN)			=> #t)
  (check (words.signed-short? (+ -1 SHRT_MIN))		=> #f)

;;; --------------------------------------------------------------------

  (check (words.unsigned-int? (+ +1 UINT_MAX))		=> #f)
  (check (words.unsigned-int? UINT_MAX)			=> #t)
  (check (words.unsigned-int? 0)			=> #t)
  (check (words.unsigned-int? -1)			=> #f)

  (check (words.signed-int? (+ +1 INT_MAX))		=> #f)
  (check (words.signed-int? INT_MAX)			=> #t)
  (check (words.signed-int? INT_MIN)			=> #t)
  (check (words.signed-int? (+ -1 INT_MIN))		=> #f)

;;; --------------------------------------------------------------------

  (check (words.unsigned-long? (+ +1 ULONG_MAX))	=> #f)
  (check (words.unsigned-long? ULONG_MAX)		=> #t)
  (check (words.unsigned-long? 0)			=> #t)
  (check (words.unsigned-long? -1)			=> #f)

  (check (words.signed-long? (+ +1 LONG_MAX))		=> #f)
  (check (words.signed-long? LONG_MAX)			=> #t)
  (check (words.signed-long? LONG_MIN)			=> #t)
  (check (words.signed-long? (+ -1 LONG_MIN))		=> #f)

;;; --------------------------------------------------------------------

  (check (words.unsigned-long-long? (+ +1 ULONG_LONG_MAX))	=> #f)
  (check (words.unsigned-long-long? ULONG_LONG_MAX)	=> #t)
  (check (words.unsigned-long-long? 0)			=> #t)
  (check (words.unsigned-long-long? -1)			=> #f)

  (check (words.signed-long-long? (+ +1 LONG_LONG_MAX))	=> #f)
  (check (words.signed-long-long? LONG_LONG_MAX)	=> #t)
  (check (words.signed-long-long? LONG_LONG_MIN)	=> #t)
  (check (words.signed-long-long? (+ -1 LONG_LONG_MIN))	=> #f)

;;; --------------------------------------------------------------------

  (check (words.pointer-integer? (words.greatest-c-pointer*))	=> #f)
  (check (words.pointer-integer? (words.greatest-c-pointer))	=> #t)
  (check (words.pointer-integer? (words.least-c-pointer))	=> #t)
  (check (words.pointer-integer? (words.least-c-pointer*))	=> #f)

  #t)


(parametrise ((check-test-name	'size_t))

  (check (fixnum? words.SIZEOF_CHAR)		=> #t)
  (check (fixnum? words.SIZEOF_SHORT)		=> #t)
  (check (fixnum? words.SIZEOF_INT)		=> #t)
  (check (fixnum? words.SIZEOF_LONG)		=> #t)
  (check (fixnum? words.SIZEOF_LONG_LONG)	=> #t)
  (check (fixnum? words.SIZEOF_SIZE_T)		=> #t)
  (check (fixnum? words.SIZEOF_SSIZE_T)		=> #t)
  (check (fixnum? words.SIZEOF_OFF_T)		=> #t)
  (check (fixnum? words.SIZEOF_FLOAT)		=> #t)
  (check (fixnum? words.SIZEOF_DOUBLE)		=> #t)
  (check (fixnum? words.SIZEOF_POINTER)		=> #t)

  (check (words.size_t? (+ 1 SIZE_T_MAX))	=> #f)
  (check (words.size_t? SIZE_T_MAX)		=> #t)
  (check (words.size_t? 0)			=> #t)
  (check (words.size_t? -1)			=> #f)

  (check (words.ssize_t? (+ +1 SSIZE_T_MAX))	=> #f)
  (check (words.ssize_t? SSIZE_T_MAX)		=> #t)
  (check (words.ssize_t? SSIZE_T_MIN)		=> #t)
  (check (words.ssize_t? (+ -1 SSIZE_T_MIN))	=> #f)

  #t)


(parametrise ((check-test-name	'off_t))

  (check (words.off_t? (+ +1 OFF_T_MAX))	=> #f)
  (check (words.off_t? OFF_T_MAX)		=> #t)
  (check (words.off_t? OFF_T_MIN)		=> #t)
  (check (words.off_t? (+ -1 OFF_T_MIN))	=> #f)

  #t)


(parametrise ((check-test-name	'sign))

  (define-syntax positive-doit
    (syntax-rules ()
      ((_ ?who)
       (begin
	 (check-for-true  (?who +1))
	 (check-for-false (?who -1))
	 (check-for-false (?who 0))))
      ))

  (define-syntax negative-doit
    (syntax-rules ()
      ((_ ?who)
       (begin
	 (check-for-false (?who +1))
	 (check-for-true  (?who -1))
	 (check-for-false (?who 0))))
      ))

  (define-syntax non-positive-doit
    (syntax-rules ()
      ((_ ?who)
       (begin
	 (check-for-false (?who +1))
	 (check-for-true  (?who -1))
	 (check-for-true  (?who 0))))
      ))

  (define-syntax non-negative-doit
    (syntax-rules ()
      ((_ ?who)
       (begin
	 (check-for-true  (?who +1))
	 (check-for-false (?who -1))
	 (check-for-true  (?who 0))))
      ))

  (define-syntax doit
    (syntax-rules ()
      ((_ ?positive-who ?non-positive-who
	  ?negative-who ?non-negative-who)
       (begin
	 (positive-doit ?positive-who) (non-positive-doit ?non-positive-who)
	 (negative-doit ?negative-who) (non-negative-doit ?non-negative-who)))
      ))

;;; --------------------------------------------------------------------

  (doit words.positive-word-s8?			words.non-positive-word-s8?
	words.negative-word-s8?			words.non-negative-word-s8?)

  (doit words.positive-word-s16?		words.non-positive-word-s16?
	words.negative-word-s16?		words.non-negative-word-s16?)

  (doit words.positive-word-s32?		words.non-positive-word-s32?
	words.negative-word-s32?		words.non-negative-word-s32?)

  (doit words.positive-word-s64?		words.non-positive-word-s64?
	words.negative-word-s64?		words.non-negative-word-s64?)

  (doit words.positive-word-s128?		words.non-positive-word-s128?
	words.negative-word-s128?		words.non-negative-word-s128?)

  (doit words.positive-word-s256?		words.non-positive-word-s256?
	words.negative-word-s256?		words.non-negative-word-s256?)

;;; --------------------------------------------------------------------

  (doit words.positive-signed-char?		words.non-positive-signed-char?
	words.negative-signed-char?		words.non-negative-signed-char?)

  (doit words.positive-signed-int?		words.non-positive-signed-int?
	words.negative-signed-int?		words.non-negative-signed-int?)

  (doit words.positive-signed-long?		words.non-positive-signed-long?
	words.negative-signed-long?		words.non-negative-signed-long?)

  (doit words.positive-signed-long-long?	words.non-positive-signed-long-long?
	words.negative-signed-long-long?	words.non-negative-signed-long-long?)

  (doit words.positive-ssize_t?			words.non-positive-ssize_t?
	words.negative-ssize_t?			words.non-negative-ssize_t?)

  (doit words.positive-off_t?			words.non-positive-off_t?
	words.negative-off_t?			words.non-negative-off_t?)

  (doit words.positive-ptrdiff_t?		words.non-positive-ptrdiff_t?
	words.negative-ptrdiff_t?		words.non-negative-ptrdiff_t?)

  #t)


;;;; done

(check-report)

;;; end of file
