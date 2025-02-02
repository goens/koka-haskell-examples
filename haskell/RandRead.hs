module RandRead where

import Control.Monad.Random
import Control.Monad.Reader
import Data.Functor.Identity

die :: (RandomGen g) => Int -> Rand g Int
die sides = getRandomR (1,sides)

countOcurrences :: [Int] -> Reader Int Int
countOcurrences vals = do
    n <- ask
    return $ length $ filter (==n) vals

countOcurrencesRolls :: (RandomGen g) => Int -> Int -> RandT g (Reader Int) Int
countOcurrencesRolls sides rolls = do
    vals <- replicateM rolls (mapRandT (return . runIdentity) $ die sides)
    lift $ countOcurrences vals