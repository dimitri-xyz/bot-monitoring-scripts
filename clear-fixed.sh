# clear-fixed.sh lock_indetifier args
resolver.sh $1
stdbuf -oL -eL $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} >> "log-$1-`date \"+%Y-%m-%d-%H-%M-%S.log\"`" 2>&1
exit_code=$?

# I am affraid unknown error paths can inadvertently return exit code 0, so using 55 for "Shutdown Success"

# Remove lock upon normal termination
if [ "$exit_code" -eq 55 ]; then

    lock_name="`ls | grep \"^remove-me-dir-$1-.\"`"

    if rmdir "$lock_name" ; then
        echo "lock file $lock_name removed"
    else
	exit_code=$?
        echo "Unable to self-unblock lock"
    fi

fi
echo "Program shutdown exit code (including lock removal) is:< $exit_code >"
exit $exit_code
