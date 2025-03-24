module Pure where

addTwice :: Int -> Int
addTwice x = x + x

simpleRecursion :: [Int] -> Int
simpleRecursion [] = 0
simpleRecursion (x:xs) = x + simpleRecursion xs

brokenRecursion :: [Int] -> Int
brokenRecursion [] = 0
brokenRecursion (x:xs) = x + brokenRecursion (x+1:xs)

fib :: Int -> Int
fib n = if n < 2 then n else fib (n - 1) + fib (n - 2)

ack :: Int -> Int -> Int
ack 0 y = y + 1
ack x 0 = ack (x-1) 1
ack x y = ack (x-1) (ack x (y-1))

safeDiv :: Int -> Int -> Int
safeDiv x y = if y == 0 then error "Division by zero" else x `div` y

hsPure :: Int -> Int -> Int
hsPure x y = ack x (safeDiv (x + y) y)