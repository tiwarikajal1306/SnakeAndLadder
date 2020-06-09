INITIAL_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2
WINNING_POSITION=100

playerPosition=$INITIAL_POSITION

declare -a positionTrack

count=0
while [ $playerPosition -ne $WINNING_POSITION ]
do
	rollTheDie=$((RANDOM%6 + 1))
	((count++))
	optionForPlayer=$((RANDOM%3))

	case $optionForPlayer in
	$NO_PLAY)
		playerPosition=$(( playerPosition + 0 ))
		;;
	$SNAKE)
                playerPosition=$(( playerPosition - rollTheDie ))
		;;
	$LADDER)
                playerPosition=$(( playerPosition + rollTheDie ))
		;;
	esac


	if [ $playerPosition -gt  $WINNING_POSITION ]
	then
		playerPosition=$(( playerPosition - rollTheDie ))
	elif [ $playerPosition -lt $INITIAL_POSITION ]
	then
		playerPosition=$INITIAL_POSITION
	fi
	positionTrack[$count]=$playerPosition
done

for((counter=1;counter<=count;counter++))
do
	echo "chance $counter : ${positionTrack[$counter]}"
done
echo "Number of chances played : $count"
