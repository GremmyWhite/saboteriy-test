#!/usr/bin/env bash

for i in {1..100}
do 

if [[ $(( (i-1)%10 )) = 0 ]]
then echo ""
fi

if [[ $((i%15)) = 0 ]]
then i="fizzbuzz"
elif [[ $((i%5)) = 0 ]]
then i="buzz"
elif [[ $((i%3)) = 0 ]]
then i="fizz"
fi

echo -n "$i "

done


