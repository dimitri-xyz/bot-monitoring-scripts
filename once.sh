# once.sh lock_identifier script_to_run [args]
# Executes the script_to_run once. locking directory must
# be manually removed to run script_to_run again

# check lock -- assumes no race condition
if [ ! -e "`ls | grep \"^remove-me-dir-$1-.\"`" ]
then
    #we're good. acquire lock
    if mkdir "remove-me-dir-$1-`date \"+%Y-%m-%d-%H-%M-%S-lock\"`"; then
        echo "Acquired lock, running"
        # Processing starts here -- pass lock_identifier along with other args
        $2 $1 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13}
    fi
else
    # blocked
    echo "Blocked. File `ls | grep \"^remove-me-dir-$1-.\"` exists."
fi
