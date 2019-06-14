;Problem 1 define pi and e
(define pi 3.14159)
(define e 2.71828)
(begin 
	(display pi)
	(newline)
	(display e)
	(newline))


(define (circle-specs r) (let ((pir (* pi r))) 
  (list (* 2 pir) 
	(* pir r))))

(begin (display (circle-specs 10))
       (newline))(exit)

(define (logn n val))

