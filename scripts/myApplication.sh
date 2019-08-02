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

test_suites(){
	printf "\n[ INFO ][ `date -v1m -v+1y` ]:Run test suite cases\n"
	#Call button_test cases
	test_case="$DIR/test_cases"
	/bin/sh $test_case/button_tests.sh UP
	/bin/sh $test_case/button_tests.sh LEFT
	/bin/sh $test_case/button_tests.sh RIGHT
	/bin/sh $test_case/button_tests.sh DOWN
	printf "[ INFO ]:End of test cases\n"
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
	test_suites | tee -a $unitTestResults

	printf "\n[ Navigation app ]: $navigationApp"
	printf "\n[ Test results ]: $unitTestResults"
	if [ ` grep -c "NOK" $unitTestResults ` == 0 ];then
		echo "\n$GREEN[ INFO ]:All tests passed, code ready for deployment\n$RESET"
	else
		echo "\n$RED[ INFO ]:Some tests failed, code not ready for deployment\n$RESET"
	fi
	clean_up
}

main $@
exit 0
