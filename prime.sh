echo Enter the Number : 
read n
flag=0
i=2
m=`expr $n \/ 2`
while [ $i -lt $m ]
do
	rem=`expr $n % $i`
	if [ $rem -eq 0 ]
	then
		flag=1
		break
	fi
	i=`expr $i + 1`
done
if [ $flag -eq 0 ]
then
	echo "Number is prime"
else
	echo "Number is not prime"
fi
