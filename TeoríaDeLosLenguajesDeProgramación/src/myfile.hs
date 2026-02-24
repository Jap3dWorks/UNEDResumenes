import Prelude
main :: IO()

long n
  | n < 10 = 1
  | otherwise = 1 + long (div n 10)

main = print(show(long 100))


