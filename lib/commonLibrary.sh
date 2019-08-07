#!/bin/sh
#Library functions

#------------------- set variables -------------------#
set_variables(){
        DIR=.
        GREEN="\033[32m"
        RED="\033[31m"
	CYAN="\033[36m"
        RESET="\033[0m"
	navigationApp="data/navigation.app"
}

#------------------- exit status -------------------#
exit_status(){
        err_code=$1
        if [ $err_code != 0 ];then
                printf "\n$RED[ ABORT ]: Program exited with error status!!!$RESET\n"
                exit 1;
        else
                continue;
        fi
}


#------------------- clean files -------------------#
clean(){
	filename=$1
	if [ -f $filename ];then
		printf "\n----------\nAre you sure you want to delete the file: '$filename' | yes or no?  "
		read response
		if [ ! -z ` echo $response | egrep -iw "y|Y|Yes|YES|yES|yes" ` ];then
			rm -f $filename
			printf "User adviced, '$filename' file deleted"
		else
			printf "User denied, '$filename' file not deleted"
		fi
	else
		printf "\n----------\n'$filename' filename not found, unable to delete\n"
	fi
	printf "\n"
	exit_status 0
}
