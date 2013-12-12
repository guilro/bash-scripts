#!/bin/bash

[ $1 -eq 0 ] 2>/dev/null
if  [ $? -ne 0 -a $? -ne 1 ]
then
	echo "Usage : work.sh [delay]";
	exit;
fi



N=0;
O=0;

while true
do
	sleep $((60*$1))
	cvlc son.ogg >> /dev/null 2>&1 &
	rep="?"
	while [ $rep != "O" ] && [ $rep != "N" ]
	do
		echo "Suis-je entrain de travailler ? (O/N)"
		read rep;
	done
	if [ $rep = "N" ]
	then
		N=`expr $N + 1` ;
		echo "Pas bien !";
	elif [ $rep = "O" ];
	then
		O=`expr $O + 1`;
		echo "Bien !";
	fi

	echo "Oui : $O";
	echo "Non : $N";
done
