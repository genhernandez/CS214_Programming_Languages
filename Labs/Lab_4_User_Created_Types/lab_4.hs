data MyNum = Fraction {numerator :: Integer, denominator :: Integer}| Mixed {whole :: Integer, numerator :: Integer, denominator :: Integer}
instance Show MyNum where
    show (Fraction n d) = (show n) ++ "/" ++ (show d)
    show (Mixed w n d) = (show w) ++ " " ++ (show n) ++ "/" ++ (show d)
instance Eq MyNum where
    x == y = doubleValue (x) == doubleValue (y)
instance Ord MyNum where
    compare x y = compare (doubleValue x) (doubleValue y)

doubleValue (Fraction n d) = (fromIntegral n) / (fromIntegral d)
doubleValue (Mixed w n d) = (fromIntegral w) + (fromIntegral n) / (fromIntegral d)
