echo Enter three numbers
read a b c
if [ $a -eq $b -a $a -eq $c ]
then
	echo "All Numbers are equal"
elif [ $a -ge $b -a $a -ge $c ]
then
	echo "$a is greater"
elif [ $b -ge $a -a $b -gt $c ]
then
	echo "$b is greater"
elif [ $c -ge $a -a $c -ge $b ]
then
	echo "$c is greater"
fi

