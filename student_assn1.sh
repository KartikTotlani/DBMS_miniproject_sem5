clear
while [ 1 ]
do
	echo 1.Create 2.Display 3.Insert 4.Search 5.Modify 6.Delete 7.Exit

	echo "Enter Choice : "
	read ch
	case $ch in
		1)
			echo "Enter File name : "
			read fname
			if [ -e $fname ]
			then
				echo "File Already Exists"
			else
				>> $fname
				echo "File Created Successfully"
			fi
			;;
		2)
			echo "Enter file Name : "
			read fname
			if [ -e $fname ]
			then
				echo "The Content of File : "
				sort -n $fname
			else
				echo "File Not Exists:"
			fi
			;;
		3)
			echo "Enter the File Name : "
			read fname
			if [ -e $fname ]
			then
				echo "Enter Roll Number : "
				read roll
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ]
				then
					echo "Record Already Exists"
				else
					echo -n "Enter Name : "
					read name
					echo $roll $name >> $fname
					echo "Record Inserted Successfully"
				fi
			else
				echo "File Do not Exists"
			fi
			;;
		4)
			echo -n "Enter the File Name : "
			read fname
			if [ -e $fname ]
			then
				echo -n "Enter the Roll Number : "
				read roll
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ]
				then
					echo "Record Found"
				else
					echo "Record Not Found"
				fi
			else
				echo "File Do Not Exists"
			fi
			;;
		5)
			echo -n "Enter the File Name : "
			read fname
			if [ -e $fname ]
			then
				echo -n "Enter the Roll Number : "
				read roll
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ]
				then
					echo -n "Enter New Roll Number And Name : "
					read nroll nname
					grep -w "$nroll" $fname
					ans=$?
					if [ $ans -eq 0 ]
					then
						echo "Roll Number Already Exists Try New Number "
					else
						grep -v "$roll" $fname >> temp
						echo "$nroll $nname" >> temp
						rm $fname
						cp temp $fname
						rm temp
						echo "Record Modifies Successfully"
					fi
				else
					echo "Roll Number Do Not Exists : "
				fi
			else
				echo "File Do Not Exists"
			fi
			;;
		6)
			echo -n "Enter the File Name : "
			read fname
			if [ -e $fname ]
			then
				echo -n "Enter the Roll Number : "
				read roll
				grep -w "$roll" $fname
				ans=$?
				if [ $ans -eq 0 ]
				then
					grep -v "$roll" $fname >> temp
					rm $fname
					cp temp $fname
					rm temp
					echo "Record Deleted Successfully"
				else
					echo "Roll Number Do Not Exists"
				fi
			else
				echo "File Do Not Exists"
			fi
			;;
		7)
			exit
			;;
		*)
			echo "Enter Correct Option"
			;;
	esac
done

