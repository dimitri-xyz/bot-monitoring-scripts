# finally.sh lock_id termination_script script_to_run
# Executes termination_script after script_to_run
# even if an exception happens

# Pass lock_id along as argument to both follow on scripts
# Pass exit code as first argument to termination_script

#Works for SIGTERM and SIGINT(Ctrl-C)
# I must explicitly pass the exit code into the trap
# and must escape "$?" with '\' to prevent immediate resolution of exit code
trap "$2 \$? $1 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13}" EXIT
echo "Trap set, running"
# Processing starts here
$3 $1 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13}
