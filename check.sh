#!/bin/bash

url='https://www.mtgox.com/news'
#url='http://bmr.io/foo.txt'
file=/tmp/tmp.last
last=`cat "$file"`
next=`curl "$url" -s | grep -Ev '(token|lastPrice|highPrice|volume|weightedAverage)' | md5`

#echo "last: $last"

if [ -z "$last" ]; then
    echo $next
    echo $next > "$file"
else
    if [ "$last" != "$next" ]; then
        echo "Changed!"
        echo $next
        echo $next > "$file"
    #else
    #    #echo "Not changed!"
    #    echo "."
    fi
fi
