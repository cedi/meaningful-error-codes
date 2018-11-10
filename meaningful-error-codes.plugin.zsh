precmd_functions+=(_exit_status)

function _signal_name() {
	case $1 in
		1  ) print -rP "SIGHUP" ;;
		2  ) print -rP "SIGINT" ;;
		3  ) print -rP "SIGQUIT" ;;
		4  ) print -rP "SIGILL" ;;
		5  ) print -rP "SIGTRAP" ;;
		6  ) print -rP "SIGABRT" ;;
		7  ) print -rP "SIGBUS" ;;
		8  ) print -rP "SIGFPE" ;;
		9  ) print -rP "SIGKILL" ;;
		10 ) print -rP "SIGUSR1" ;;
		11 ) print -rP "SIGSEGV" ;;
		12 ) print -rP "SIGUSR2" ;;
		13 ) print -rP "SIGPIPE" ;;
		14 ) print -rP "SIGALRM" ;;
		15 ) print -rP "SIGTERM" ;;
		16 ) print -rP "SIGSTKFLT" ;;
		17 ) print -rP "SIGCHLD" ;;
		18 ) print -rP "SIGCONT" ;;
		19 ) print -rP "SIGSTOP" ;;
		20 ) print -rP "SIGTSTP" ;;
		21 ) print -rP "SIGTTIN" ;;
		22 ) print -rP "SIGTTOU" ;;
		23 ) print -rP "SIGURG" ;;
		24 ) print -rP "SIGXCPU" ;;
		25 ) print -rP "SIGXFSZ" ;;
		26 ) print -rP "SIGVTALRM" ;;
		27 ) print -rP "SIGPROF" ;;
		28 ) print -rP "SIGWINCH" ;;
		29 ) print -rP "SIGIO" ;;
		30 ) print -rP "SIGPWR" ;;
		31 ) print -rP "SIGSYS" ;;
		34 ) print -rP "SIGRTMIN" ;;
		*) print -rP "$1" ;;
	esac
}

function _exit_status() {
	local last_exit_code=$?

	if [ "$last_exit_code" -ne "0" ] ; then
		local description=""
		case $last_exit_code in
			1 ) description="(Catchall for general errors)" ;;
			2 ) description="(Misuse of shell builtins)" ;;
			126 ) description="(Command invoked cannot execute)" ;;
			127 ) description="(command not found)" ;;
			128 ) description="(Invalid argument to exit)" ;;
			130 ) description="(Script terminated by Control-C)" ;;

			# Default case with no special meaning
			*)
			if [ $last_exit_code -gt 128 ] && [ $last_exit_code -lt 163 ] ; then
				description="(received signal $(_signal_name $(($last_exit_code - 128))))"
			fi
		esac

		if [ -z $description ] ; then
			export exit_status="$last_exit_code"
		else
			export exit_status="$last_exit_code $description"
		fi
	else
		export exit_status=""
	fi
}
