
effect boolean-state
  fun getb() : bool 
  fun put_tt() : ()
  fun put_ff() : ()

fun toggle() : boolean-state bool  
  val s = getb() 
  if s then
    put_ff()
    !s
  else
    put_tt()
    !s

effect int-state
  fun geti() : int 
  fun seti( x : int ) : ()

fun increment() : int-state ()
  seti(geti() + 1)

effect nondet
  fun choose() : bool
  fun fail() : void

type coin
  Heads
  Tails

fun drunkToss() : nondet coin
  if choose() then 
    if choose()
    then Heads
    else Tails
  else
    fail()
    Heads // need to return a coin

fun run-boolean-state(init : bool, action : () -> <boolean-state,div|e> b ) : <div|e> b
  var st := init
  with handler
    fun getb() st
    fun put_tt() st := True
    fun put_ff() st := False
  action()

fun true-choice(action : () -> <nondet, exn|e> b)  : <exn|e> b
  with handler
    fun choose() True
    fun fail() throw-exn(Exception("failure", ExnError))
  action()

effect nondet'
  ctl choose'() : bool

fun true-choice' (action : () -> <nondet'|e> b)  : <|e> b
  with handler
    fun choose'() True
  action()

fun all-choices (action : () -> <nondet'|e> b)  : <|e> list<b>
  with handler
    return(x)    [x]
    ctl choose'() resume(False) ++ resume(True)
  action()

fun coinToss() : nondet' coin
  if choose'()  then Heads else Tails

// to be able to print coins as strings
pub fun coin/show( c : coin ) : string
  match c
    Heads -> "Heads"
    Tails -> "Tails"

fun main()
  println(run-boolean-state(False, { toggle();toggle();toggle()}))
  println(true-choice'(coinToss))
  println(all-choices(coinToss))