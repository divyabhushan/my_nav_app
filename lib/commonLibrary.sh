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


