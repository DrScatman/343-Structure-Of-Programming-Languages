;CIS 343
;Jake Miller
;Gabe Hendrickson
;----------------------------------------------
;Functional Programming Assignment
;Complete the following functions, using MIT-Scheme. If a function exists which already does
;what is asked, do not use it. Rather, create your own. You may refer to
;https://www.gnu.org/software/mit-scheme/documentation/mit-scheme-ref/ for built-in
;function documentation.
;1. Define the two values, pi and e to at least 5 decimal places.

(define pi 3.14159)
(define e 2.71828)


; problem 2
;Write a function called circle-specs. This function will take a single parameter radius and will return a list that provides the circumference and area). So, 
;(circle-specs 10) will return something along the lines of (62.8318 314.159). One caveat; you must use the let function to define the pi * r part so it 
;may be used in both calculations
(define (circle-specs r) (let ((pir (* pi r))) 
  (list (* 2 pir) 
	(* pir r))))

;3. Define a function (logn n val) that calculates the log of val given base n. Use
;this to create a new function (log2 val) which provides the log base 2 of a value. A
;hint – MIT-Scheme has the log function that returns the natural (log base e) log, so
;you will need to convert the bases.
(define (logn n val) 
  (/ (log val) (log n)))
(define (log2 val) (logn 2 val)) 

;4. The map function takes a function and one or more lists and applies the function to
;each element in each (the lists must be the same length). Write a function that will take
;two lists and add them together, producing a new list. For example, if we had (1 2 3
;4) and (5 6 7 8) we should end with (6 8 10 12). No need to define this
;function unless you wish.
(define (add-list a b) (map + a b))

;5. Functional languages have reduce functions as well. Where map applies functions to
;lists, reduce applies a function to combine all elements of a list. For instance, we may
;wish to add each element of a list together, so (1 2 3 4) would result in 10. Define
;a new function called (dot-product vector1 vector2) that will take two
;arbitrary length vectors and calculate the dot product. For (1 2 3 4) (5 6 7 8)
;the return should be the scalar (single number) value 70. Use the reduce-right
;function as well as the function you created in step 3.
(define (mul-list a b ) (map * a b))
(define (reduce lst) (cond ((null? lst) 0) ((pair? (car lst)) (+(reduce (car))(reduce(cdr lst)))) (else (+ (car lst) (reduce (cdr lst)))))) 
(define (dot-product a b) (reduce (mul-list a b)))

;6. Write a function called fib that takes a single parameter and returns the Fibonacci
;number at that position. For instance, (fib 5) will return the value 5, and (fib
;10) will return the value 55.
(define (fib a)(if (< a 2) a  (+ (fib (- a 1)) (fib (- a 2)))))

;7. Create a function called (create-list start end) that creates a list of
;numbers from start to end. (create-list 1 10) will return the list (1 2 3
;4 5 6 7 8 9 10).
(define (create-list start end)
  (iota (+ (- end start) 1) start 1))

;8. Create a new function called fib-list. It will take one parameter and using the
;above functions will return a list of all Fibonacci numbers from 1 to the value of the
;parameter. Therefore, a call of (fib-list 10) will return (1 1 2 3 5 8 13
;21 34 55). This is a very simple function if you compose it from the functions you
;have created and learned about above.
(define (fib-list num)
 (map fib (create-list 1 num)))

;9. Write a function called nth, that is passed a list and a number and returns the nth
;element of the list. Lists are zero indexed.
(define (nth l)(cond ((null? (cdr l)) (car l))(else (nth (cdr l)))))

;10. Write a function called remainder that is given two numbers a and b and returns
;the remainder from dividing a by b. Complete the task by continually subtracting b
;from a.
(define (remainder a b)(if (< a b) a (remainder (- a b) b))) 

(begin

(newline)
(display "===========================================================")
(newline)
(display "Problem 1)")
(newline)
(display "PI = ")(display pi)(newline)
(display "E = ")(newline)(display e)(newline)
(newline)

(display "===========================================================")
(newline)
(display "Problem 2")
(newline)
(display "cirs of 10 is ")(display (circle-specs 10))
(newline)

(display "===========================================================")
(newline)
(display "problem 3")
(newline)
(display "Log base 2 of 10 ")(display (log2 10))
(newline)

(display "===========================================================")
(newline)
(display "problem 4")
(newline)
(display "adding a list of (1 2 3 4) and (5 6 7 8) is ")(display (add-list (list 1 2 3 4) (list 5 6 7 8)))

(newline)
(display "===========================================================")
(newline)
(display "problem 5")
(newline)
(display "the dot product of (1 2 3 4) & (5 6 7 8) is  ")(display (dot-product (list 1 2 3 4)(list 5 6 7 8)))



(newline)
(display "===========================================================")
(newline)
(display "problem 6")
(newline)
(display "fib of 10 is ")(display (fib 3))
(newline)

(newline)
(display "===========================================================")
(newline)
(display "problem 7")
(newline)
(display "A list from 1 to 10 ")(display (create-list 1 10))
(newline)

(newline)
(display "===========================================================")
(newline)
(display "problem 8")
(newline)
(display "Fib numbers list from 1 to 10 ")(display (fib-list 10))
(newline)

(display "===========================================================")
(newline)
(display "problem 9)")
(newline)
(display "The nth element in a b c d e f g is ") (display (nth (list 'a 'b 'c 'd 'e 'f 'g)))
(newline)

(display "===========================================================")
(newline)
(display "Problem 10)")
(newline)
(display "100 mod 13 = ")(display (remainder 100 13 ))

)
(exit)

