module Small where

import Control.Monad.Reader

foo :: () -> Reader Int Bool
foo _ = do
  a <- ask
  return (a == 0)

main :: IO ()
main = do
  putStrLn $ show $ runReader (foo ()) 4
