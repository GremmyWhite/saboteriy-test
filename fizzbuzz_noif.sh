for i in {1..100}
do
  ([ $(($i%15)) = 0 ] && echo -n "FizzBuzz ") ||
  ([ $(($i%3)) = 0 ] && echo -n "Fizz ") ||
  ([ $(($i%5)) = 0 ] && echo -n "Buzz ") ||
  echo -n "$i "
done
