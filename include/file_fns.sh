#!/bin/sh
# All file management or filesystem interactive functions

checkDepDir () {		# Check for directpory structure
	if [ ! -d $1 ]
	then
		echo "Missing $1 directory!"
		exit 1
	fi
}

checkDepFile () {		# Check for list of files within a directory
	if [ ! -r $1 ]
	then
		echo "Missing File $1!"
		exit 1
	fi
}

checkDepApp () {		# Check for an application
	if [ ! -e $1 ]
	then
		echo "Missing application on path $1!"
		exit 2
	fi
}

loadPrefs () {
	echo "Please provide your username to load your preferences [default]"
	read -p "Username: " username

	defpref= 'default.pref'
	userPref= $username+='.pref'
	if [ ! -r prefs/$userPref ]
	then
		echo "Missing specified prefs file. Using default prefs instead..."
		currPref= 'default.pref'
	else
		currPref= $userPref
	fi

	. prefs/$currPref
}