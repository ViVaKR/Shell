#! /usr/bin/bash
sum=0
for i in `seq 10`
do
	sum=`expr $sum + $i`
done

echo " \$sum ==> $sum "
