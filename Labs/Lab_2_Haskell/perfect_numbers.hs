factors n = [x | x <- [1..(n-1)], mod n x == 0]
isPerfect n = (foldl (+) 0 (factors n)) == n

