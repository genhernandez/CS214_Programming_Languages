factors n = [x | x <- [1..(n-1)], mod n x == 0]
--prime_factors n = [x | x <- mod 2 [1..(n-1)], mod n x == 0]
isPrime n = length (factors n) == 1
isPrime2 n = length (take 2 (factors n)) == 1
--isPrime3 n = length (prime_factors n) == 1