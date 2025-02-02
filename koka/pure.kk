fun add-twice( x : int) : int
  x + x

fun fib(n : int) : div int
  if n < 2 then
    n
  else
    fib(n - 1) + fib(n - 2)

fun simple-recursion(l : list<int>) : int
  match l
    Nil -> 0
    Cons(x, xs) -> x + simple-recursion(xs)

fun broken-recursion(l : list<int>) : div int
  match l
    Nil -> 0
    Cons(x, xs) -> x + broken-recursion(Cons(x+1,xs))
  
fun ack(x, y : int) : div int
  match (x, y)
    (0,   y) -> y+1
    (x, 0)    -> ack(x - 1, 1)
    (x, y)    -> ack(x - 1, ack(x,y - 1))

fun safe-div(x, y : int) : exn int
  if y == 0 then
    throw-exn(Exception("Division by zero", ExnError))
  else
    x / y

fun hs-pure(x,y : int) : pure int
  ack(x, safe-div(x + y, y))

fun main()
  println(add-twice(5))
  println(fib(10))
  println(simple-recursion(Cons(1,Cons(2,Cons(3,Nil)))))
  println(broken-recursion(Nil))
  println(safe-div(5, 1))
  println(ack(2, 5))
  println(hs-pure(3, 3))