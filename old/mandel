#!/bin/csi -s
#!
#! mandel -- display mandelbrot sets.
#! mostly stolen from Rosetta Code
#! and Stack Overflow 8-)

(import (chicken process-context))
(define (mklist b e)
    (cond ((= b e) (list b))
        (else (cons b (mklist ((if (< b e) + -) b 1) e)))))

(define (mandel x-size)
    (define y-size (floor (/ x-size 2.80952)))
    (define min-im -1)
    (define max-im  1)
    (define min-re -2)
    (define max-re  1)

    (define step-x (/ (- max-re min-re) x-size))
    (define step-y (/ (- max-im min-im) y-size))

    (for-each (lambda (y)
        (let ((im (+ min-im (* step-y y))))
            (for-each (lambda (x)
                (let*((re (+ min-re (* step-x x)))
                        (zr (exact->inexact re))
                        (zi (exact->inexact im)))
                    (let loop ((n 0) (zi zi) (zr zr))
                        (let ((a (* zr zr))
                            (b (* zi zi)))
                        (cond
                            ((> (+ a b) 4)
                                (display (integer->char (- 62 n))))
                            ((= n 30)
                                (display (integer->char (- 62 n))))
                            (else
                                (loop (+ n 1) (+ (* 2 zr zi) im) (- (+ a re) b))))))))
                (mklist 0 x-size))
            (print)))
        (mklist 0 y-size)))

(cond
    ((null? (command-line-arguments))
        (mandel 80))
    (else
        (mandel (string->number
            (car (command-line-arguments))))))
