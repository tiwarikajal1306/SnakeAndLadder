#!/bin/bash -x
INITIAL_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2
WINNING_POSITION=100

playerPosition=$INITIAL_POSITION
while [ $playerPosition -le $WINNING_POSITION ]
do
	rollTheDie=$((RANDOM%6 + 1))
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


	if [ $playerPosition -lt  0 ]
	then
		playerPosition=$INITIAL_POSITION
	fi

	echo "Player Position is $playerPosition"
done
