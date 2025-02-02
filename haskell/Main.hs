import Pure
import RandRead
import Control.Monad.Random.Lazy
import Control.Monad.Reader

main :: IO ()
main = do 
   putStrLn $ show $ hsPure 3 4
   gen <- newStdGen
   let randNum = evalRand (die 6) gen
   putStrLn $ show randNum
   let randRolls = runReader (evalRandT (countOcurrencesRolls 6 10) gen) 6
   putStrLn $ show randRolls
