fun die(sides : int) : ndet int 
  uniform(1, sides)

fun countOcurrences(vals : list<int>) : read<int> int
  n := get();
  length(filter(fn(x){x == n}, vals))


// countOcurrencesRolls :: (RandomGen g) => Int -> Int -> RandT g (Reader Int) Int
// countOcurrencesRolls sides rolls = do
//     vals <- replicateM rolls (mapRandT (return . runIdentity) $ die sides)
//     lift $ countOcurrences vals
//     