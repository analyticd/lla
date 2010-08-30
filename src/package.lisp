(in-package #:lla-asd)

(defpackage #:lla
    (:use :common-lisp :cl-utilities :iterate :bind :cffi
          :anaphora :tpapp-utils :cl-num-utils)
  (:shadowing-import-from :iterate :collecting :collect)
  (:export 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
   ;; utilities

   zero-like simple-array1 simple-array? simple-array1? as-simple-array1
   
   ;; types
   
   dimension *lla-warn-suboptimal* lla-suboptimal-warning lla-type lla-complex?
   lla-double? real-lla-type complex-lla-type not-within-lla-type
   invalid-lla-type lla->lisp-type lla-vector-type representable-lla-type
   array-lla-type lla-array atom-representable-lla-type zero* coerce* epsilon*
   common-lla-type pack packf
   
   ;; fortran-atoms -- nothing is exported

   ;; copy-elements

   copy-elements copy-vector cm-index2 copy-columns
   
   ;; pinned-vectors -- nothing is exported

   ;; matrix-classes
   
   elements dense-matrix-like mref mref-setting-readonly
   square-matrix? square-matrix valid-matrix-kind? matrix-kind
   dense-matrix upper-matrix lower-matrix hermitian-matrix
   set-restricted restricted-elements make-matrix copy-matrix

   ;; diagonal
   
   diagonal make-diagonal

   ;; printing

   *print-lla-precision* *pring-matrix-aligned* *print-matrix-padding*

   ;; clo

   clo

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; operations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;; elementwise-operations

   emap e+ e- e* e/ eexpt eexp elog esqrt ereduce emax emin 
   *lla=-difference* lla= lla==

   ;; transpose

   conjugate-transpose

   ;; conversions

   as-diagonal as-matrix as-array as-row as-column

   ;; matrix-operations

   stack stack* eye

   ;; specialized-utilities -- nothing is exported, already done by CLNU
   
   ;; sub -- nothing is exported, already done by CLNU

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; pinned-vector
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ;; nothing is exported

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; linear-algebra
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
   ;; ;; factorizations
   
   matrix-factorization component reconstruct lu lu-matrix ipiv
   permutations qr qr-matrix cholesky factor hermitian

   ;; linear-algebra

   dot norm1 norm2 normsup mm mmm outer update-hermitian update-hermitian2 lu
   hermitian solve invert eigen least-squares qr-xx-inverse-sqrt
   constrained-least-squares cholesky svd tr rank logdet det matrix-cond
   
   ))
