INITIAL_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2
WINNING_POSITION=100

player1Position=$INITIAL_POSITION
player2Position=$INITIAL_POSITION

declare -a positionTrack1
declare -a positionTrack2
count1=0
count2=0
while [[ $player1Position -ne $WINNING_POSITION && $player2Position -ne $WINNING_POSITION ]]
do
	rollTheDie=$((RANDOM%6 + 1))
	((count1++))
	optionForPlayer=$LADDER
	while((optionForPlayer==LADDER))
	do
		optionForPlayer=$((RANDOM%3))

		case $optionForPlayer in
		$NO_PLAY)
			player1Position=$(( player1Position + 0 ))
			;;
		$SNAKE)
	                player1Position=$(( player1Position - rollTheDie ))
			;;
		$LADDER)
	                player1Position=$(( player1Position + rollTheDie ))
			;;
		esac


		if [ $player1Position -gt  $WINNING_POSITION ]
		then
			player1Position=$(( player1Position - rollTheDie ))
		elif [ $player1Position -lt $INITIAL_POSITION ]
		then
			player1Position=$INITIAL_POSITION
		fi
		positionTrack1[$count1]=$player1Position
	done
	if [ $player1Position -ne $WINNING_POSITION ]
	then
		rollTheDie=$((RANDOM%6 + 1))
	        ((count2++))
        	optionForPlayer=$LADDER
		while((optionForPlayer==LADDER))
		do
			optionForPlayer=$((RANDOM%3))

	        	case $optionForPlayer in
	        	$NO_PLAY)
	                	player2Position=$(( player2Position + 0 ))
	                	;;
	        	$SNAKE)
	                	player2Position=$(( player2Position - rollTheDie ))
	                	;;
	        	$LADDER)
	                	player2Position=$(( player2Position + rollTheDie ))
	                	;;
	        	esac


		        if [ $player2Position -gt  $WINNING_POSITION ]
		        then
		                player2Position=$(( player2Position - rollTheDie ))
		        elif [ $player2Position -lt $INITIAL_POSITION ]
		        then
		                player2Position=$INITIAL_POSITION
		        fi
		        positionTrack2[$count2]=$player2Position
		done
	fi
done

if  [ ${positionTrack1[$count1]} -eq $WINNING_POSITION ]
then
	echo "Winner is player1"
else
	echo "Winner is player2"
fi
