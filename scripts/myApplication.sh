#!/bin/sh
. lib/commonLibrary.sh


build_myApp(){
	printf "\n[ INFO ]: Building my app..."
	code_file="$DIR/code/develop_nav.sh"
	if [ -f $code_file ];then
		printf "\n[ OK ]: App built\n"
		exit_status 0 
	else
		printf "\n[ NOK ]: Error building the App!!! exiting the program...\n"
		exit_status 1 
	fi
}

run_myApp(){
	printf "\n[ INFO ]: Run the application"
	/bin/sh $code_file >$navigationApp
	cat $navigationApp
}

clean_up(){
	rm -f $navigationApp
	rm -f $unitTestResults
}

main(){
	set_variables #Library function called
        unitTestResults="logs/unitTestResults.txt"
        echo "">$unitTestResults

	build_myApp
	run_myApp
}

main $@
exit 0
