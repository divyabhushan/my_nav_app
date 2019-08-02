#!/bin/sh
. lib/commonLibrary.sh

button_test(){
	if [ $# -ne 1 ];then
		echo "\nUSAGE: [ $0 ] [ button_name ]\n"
		exit_status 1
	fi
        button_name=$1
        found=` grep -iw "$button_name" $navigationApp `
        if [ ! -n "$found" ];then
                printf "$RED[ NOK ]:Button \"$button_name\" missing $RESET"
        else
                printf "$GREEN[ OK ]:Button \"$button_name\" present $RESET"
        fi
}

main(){
	set_variables
	button_test $1
	printf "\n"
	exit 0;
}

main $@

